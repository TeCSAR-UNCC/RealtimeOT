/*
 * blob_tracking.c
 *
 *  Created on: May 4, 2015
 *      Author: xufaneric
 */

#include <math.h>
#include "blob_tracking.h"
#include "vdma_cfg.h"
#include "object_focus.h"
#include "common_value_defination.h"
#include "xtime_l.h"
#include "matrix.h"
#include "kalman_filter_helper.h"



#define MAXSCORE 10000
//#define APPEAR_THRESHOLD 4
//#define DiSAPPEAR_THRESHOLD 4
//#define SCORE_THRESHOLD 150


struct Bloblist_Tracking Bloblist;
struct sBloblist m_Bloblist_past_0, m_Bloblist_past_1;
int frame_counter;

double time_stage1,time_stage2,time_stage3,time_stage4,time_stage5,time_stage6; //time counter
int sum_List_size, sum_mul_List_mList, return_frame_num;

#ifdef LABELING
//static u8 labelCheckList[10]={0};
#define LabelSize 100
struct LabelPos {
	int size;
	int ID[LabelSize];
	int LeftUpI[LabelSize], LeftUpJ[LabelSize], RightDownI[LabelSize], RightDownJ[LabelSize], CentI[LabelSize], CentJ[LabelSize];
	int RecentUsed[LabelSize];
	int Wait[LabelSize];
} Label;
#endif

u32 getPixelValue(int, int);

void blob_tracking(int APPEAR_THRESHOLD, int DiSAPPEAR_THRESHOLD, int SCORE_THRESHOLD)
{
	int i,j,k;
	struct sBloblist m_Bloblist, m_Bloblist_new, m_Bloblist_new_no_cover; //para1 for result, para2 & 3 for kalman and no cover
	u32 *read_pointer;
	int M_status = 0;
//	*********Initialize frame counter****************
	if (frame_counter < 0 || frame_counter > 30000)
		return_frame_num=sum_List_size=sum_mul_List_mList=frame_counter = time_stage1=time_stage2=time_stage3=time_stage4=time_stage5=time_stage6 = 0;

	Xil_DCacheFlush();

//	printf("************************************************\n\r");
	XTime start, finish, stage1, stage2, stage3, stage4, stage5;
	double time;
	int min_x = 0, min_y = 0, wx = 0, wy = 0, label = 0;
	XTime_GetTime(&start);
	int COMM_VAL_cur = COMM_VAL - 1;


	/****************************************
	 *   Read the data from the 1st core    *
	 ****************************************/
#ifdef PRT
	xil_printf("COMM_VAL is %d/%d\n\r", COMM_VAL, COMM_VAL_cur);
#endif

	if (!COMM_VAL_cur)
	{
		m_Bloblist = Bloblist_Buf0;
		read_pointer = VOVRLAY_READ_REGION + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY;
	}
	else
	{
		m_Bloblist = Bloblist_Buf1;
		read_pointer = VOVRLAY_READ_REGION;
	}
#ifdef PRT
	xil_printf("(detect) is (%d) \r\n", m_Bloblist.blobtotal);
#endif
//	******************delete previous image*****************
	if (!COMM_VAL_cur)
	{
//			xil_printf("first loop \n\r");
		for (i=0 ; i< m_Bloblist_past_0.blobtotal; i++)
		{
			object_focus (m_Bloblist_past_0.blob[i].min_x, m_Bloblist_past_0.blob[i].min_y, m_Bloblist_past_0.blob[i].wx, m_Bloblist_past_0.blob[i].wy,	read_pointer, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID,0);
		}
	}
	else
	{
//			xil_printf("second loop \n\r");
		for (i=0 ; i< m_Bloblist_past_1.blobtotal; i++)
		{
			object_focus (m_Bloblist_past_1.blob[i].min_x, m_Bloblist_past_1.blob[i].min_y, m_Bloblist_past_1.blob[i].wx, m_Bloblist_past_1.blob[i].wy,	read_pointer, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID,0);
		}
	}

//	*****************timing for defuse prv blob**************
	XTime_GetTime(&stage1);

// 	 *************************************
//	 *   All blobs in list +1 miss       *
//	 *   when hit, +1 hit, -1 miss       *
//	 *   and update the data			 *
//	 *   Initialization for List
//	 *************************************
	#ifdef LABELING //preparation for labelling
		for (i = 0; i < Label.size; ++i)
			if (Label.RecentUsed[i]) {
				Label.RecentUsed[i]++;
				if (Label.RecentUsed[i] > LABELTHRES)
					Label.RecentUsed[i] = 0;
				Label.Wait[i] = 1;
			}
		while (Label.size && !Label.RecentUsed[Label.size-1])
			Label.size--;
	#endif

	for(i = 0; i < Bloblist.totalNumber; i++)
	{
		if(!Bloblist.blob[i].isInListFlag) {continue;}
		Bloblist.blob[i].missCounter++;
		Bloblist.blob[i].isNewAdded = 0;
		Bloblist.blob[i].minScore = MAXSCORE;
	}
	if(COMM_VAL != COMM_VAL_cur + 1) {return_frame_num++;return;}

//	xil_printf("m_Bloblist.blobtotal = %d\n\r", m_Bloblist.blobtotal);
	struct Blob_Tracking blobTest;  //read one of the blobs, and convert its pos/size information
	u32 x, y, C0, C1, pixelValue, pixelNumber, h_i; //for histogram
	int minScore, currentScore, score, histScore; //calculate the score of detected blob[i]
	int listID, id; //save the result of comparison
	int velocityNum; //update the info. of existence blob in list
	int compared;
	//int n = 0;

//	************Setup Default Position with Kalman Filter********************
#ifdef KALMAN
	/*
	for(i = 0; i < Bloblist.totalNumber; i++)
	{
		if(!Bloblist.blob[i].isInListFlag) {continue;}
		blobTest.centerX = Bloblist.blob[i].centerX + (KALMAN_PARAM_f * Bloblist.blob[i].velX);
		blobTest.centerY = Bloblist.blob[i].centerY + (KALMAN_PARAM_f * Bloblist.blob[i].velX);
		blobTest.width = Bloblist.blob[i].width;
		blobTest.height = Bloblist.blob[i].height;
		memset(blobTest.histogram, 0, sizeof(blobTest.histogram));
		for (y = blobTest.centerY - (blobTest.height >> 1); y < blobTest.centerY + (blobTest.height >> 1); y++)
			for (x = blobTest.centerX - (blobTest.width >> 1) ; x < blobTest.centerX + (blobTest.width >> 1); x+=2)
			{
				pixelValue = getPixelValue(x,y);
				C1 = pixelValue >> 24;
				C0 = (pixelValue & 0x0000FF00) >> 8;
				blobTest.histogram[C1]++;
				blobTest.histogram[C0]++;
			}

		pixelNumber = (blobTest.height & 0xFFFFFFFE) * (blobTest.width & 0xFFFFFFFE); //(height - height % 2) * (width - width % 2)
		for (j = 0; j < 256; j++) //normalization the histogram for blob[i]
			blobTest.histogram[j] = ((blobTest.histogram[j] << 9)  + pixelNumber / 2) / pixelNumber; //Normalized to 512 instead of 500
		score = 0, histScore = 0;
		score += fabs(blobTest.centerX - Bloblist.blob[j].centerX);
		score += fabs(blobTest.centerY - Bloblist.blob[j].centerY);
		for (h_i = 0; h_i < 256; h_i++)
			histScore += fabs(blobTest.histogram[h_i] - Bloblist.blob[j].histogram[h_i]);
		currentScore = score + histScore;
		if (currentScore < SCORE_THRESHOLD)
		{
			Bloblist.blob[i].minScore = currentScore;
			Bloblist.blob[i].hitCounter++;
			velocityNum = (Bloblist.blob[i].hitCounter) % APPEAR_THRESHOLD;
			Bloblist.blob[i].widthPrev[velocityNum] = Bloblist.blob[id].width;
			Bloblist.blob[i].heightPrev[velocityNum] = Bloblist.blob[id].height;
			Bloblist.blob[i].velX = (blobTest.centerX - Bloblist.blob[id].centerX);
			Bloblist.blob[i].velY = (blobTest.centerY - Bloblist.blob[id].centerY);
			Bloblist.blob[i].centerX = blobTest.centerX;
			Bloblist.blob[i].centerY = blobTest.centerY;
			for (h_i = 0; h_i < 256; h_i++) {
				Bloblist.blob[id].histogram[h_i] = (Bloblist.blob[id].histogram[h_i] + blobTest.histogram[h_i]) >> 1;
			}
			Bloblist.blob[id].missCounter = 0;
		}
	}
*/
#endif

//	************Comparison for New Detected Blobs********************
	for(i = 0; i < m_Bloblist.blobtotal; i++)
	{
		if(COMM_VAL != COMM_VAL_cur + 1) return;
//		 *******************************************
//		 * Transfer the data from blob_detection() *
//		 *******************************************
//		XTime_GetTime(&start);
		blobTest.centerX = m_Bloblist.blob[i].min_x + (m_Bloblist.blob[i].wx >> 1);
		blobTest.centerY = m_Bloblist.blob[i].min_y + (m_Bloblist.blob[i].wy >>1);
		blobTest.width = m_Bloblist.blob[i].wx;
		blobTest.height = m_Bloblist.blob[i].wy;

//		*************Initialized histogram*******************
		memset(blobTest.histogram, 0, sizeof(blobTest.histogram));

//		determine blob color, starting from min_x, min_y to max x value and max y value
		for (y = m_Bloblist.blob[i].min_y; y < m_Bloblist.blob[i].min_y + m_Bloblist.blob[i].wx; y++)
			for (x = m_Bloblist.blob[i].min_x ; x < m_Bloblist.blob[i].min_x + m_Bloblist.blob[i].wy; x+=2)
			{
				pixelValue = getPixelValue(x,y);
//				obtain color data value for each pixel
				C1 = pixelValue >> 24; //2k 
				C0 = (pixelValue & 0x0000FF00) >> 8;
//				tally number of "equal" color pixels in each box
				blobTest.histogram[C1]++;
				blobTest.histogram[C0]++;
			}
//		number of pixels per box
		pixelNumber = blobTest.height * blobTest.width;
//		blob is scaled to a 512 pixel blob for easy comparison regardless of size
		for (j = 0; j < 256; j++) //normalization the histogram for blob[i]
			blobTest.histogram[j] = ((blobTest.histogram[j] << 9)  + pixelNumber / 2) / pixelNumber; //Normalized to 512 instead of 500

//		 ********************************************************
//		 * Check whether the blob is already in the list or not *
//		 ********************************************************

		minScore = MAXSCORE;
		currentScore = MAXSCORE;
		listID = -1, id = -1;
		compared = 0;

		for(j = 0; j < Bloblist.totalNumber; j++) //compare info. of blob[i] with existence List.blob[j]
		{
			if (!Bloblist.blob[j].isInListFlag || Bloblist.blob[j].isNewAdded) {continue;}

//			 **************************************************
//			 * Compare two blobs and get the difference_score *
//			 **************************************************
			score = 0, histScore = 0;
//			calculate difference in center position
			score += fabs(blobTest.centerX - Bloblist.blob[j].centerX);
			score += fabs(blobTest.centerY - Bloblist.blob[j].centerY);
//			calculate difference in size
			score += fabs(blobTest.width - Bloblist.blob[j].width);
			score += fabs(blobTest.height - Bloblist.blob[j].height);

			// simple way to calculate histogram score
//			calculate difference in normalized color histogram
			for (h_i = 0; h_i < 256; h_i++)
				histScore += fabs(blobTest.histogram[h_i] - Bloblist.blob[j].histogram[h_i]);
//			add all three differences (position, size, and color) to create difference_score
			currentScore = score + histScore;

			if (currentScore < minScore) {
				minScore = currentScore;
				listID = j;
			}


		}
//		if difference score is low enough to be likely the same object, update id to existing id
		if (minScore < SCORE_THRESHOLD)
			id = listID;

		if(id == -1) //if not in the list, add it
		{
			for(j = 0; j < Bloblist.totalNumber + 1; j++)
				if(!Bloblist.blob[j].isInListFlag)
				{
					Bloblist.blob[j] = blobTest;

					Bloblist.blob[j].isInListFlag = 1;
					Bloblist.blob[j].isPotentialFlag = 1;
					Bloblist.blob[j].isActualFlag = 0;
					Bloblist.blob[j].hitCounter = 0;
					Bloblist.blob[j].missCounter = 0;
					Bloblist.blob[i].minScore = 10000;

					break;
				}
			if (Bloblist.totalNumber == j)
				Bloblist.totalNumber++;
		}
		else // if in the list, calculate the information which may be needed in the future.
		{
			Bloblist.blob[id].hitCounter++;
#ifdef SMOTHWH
			velocityNum = (Bloblist.blob[id].hitCounter) % APPEAR_THRESHOLD;
			Bloblist.blob[id].widthPrev[velocityNum] = Bloblist.blob[id].width;
			Bloblist.blob[id].heightPrev[velocityNum] = Bloblist.blob[id].height;
#endif
			Bloblist.blob[id].velX = (blobTest.centerX - Bloblist.blob[id].centerX);
			Bloblist.blob[id].velY = (blobTest.centerY - Bloblist.blob[id].centerY);
			Bloblist.blob[id].velWidth = ((Bloblist.blob[id].width+blobTest.width)>>1) - Bloblist.blob[id].width;
			Bloblist.blob[id].velHeight = ((Bloblist.blob[id].height+blobTest.height)>>1) - Bloblist.blob[id].height;
			Bloblist.blob[id].centerX = blobTest.centerX;
			Bloblist.blob[id].centerY = blobTest.centerY;
			Bloblist.blob[id].height = ((Bloblist.blob[id].height+blobTest.height)>>1);
			Bloblist.blob[id].width = ((Bloblist.blob[id].width+blobTest.width)>>1);
			for (h_i = 0; h_i < 256; h_i++) {
				Bloblist.blob[id].histogram[h_i] = (Bloblist.blob[id].histogram[h_i] + blobTest.histogram[h_i]) >> 1;
			}
			Bloblist.blob[id].missCounter = 0;
		}
//		XTime_GetTime(&finish);
//		time = (double)(finish - start) / 333000000 * 1000;
//		printf("check list takes %f ms.\r\n", time);

	}
//	*****************timing for all new blobs**************
	XTime_GetTime(&stage2);
#ifdef PRT
	xil_printf("(detect, Total) is (%d, %d) \r\n", m_Bloblist.blobtotal, Bloblist.totalNumber);
#endif



//	 *************************************
//	 * Check and change the blob status  *
//	 * (actual or potential) in the list *
//	 *************************************
	//j = 0;
	k = 0; //k used to calculate missed actual blob number in List
	for(i = 0; i < Bloblist.totalNumber; i++)
	{
		if(!Bloblist.blob[i].isInListFlag) {continue;}
		if(Bloblist.blob[i].missCounter > DiSAPPEAR_THRESHOLD) //List.blob[i] has missed
		{
			if(Bloblist.blob[i].isActualFlag) {
#ifdef PRT
				printf("X P free\r\n");
#endif
#ifdef KALMAN
//				matrix_free(&Bloblist.blob[j].X);
//				matrix_free(&Bloblist.blob[j].P);
//				printf("X P free done\r\n");
#endif
			}
#ifdef POSOUT
			if(Bloblist.blob[i].isActualFlag)
			xil_printf("%4d %2d %1d %3d %3d %3d %3d %3d %3d %3d %3d\r\n", frame_counter, i, 3,0,0,0,0,0,0,0,0);
#endif



			Bloblist.blob[i].isActualFlag = 0;
			Bloblist.blob[i].isPotentialFlag = 0;
			Bloblist.blob[i].isInListFlag = 0;

#ifdef LABELING
//			labelCheckList[Bloblist.blob[i].blobID]= 0 ;
#endif

			k++;
		}
		else if(Bloblist.blob[i].isPotentialFlag && (Bloblist.blob[i].hitCounter >= APPEAR_THRESHOLD - 1))
		{
			Bloblist.blob[i].isActualFlag = 1;
			Bloblist.blob[i].isPotentialFlag = 0;
			Bloblist.blob[i].isNewAdded = 1;


#ifdef POSOUT
			xil_printf("%4d %2d %1d %3d %3d %3d %3d %3d %3d %3d %3d\r\n", frame_counter, i, 1,Bloblist.blob[i].width,Bloblist.blob[i].height,Bloblist.blob[i].centerX,Bloblist.blob[i].centerY,Bloblist.blob[i].velWidth,Bloblist.blob[i].velHeight,Bloblist.blob[i].velX,Bloblist.blob[i].velY);
#endif
#ifdef KALMAN
			matrix_set_X(&Bloblist.blob[i].X_solid, &Bloblist.blob[i].X);
			matrix_set_P(&Bloblist.blob[i].P_solid, &Bloblist.blob[i].P);
			matrix_set_X(&Bloblist.blob[i].WHX_solid, &Bloblist.blob[i].WHX);
			matrix_set_P(&Bloblist.blob[i].WHP_solid, &Bloblist.blob[i].WHP);
//			printf("X malloc done\r\n");printf("P malloc done\r\n");
			M_status = matrix_write(&Bloblist.blob[i].X, 0, 0, Bloblist.blob[i].centerX); if(M_status == -1) printf("matrix_write B.X(0,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].X, 1, 0, Bloblist.blob[i].centerY); if(M_status == -1) printf("matrix_write B.X(1,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].X, 2, 0, Bloblist.blob[i].velX); if(M_status == -1) printf("matrix_write B.X(2,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].X, 3, 0, Bloblist.blob[i].velY); if(M_status == -1) printf("matrix_write B.X(3,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].WHX, 0, 0, Bloblist.blob[i].width); if(M_status == -1) printf("matrix_write B.WHX(0,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].WHX, 1, 0, Bloblist.blob[i].height); if(M_status == -1) printf("matrix_write B.WHX(1,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].WHX, 2, 0, Bloblist.blob[i].velWidth); if(M_status == -1) printf("matrix_write B.WHX(2,0) failed\r\n");
			M_status = matrix_write(&Bloblist.blob[i].WHX, 3, 0, Bloblist.blob[i].velHeight); if(M_status == -1) printf("matrix_write B.WHX(3,0) failed\r\n");

#ifdef PRT
			printf("X init done\r\n");
#endif

			memset(Bloblist.blob[i].P_solid.arr, 0, sizeof(Bloblist.blob[i].P_solid.arr));
			for (j = 0; j < 3; ++j){
				M_status = matrix_write(&Bloblist.blob[i].P, j, j, 150); if(M_status == -1) printf("matrix_write B.P(0,0) failed\r\n");
			}
			memset(Bloblist.blob[i].WHP_solid.arr, 0, sizeof(Bloblist.blob[i].WHP_solid.arr));
			for (j = 0; j < 3; ++j){
				M_status = matrix_write(&Bloblist.blob[i].WHP, j, j, 500); if(M_status == -1) printf("matrix_write B.WHP(0,0) failed\r\n");
			}

#ifdef PRT
			printf("P init done\r\n");
#endif
//			printf("*************P Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].P, 4, 4);
#endif
		}
	}
	while(Bloblist.totalNumber && !Bloblist.blob[Bloblist.totalNumber - 1].isInListFlag) Bloblist.totalNumber--; //update total Number in List, including missed blank
//	Bloblist.actualNumber -= k;
#ifdef PRT
	xil_printf("(detect, Total) is (%d, %d) \r\n", m_Bloblist.blobtotal, Bloblist.totalNumber);
#endif
//	*****************timing for updating List**************
	XTime_GetTime(&stage3);

	if(COMM_VAL != COMM_VAL_cur + 1) {return_frame_num++;return;}

	int prevNum = 0, width = 0, height = 0;;
	m_Bloblist_new.blobtotal = 0;

	k = 0;//for m_Bloblist_new, a list for the result of kalman filter
	for(i = 0; i < Bloblist.totalNumber; i++)//for kalman filter
	{
		//if(!Bloblist.blob[i].isInListFlag || !Bloblist.blob[i].isActualFlag) {continue;}
		if(!Bloblist.blob[i].isActualFlag) {continue;}
		if(Bloblist.blob[i].isNewAdded){Bloblist.blob[i].isNewAdded = 0; continue;}



#ifdef POSOUT
	xil_printf("%4d %2d %1d %3d %3d %3d %3d ", frame_counter, i, 2, Bloblist.blob[i].width,Bloblist.blob[i].height,Bloblist.blob[i].centerX, Bloblist.blob[i].centerY); //print the frame counter, obj counter,
#endif

#ifdef KALMAN
//			 **************************
//			 *  Kalman Filter Start!! *
//			 **************************

//			printf("Kalman Filter Start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");
			// read data from measurement
			M_status = matrix_write(&Z, 0, 0, Bloblist.blob[i].centerX); if(M_status == -1) printf("matrix_write Z(0,0) failed\r\n");
			M_status = matrix_write(&Z, 1, 0, Bloblist.blob[i].centerY); if(M_status == -1) printf("matrix_write Z(1,0) failed\r\n");
			//M_status = matrix_write(&Z, 2, 0, Bloblist.blob[i].velX); if(M_status == -1) printf("matrix_write Z(2,0) failed\r\n");
			M_status = matrix_write(&Z, 2, 0, Bloblist.blob[i].centerX-(int)matrix_read(&Bloblist.blob[i].X, 0, 0)); if(M_status == -1) printf("matrix_write Z(2,0) failed\r\n");
			//M_status = matrix_write(&Z, 3, 0, Bloblist.blob[i].velY); if(M_status == -1) printf("matrix_write Z(3,0) failed\r\n");
			M_status = matrix_write(&Z, 3, 0, Bloblist.blob[i].centerY-(int)matrix_read(&Bloblist.blob[i].X, 1, 0)); if(M_status == -1) printf("matrix_write Z(3,0) failed\r\n");

			// calculate X_tmp, P_tmp, K(kalman factor)
//			printf("*************X Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].X, 4, 1);
//			printf("*************P Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].P, 4, 4);

			M_status = matrix_multiply(&F, &Bloblist.blob[i].X, &X_tmp); if(M_status == -1) printf("X_tmp failed\r\n"); // X_tmp(4*1) = F * X
//			printf("*************X_tmp Matrix***************\r\n");
//			matrix_display(&X_tmp, 4, 1);

			M_status = matrix_multiply(&F, &Bloblist.blob[i].P, &TMP1); if(M_status == -1) printf("TMP1 failed\r\n"); // TMP1(4*4) = F*P
//			printf("*************TMP1 Matrix***************\r\n");
//			matrix_display(&TMP1, 4, 4);

			M_status = matrix_multiply(&TMP1, &FT, &TMP2); if(M_status == -1) printf("TMP2 failed\r\n"); // TMP2(4*4) = TMP1*FT = F*P*FT
			M_status = matrix_add(&TMP2, &Q, &P_tmp); if(M_status == -1) printf("P_tmp failed\r\n"); // P_tmp(4*4) = TMP2 + Q = F*P*FT + Q
			M_status = matrix_multiply(&H, &P_tmp, &TMP3); if(M_status == -1) printf("TMP3 failed\r\n"); // TMP3(2*4) = H * P_tmp
			M_status = matrix_multiply(&TMP3, &HT, &TMP4); if(M_status == -1) printf("TMP4 failed\r\n"); // TMP4(2*2) = TMP3 * HT = H * P_tmp * HT
			M_status = matrix_add(&TMP4, &R, &TMP5); if(M_status == -1) printf("TMP5 failed\r\n"); // TMP5(2*2) = TMP4 + R = H * P_tmp * HT + R
			M_status = matrix_inverse(&TMP5, &TMP6); if(M_status == -1) printf("TMP6 failed\r\n"); // TMP6(2*2) = TMP5^-1 = (H * P_tmp * HT + R)^-1
			M_status = matrix_multiply(&P_tmp, &HT, &TMP7); if(M_status == -1) printf("TMP7 failed\r\n"); // TMP7(4*2) = P_tmp * HT
			M_status = matrix_multiply(&TMP7, &TMP6, &K); if(M_status == -1) printf("K failed\r\n"); // K(4*2) = TMP7 * TMP6 = P_tmp * HT * (H * P_tmp * HT + R)^-1
			M_status = matrix_multiply(&H, &X_tmp, &TMP8); if(M_status == -1) printf("TMP8 failed\r\n"); // TMP8(2*1) = H * X_tmp
			//printf("TMP8(a1, a2) is (%f, %f)\r\n", matrix_read(&TMP8, 0, 0), matrix_read(&TMP8, 1, 0));
			M_status = matrix_subtract(&Z, &TMP8, &TMP9); if(M_status == -1) printf("TMP9 failed\r\n"); // TMP9(2*1) = Z - TMP8 = Z - H * X_tmp
			M_status = matrix_multiply(&K, &TMP9, &TMP10); if(M_status == -1) printf("TMP10 failed\r\n"); // TMP10(4*1) = K * TMP9 = K * (Z - H * X_tmp)
			//printf("TMP10(x, y) is (%f, %f)\r\n", matrix_read(&TMP10, 0, 0), matrix_read(&TMP10, 2, 0));
			M_status = matrix_multiply(&K, &H, &TMP11); if(M_status == -1) printf("TMP11 failed\r\n"); // TMP11(4*4) = K * H
			M_status = matrix_subtract(&I, &TMP11, &TMP12); if(M_status == -1) printf("TMP12 failed\r\n"); // TMP12(4*4) = I - TMP11 = I - K * H

			// update X and P
			M_status = matrix_add(&X_tmp, &TMP10, &Bloblist.blob[i].X); if(M_status == -1) printf("X failed"); // X(4*1) = X_tmp + TMP10 = X_tmp + K * (Z - H * X_tmp)
			M_status = matrix_multiply(&TMP12, &P_tmp, &Bloblist.blob[i].P); if(M_status == -1) printf("P failed"); // P(4*4) = TMP12 * P_tmp = (I - K * H) * P_tmp

			// get postion of object
			//printf("detect(x, y) is (%d, %d)\r\n", Bloblist.blob[j].centerX, Bloblist.blob[j].centerY);
//			*****************updating result based on Kalman Filter************************
#ifdef PRT
			int prv_cx = Bloblist.blob[i].centerX, prv_cy =Bloblist.blob[i].centerY, prv_velX =Bloblist.blob[i].velX, prv_velY=Bloblist.blob[i].velY;
#endif
			Bloblist.blob[i].centerX = (int)matrix_read(&Bloblist.blob[i].X, 0, 0);
			Bloblist.blob[i].centerY = (int)matrix_read(&Bloblist.blob[i].X, 1, 0);
			Bloblist.blob[i].velX = (int)matrix_read(&Bloblist.blob[i].X, 2, 0);
			Bloblist.blob[i].velY = (int)matrix_read(&Bloblist.blob[i].X, 3, 0);
#ifdef PRT
			printf("***********Updating**************\r\n");
			printf("Center   X: %8d -> %8d\r\n", prv_cx, Bloblist.blob[i].centerX);
			printf("Center   Y: %8d -> %8d\r\n", prv_cy, Bloblist.blob[i].centerY);
			printf("Velocity X: %8d -> %8d\r\n", prv_velX, Bloblist.blob[i].velX);
			printf("Velocity Y: %8d -> %8d\r\n", prv_velY, Bloblist.blob[i].velY);
			//printf("kalman(x, y) is (%d, %d)\r\n", Bloblist.blob[j].centerX, Bloblist.blob[j].centerY);*/
#endif

			// read data from measurement
			M_status = matrix_write(&Z, 0, 0, Bloblist.blob[i].width); if(M_status == -1) printf("matrix_write Z(0,0) failed\r\n");
			M_status = matrix_write(&Z, 1, 0, Bloblist.blob[i].height); if(M_status == -1) printf("matrix_write Z(1,0) failed\r\n");
//			M_status = matrix_write(&Z, 2, 0, Bloblist.blob[i].velWidth); if(M_status == -1) printf("matrix_write Z(2,0) failed\r\n");
			M_status = matrix_write(&Z, 2, 0, Bloblist.blob[i].width-(int)matrix_read(&Bloblist.blob[i].WHX, 0, 0)); if(M_status == -1) printf("matrix_write Z(2,0) failed\r\n");
//			M_status = matrix_write(&Z, 3, 0, Bloblist.blob[i].velHeight); if(M_status == -1) printf("matrix_write Z(3,0) failed\r\n");
			M_status = matrix_write(&Z, 3, 0, Bloblist.blob[i].height-(int)matrix_read(&Bloblist.blob[i].WHX, 1, 0)); if(M_status == -1) printf("matrix_write Z(3,0) failed\r\n");

			// calculate X_tmp, P_tmp, K(kalman factor)
//			xil_printf("*************X Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].WHX, 4, 1);
//			printf("*************P Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].P, 4, 4);

			M_status = matrix_multiply(&F, &Bloblist.blob[i].WHX, &X_tmp); if(M_status == -1) printf("X_tmp failed\r\n"); // X_tmp(4*1) = F * X
//			printf("*************X_tmp Matrix***************\r\n");
//			matrix_display(&X_tmp, 4, 1);

			M_status = matrix_multiply(&F, &Bloblist.blob[i].WHP, &TMP1); if(M_status == -1) printf("TMP1 failed\r\n"); // TMP1(4*4) = F*P
//			printf("*************TMP1 Matrix***************\r\n");
//			matrix_display(&TMP1, 4, 4);

			M_status = matrix_multiply(&TMP1, &FT, &TMP2); if(M_status == -1) printf("TMP2 failed\r\n"); // TMP2(4*4) = TMP1*FT = F*P*FT
			M_status = matrix_add(&TMP2, &Q, &P_tmp); if(M_status == -1) printf("P_tmp failed\r\n"); // P_tmp(4*4) = TMP2 + Q = F*P*FT + Q
			M_status = matrix_multiply(&H, &P_tmp, &TMP3); if(M_status == -1) printf("TMP3 failed\r\n"); // TMP3(2*4) = H * P_tmp
			M_status = matrix_multiply(&TMP3, &HT, &TMP4); if(M_status == -1) printf("TMP4 failed\r\n"); // TMP4(2*2) = TMP3 * HT = H * P_tmp * HT
			M_status = matrix_add(&TMP4, &R, &TMP5); if(M_status == -1) printf("TMP5 failed\r\n"); // TMP5(2*2) = TMP4 + R = H * P_tmp * HT + R
			M_status = matrix_inverse(&TMP5, &TMP6); if(M_status == -1) printf("TMP6 failed\r\n"); // TMP6(2*2) = TMP5^-1 = (H * P_tmp * HT + R)^-1
			M_status = matrix_multiply(&P_tmp, &HT, &TMP7); if(M_status == -1) printf("TMP7 failed\r\n"); // TMP7(4*2) = P_tmp * HT
			M_status = matrix_multiply(&TMP7, &TMP6, &K); if(M_status == -1) printf("K failed\r\n"); // K(4*2) = TMP7 * TMP6 = P_tmp * HT * (H * P_tmp * HT + R)^-1
			M_status = matrix_multiply(&H, &X_tmp, &TMP8); if(M_status == -1) printf("TMP8 failed\r\n"); // TMP8(2*1) = H * X_tmp
			//printf("TMP8(a1, a2) is (%f, %f)\r\n", matrix_read(&TMP8, 0, 0), matrix_read(&TMP8, 1, 0));
			M_status = matrix_subtract(&Z, &TMP8, &TMP9); if(M_status == -1) printf("TMP9 failed\r\n"); // TMP9(2*1) = Z - TMP8 = Z - H * X_tmp
			M_status = matrix_multiply(&K, &TMP9, &TMP10); if(M_status == -1) printf("TMP10 failed\r\n"); // TMP10(4*1) = K * TMP9 = K * (Z - H * X_tmp)
			//printf("TMP10(x, y) is (%f, %f)\r\n", matrix_read(&TMP10, 0, 0), matrix_read(&TMP10, 2, 0));
			M_status = matrix_multiply(&K, &H, &TMP11); if(M_status == -1) printf("TMP11 failed\r\n"); // TMP11(4*4) = K * H
			M_status = matrix_subtract(&I, &TMP11, &TMP12); if(M_status == -1) printf("TMP12 failed\r\n"); // TMP12(4*4) = I - TMP11 = I - K * H

			// update X and P
			M_status = matrix_add(&X_tmp, &TMP10, &Bloblist.blob[i].WHX); if(M_status == -1) printf("WHX failed"); // X(4*1) = X_tmp + TMP10 = X_tmp + K * (Z - H * X_tmp)
			M_status = matrix_multiply(&TMP12, &P_tmp, &Bloblist.blob[i].WHP); if(M_status == -1) printf("WHP failed"); // P(4*4) = TMP12 * P_tmp = (I - K * H) * P_tmp

//			xil_printf("*************X Matrix***************\r\n");
//			matrix_display(&Bloblist.blob[i].WHX, 4, 1);

			// get postion of object
			//printf("detect(x, y) is (%d, %d)\r\n", Bloblist.blob[j].centerX, Bloblist.blob[j].centerY);
//			*****************updating result based on Kalman Filter************************
#ifdef PRT
			int prv_cx = Bloblist.blob[i].centerX, prv_cy =Bloblist.blob[i].centerY, prv_velX =Bloblist.blob[i].velX, prv_velY=Bloblist.blob[i].velY;
#endif

#ifdef WH_KALMAN
			if (matrix_read(&Bloblist.blob[i].WHX, 0, 0) > 16)
			Bloblist.blob[i].width = (int)matrix_read(&Bloblist.blob[i].WHX, 0, 0);
			if (matrix_read(&Bloblist.blob[i].WHX, 1, 0) > 16)
			Bloblist.blob[i].height = (int)matrix_read(&Bloblist.blob[i].WHX, 1, 0);
			Bloblist.blob[i].velWidth = (int)matrix_read(&Bloblist.blob[i].WHX, 2, 0);
			Bloblist.blob[i].velHeight = (int)matrix_read(&Bloblist.blob[i].WHX, 3, 0);
#endif

#ifdef PRT
			printf("***********Updating**************\r\n");
			printf("Center   X: %8d -> %8d\r\n", prv_cx, Bloblist.blob[i].centerX);
			printf("Center   Y: %8d -> %8d\r\n", prv_cy, Bloblist.blob[i].centerY);
			printf("Velocity X: %8d -> %8d\r\n", prv_velX, Bloblist.blob[i].velX);
			printf("Velocity Y: %8d -> %8d\r\n", prv_velY, Bloblist.blob[i].velY);
			//printf("kalman(x, y) is (%d, %d)\r\n", Bloblist.blob[j].centerX, Bloblist.blob[j].centerY);*/
#endif
#endif //end Kalman Filter

		m_Bloblist_new.blob[k].min_x =  Bloblist.blob[i].centerX - (Bloblist.blob[i].width >> 1);
		m_Bloblist_new.blob[k].min_y =  Bloblist.blob[i].centerY - (Bloblist.blob[i].height >> 1);
		if (m_Bloblist_new.blob[k].min_x < 0) m_Bloblist_new.blob[k].min_x = 0;
		if (m_Bloblist_new.blob[k].min_y < 0) m_Bloblist_new.blob[k].min_y = 0;

#ifdef PRED
		m_Bloblist_new.blob[k].min_x =  Bloblist.blob[i].centerX + Bloblist.blob[i].velX*PRED_FRAME - (Bloblist.blob[i].width >> 1);
		m_Bloblist_new.blob[k].min_y =  Bloblist.blob[i].centerY + Bloblist.blob[i].velY*PRED_FRAME- (Bloblist.blob[i].height >> 1);
#endif

		//		************smoothing the width & height*******************
		m_Bloblist_new.blob[k].wx = Bloblist.blob[i].width; //instead by previous smoothed value
		m_Bloblist_new.blob[k].wy = Bloblist.blob[i].height;
		if (m_Bloblist_new.blob[k].min_x + m_Bloblist_new.blob[k].wx >= SUB_WIDTH) m_Bloblist_new.blob[k].wx = SUB_WIDTH - m_Bloblist_new.blob[k].min_x -1;
		if (m_Bloblist_new.blob[k].min_y + m_Bloblist_new.blob[k].wy >= SUB_HEIGHT) m_Bloblist_new.blob[k].wy = SUB_HEIGHT - m_Bloblist_new.blob[k].min_y -1;
		if (m_Bloblist_new.blob[k].wx < 32) m_Bloblist_new.blob[k].wx = 33;
		if (m_Bloblist_new.blob[k].wy < 32) m_Bloblist_new.blob[k].wy = 33;

#ifdef POSOUT
	xil_printf("%3d %3d %3d %3d\r\n", Bloblist.blob[i].width,  Bloblist.blob[i].height, Bloblist.blob[i].centerX, Bloblist.blob[i].centerY); //print the frame counter, obj counter,
#endif
		k++;

//			xil_printf("index of m_Bloblist_new.blob is %d\n\r", k);
//			xil_printf("(x,y,w,h) is (%d,%d,%d,%d)\r\n", m_Bloblist_new.blob[i].min_x, m_Bloblist_new.blob[i].min_y, m_Bloblist_new.blob[i].wx, m_Bloblist_new.blob[i].wy);
	}
	m_Bloblist_new.blobtotal = k;
#ifdef PRT
	xil_printf("(detect, Total, actual) is (%d, %d, %d) \r\n", m_Bloblist.blobtotal, Bloblist.totalNumber, m_Bloblist_new.blobtotal);
#endif
//	*****************timing for Kalman Filter**************
	XTime_GetTime(&stage4);


	if(COMM_VAL != COMM_VAL_cur + 1) {return_frame_num++;return;}

	k = 0;
	int isCoveredFlag = 0;
	int isOverlapFlag = 0;
	for(i = 0; i < m_Bloblist_new.blobtotal; i++)
	{
		isCoveredFlag = 0;
		isOverlapFlag = 0;
//		*********compare cover*************

		for(j = 0; j < m_Bloblist_new.blobtotal; j++) // check cover or overlap for discarding the redundant rectangles
		{
			if (i == j) continue;
			if (m_Bloblist_new.blob[i].wx * m_Bloblist_new.blob[i].wy >= m_Bloblist_new.blob[j].wx * m_Bloblist_new.blob[j].wy)
				continue;
			if (m_Bloblist_new.blob[i].min_x > m_Bloblist_new.blob[j].min_x)
				if (m_Bloblist_new.blob[i].min_y > m_Bloblist_new.blob[j].min_y)
					if (m_Bloblist_new.blob[i].min_x + m_Bloblist_new.blob[i].wx < m_Bloblist_new.blob[j].min_x + m_Bloblist_new.blob[j].wx)
						if (m_Bloblist_new.blob[i].min_y + m_Bloblist_new.blob[i].wy < m_Bloblist_new.blob[j].min_y + m_Bloblist_new.blob[j].wy)
						{
							isCoveredFlag = 1;
							break;
						}
			if (m_Bloblist_new.blob[i].min_x + m_Bloblist_new.blob[i].wx / 2 > m_Bloblist_new.blob[j].min_x)
				if (m_Bloblist_new.blob[i].min_y + m_Bloblist_new.blob[i].wy / 2 > m_Bloblist_new.blob[j].min_y)
					if (m_Bloblist_new.blob[i].min_x + m_Bloblist_new.blob[i].wx / 2 < m_Bloblist_new.blob[j].min_x + m_Bloblist_new.blob[j].wx)
						if (m_Bloblist_new.blob[i].min_y + m_Bloblist_new.blob[i].wy / 2 < m_Bloblist_new.blob[j].min_y + m_Bloblist_new.blob[j].wy)
						{
							isOverlapFlag = 1;
							break;
						}
		}

		if (isCoveredFlag == 0 && isOverlapFlag == 0)
		{
			m_Bloblist_new_no_cover.blob[k].wx = m_Bloblist_new.blob[i].wx;
			m_Bloblist_new_no_cover.blob[k].wy = m_Bloblist_new.blob[i].wy;
			m_Bloblist_new_no_cover.blob[k].min_x = m_Bloblist_new.blob[i].min_x;
			m_Bloblist_new_no_cover.blob[k].min_y = m_Bloblist_new.blob[i].min_y;
//			printf("size = %d \r\n", m_Bloblist_new_no_cover.blob[k].wx * m_Bloblist_new_no_cover.blob[k].wy);

#ifdef LABELING
			m_Bloblist_new_no_cover.blob[k].blob_id = -1;
#endif

			k++;
		}
	}
	m_Bloblist_new_no_cover.blobtotal = k;
#ifdef LABELING
	// need to sort all label based on recent used

	int cx, cy;
//	xil_printf("%d/%d ",Label.size,k);
	for (i = 0; i < Label.size; ++i) { //first for all exist label
		if (!Label.RecentUsed[i])
			continue;
		int closet = 2147483647, closetJ = -1;
//		xil_printf("@%d,%d,%d,%d@",);
		for (j = 0; j < k; ++j) {
			if (m_Bloblist_new_no_cover.blob[j].blob_id == -1) {
				cx = m_Bloblist_new_no_cover.blob[j].min_x + (m_Bloblist_new_no_cover.blob[j].wx >> 1);
				cy = m_Bloblist_new_no_cover.blob[j].min_y + (m_Bloblist_new_no_cover.blob[j].wy >> 1);
				if (cx >= Label.LeftUpI[i] && cy >= Label.LeftUpJ[i] && cx <= Label.RightDownI[i] && cy <= Label.RightDownJ[i])
					if (fabs(cx - Label.CentI[i]) + fabs(cy - Label.CentJ[i]) < closet) {
						closet = fabs(cx - Label.CentI[i]) + fabs(cy - Label.CentJ[i]);
						closetJ = j;
					}

			}
		}
//		xil_printf("|%d|",closetJ);
		if (closetJ == -1)
			continue;
		//mnc.blob[closetJ].blob_id = Label.ID;
		m_Bloblist_new_no_cover.blob[closetJ].blob_id = i;
		Label.RecentUsed[i] = 1;
		Label.LeftUpI[i] = m_Bloblist_new_no_cover.blob[closetJ].min_x;
		Label.LeftUpJ[i] = m_Bloblist_new_no_cover.blob[closetJ].min_y;
		Label.RightDownI[i] = Label.LeftUpI[i] + m_Bloblist_new_no_cover.blob[closetJ].wx;
		Label.RightDownJ[i] = Label.LeftUpJ[i] + m_Bloblist_new_no_cover.blob[closetJ].wy;
		Label.CentI[i] = (Label.LeftUpI[i] + Label.RightDownI[i]) >> 1;
		Label.CentJ[i] = (Label.LeftUpJ[i] + Label.RightDownJ[i]) >> 1;
	}
	// for all reminder
	for (i = 0; i < k; ++i)
		if (m_Bloblist_new_no_cover.blob[i].blob_id == -1) {
			for (j = 0; j <= Label.size; ++j)
				if (!Label.RecentUsed[j])
					break;
			if (j == Label.size)
				Label.size++;
//			xil_printf("<%d>",j);
			m_Bloblist_new_no_cover.blob[i].blob_id = j;
			Label.RecentUsed[j] = 1;
			Label.LeftUpI[j] = m_Bloblist_new_no_cover.blob[i].min_x;
			Label.LeftUpJ[j] = m_Bloblist_new_no_cover.blob[i].min_y;
			Label.RightDownI[j] = Label.LeftUpI[j] + m_Bloblist_new_no_cover.blob[i].wx;
			Label.RightDownJ[j] = Label.LeftUpJ[j] + m_Bloblist_new_no_cover.blob[i].wy;
			Label.CentI[j] = (Label.LeftUpI[j] + Label.RightDownI[j]) >> 1;
			Label.CentJ[j] = (Label.LeftUpJ[j] + Label.RightDownJ[j]) >> 1;
		}
//	xil_printf("\n");
#endif


#ifdef PRT
//	xil_printf("COMM_VAL is %d \n\r", COMM_VAL);
	xil_printf("(detect, Total, actual, display) is (%d, %d, %d, %d) \r\n", m_Bloblist.blobtotal, Bloblist.totalNumber, m_Bloblist_new.blobtotal, m_Bloblist_new_no_cover.blobtotal);
//	xil_printf("copy info0: (x,y,w,h) is (%d,%d,%d,%d)\r\n", m_Bloblist_new.blob[0].min_x, m_Bloblist_new.blob[0].min_y, m_Bloblist_new.blob[0].wx, m_Bloblist_new.blob[0].wy);
#endif
//	*****************timing for defuse get info**************
	XTime_GetTime(&stage5);

//	xil_printf("COMM_VAL is %d \n\r", COMM_VAL);
	min_x = 0, min_y = 0, wx = 0, wy = 0;

	if (!COMM_VAL_cur)
	{
		for (i=0 ; i< m_Bloblist_new_no_cover.blobtotal; i++)
		{
			min_x = m_Bloblist_new_no_cover.blob[i].min_x;
			min_y = m_Bloblist_new_no_cover.blob[i].min_y;
			wx = m_Bloblist_new_no_cover.blob[i].wx;
			wy = m_Bloblist_new_no_cover.blob[i].wy;
			label = m_Bloblist_new_no_cover.blob[i].blob_id;
#ifdef PRT
			xil_printf("write buf1: (x,y,w,h) is (%d,%d,%d,%d)\r\n", min_x, min_y, wx, wy);
#endif
			object_focus (min_x, min_y, wx, wy, read_pointer, 0XFFFFFFFF,  1, VIDEO_OVERLAY_VDMA_ID, label);
		}
		m_Bloblist_past_0 = m_Bloblist_new_no_cover;
	}
	else
	{
			for (i=0 ; i< m_Bloblist_new_no_cover.blobtotal; i++)
			{
			min_x = m_Bloblist_new_no_cover.blob[i].min_x;
			min_y = m_Bloblist_new_no_cover.blob[i].min_y;
			wx = m_Bloblist_new_no_cover.blob[i].wx;
			wy = m_Bloblist_new_no_cover.blob[i].wy;
			label = m_Bloblist_new_no_cover.blob[i].blob_id;
#ifdef PRT
			xil_printf("write buf2: (x,y,w,h) is (%d,%d,%d,%d)\r\n", min_x, min_y, wx, wy);
#endif
			object_focus (min_x, min_y, wx, wy, read_pointer, 0XFFFFFFFF,  1, VIDEO_OVERLAY_VDMA_ID, label);
		}
		m_Bloblist_past_1 = m_Bloblist_new_no_cover;
	}



	XTime_GetTime(&finish);
//	time = (double)(finish - start) / 333000000 * 1000;
//	printf("Writing back takes %f ms.\r\n", time);
//	TotalWritingTime += time;

//	**********Update timing info. & frame counter*************
	frame_counter++;
	time_stage1 += (double)(stage1 - start) / 333000; //unit: ms
	time_stage2 += (double)(stage2 - stage1) / 333000; //unit: ms
	time_stage3 += (double)(stage3 - stage2) / 333000; //unit: ms
	time_stage4 += (double)(stage4 - stage3) / 333000; //unit: ms
	time_stage5 += (double)(stage5 - stage4) / 333000; //unit: ms
	time_stage6 += (double)(finish - stage5) / 333000; //unit: ms
	sum_List_size += Bloblist.totalNumber;
	sum_mul_List_mList += Bloblist.totalNumber * m_Bloblist.blobtotal;

	if(frame_counter >= 20000){
#ifdef TIMING
		xil_printf("********************************************\r\n");
//		xil_printf("Return Frame Number is: %d \r\n", return_frame_num);
		xil_printf("Frame Number is: %d \r\n", frame_counter);
		printf("Ave. DISPBLOB Time Consumption is: %f(us) \r\n", time_stage1 / 20);
		printf("Ave. LPNEWBLB Time Consumption is: %f(us) \r\n", time_stage2 / 20);
		printf("Ave. UPDTLIST Time Consumption is: %f(us) \r\n", time_stage3 / 20);
		printf("Ave. KALMANFT Time Consumption is: %f(us) \r\n", time_stage4 / 20);
		printf("Ave. LABELING Time Consumption is: %f(us) \r\n", time_stage5 / 20);
		printf("Ave. VDMADRAW Time Consumption is: %f(us) \r\n", time_stage6 / 20);
		xil_printf("Ave. LISTSIZE                  is: %5d     \r\n", sum_List_size / 20000);
		xil_printf("Ave. Detected * List size      is: %5d     \r\n", sum_mul_List_mList / 20000);
#endif
		return_frame_num=sum_List_size=sum_mul_List_mList=frame_counter = time_stage1=time_stage2=time_stage3=time_stage4=time_stage5=time_stage6 = 0;
	}

}

u32 getPixelValue(int x, int y)
{
//	xil_printf("getPixelValue called.\n\r");
	u32 * pixelValue;
	pixelValue = YCBCR2MEM_WRITE_REGION;
	pixelValue += (SUBFRAME_START_OFFSET_YCBCR2MEM + y * FRAME_HORIZONTAL_LEN_YCBCR2MEM) / 4 + x / 2;
	return * pixelValue;
}
