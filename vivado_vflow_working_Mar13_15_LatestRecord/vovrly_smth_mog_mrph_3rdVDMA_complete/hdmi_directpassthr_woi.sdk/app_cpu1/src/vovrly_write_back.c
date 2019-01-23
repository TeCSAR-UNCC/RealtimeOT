/*
 * vovrly_write_back.c
 *
 *  Created on: Mar 26, 2015
 *      Author: xufaneric
 */

#include "vovrly_write_back.h"
#include "string.h"
//#include "xtime_l.h"

//u32	wx_curr, wy_curr, min_x_curr, min_y_curr, Blob_count_curr = 0;
//u32 wx_past, wy_past, min_x_past, min_y_past, Blob_count_past = 0;

struct sBloblist m_Bloblist, m_Bloblist_past_0, m_Bloblist_past_1;
//
//void vovrly_write_back()
//{
////	printf("CPU1: vovrly_write_back start\n\r");
//
//	int i;
//	u32 *read_pointer, *read_pointer_del;
//
////	m_Bloblist = Bloblist_Buf0;
//	Xil_DCacheFlush();
//	printf("COMM_VAL = %d \n\r",COMM_VAL);
//	if (COMM_VAL == 1)
//	{
//		m_Bloblist = Bloblist_Buf0;
//		read_pointer = VOVRLAY_READ_REGION + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY;
//		for (i=0 ; i< m_Bloblist_past_0.blobtotal; i++)
//			object_focus (m_Bloblist_past_0.blob[i].min_x, m_Bloblist_past_0.blob[i].min_y, m_Bloblist_past_0.blob[i].wx, m_Bloblist_past_0.blob[i].wy,
//					read_pointer, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
//		for (i=0 ; i< m_Bloblist.blobtotal; i++)
//			object_focus (m_Bloblist.blob[i].min_x, m_Bloblist.blob[i].min_y, m_Bloblist.blob[i].wx, m_Bloblist.blob[i].wy,
//					read_pointer, 0XFFFFFFFF,  (m_Bloblist.blobtotal & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
//		m_Bloblist_past_0 = m_Bloblist;
//	}
//
//	if (COMM_VAL == 2)
//	{
//		m_Bloblist = Bloblist_Buf1;
//		read_pointer = VOVRLAY_READ_REGION;
//		for (i=0 ; i< m_Bloblist_past_1.blobtotal; i++)
//			object_focus (m_Bloblist_past_1.blob[i].min_x, m_Bloblist_past_1.blob[i].min_y, m_Bloblist_past_1.blob[i].wx, m_Bloblist_past_1.blob[i].wy,
//					read_pointer, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
//		for (i=0 ; i< m_Bloblist.blobtotal; i++)
//			object_focus (m_Bloblist.blob[i].min_x, m_Bloblist.blob[i].min_y, m_Bloblist.blob[i].wx, m_Bloblist.blob[i].wy,
//					read_pointer, 0XFFFFFFFF,  (m_Bloblist.blobtotal & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
//		m_Bloblist_past_1 = m_Bloblist;
//	}
//
//
///*
//	//erase the old blobs from previous slides;
//	for (i=0 ; i< m_Bloblist_past.blobtotal; i++)
//	{
////		wx_past = m_Bloblist_past.blob[i].wx;
////		wy_past = m_Bloblist_past.blob[i].wy;
////		min_x_past = m_Bloblist_past.blob[i].min_x;
////		min_y_past = m_Bloblist_past.blob[i].min_y;
////		object_focus (min_x_past, min_y_past, wx_past, wy_past,  &VOVRLAY_READ_REGION, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
//		object_focus (m_Bloblist_past.blob[i].min_x, m_Bloblist_past.blob[i].min_y, m_Bloblist_past.blob[i].wx, m_Bloblist_past.blob[i].wy,  read_pointer, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
////		object_focus (m_Bloblist_past.blob[i].min_x, m_Bloblist_past.blob[i].min_y, m_Bloblist_past.blob[i].wx, m_Bloblist_past.blob[i].wy,  &VOVRLAY_READ_REGION, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
////		object_focus (min_x_past, min_y_past, wx_past, wy_past,  READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
//	}
//
////	XTime_GetTime(&start);
////	memset(&VOVRLAY_READ_REGION, 0x00, (FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY) * NUMBER_OF_READ_FRAMES_VIDEO_OVERLAY);
////	XTime_GetTime(&finish);
////	time = (double)(finish - start) / 333000000 * 1000;
////	printf("memset takes %f ms.\r\n", time);
//
//	//passing the current blob parameters for drawing
////	Blob_count_curr = m_Bloblist.blobtotal;
////	printf("Blob_count_curr = %d \r\n", Blob_count_curr);
//
//	for (i=0 ; i< m_Bloblist.blobtotal; i++)
//	{
////		wx_curr = m_Bloblist.blob[i].wx;
////		wy_curr = m_Bloblist.blob[i].wy;
////		min_x_curr = m_Bloblist.blob[i].min_x;
////		min_y_curr = m_Bloblist.blob[i].min_y;
////		printf("(wx_curr,wy_curr,min_x_curr,min_y_curr) = (%d,%d,%d,%d) \r\n", wx_curr, wy_curr, min_x_curr, min_y_curr);
////		object_focus (min_x_curr, min_y_curr, wx_curr, wy_curr, &VOVRLAY_READ_REGION, 0XFFFFFFFF,  (Blob_count_curr & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
//		object_focus (m_Bloblist.blob[i].min_x, m_Bloblist.blob[i].min_y, m_Bloblist.blob[i].wx, m_Bloblist.blob[i].wy, read_pointer, 0XFFFFFFFF,  (Blob_count_curr & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
////		object_focus (m_Bloblist.blob[i].min_x, m_Bloblist.blob[i].min_y, m_Bloblist.blob[i].wx, m_Bloblist.blob[i].wy, &VOVRLAY_READ_REGION, 0XFFFFFFFF,  (Blob_count_curr & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
////		object_focus (min_x_curr, min_y_curr, wx_curr, wy_curr, READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA, 0XFFFFFFFF,  (Blob_count_curr & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
//		// passing the current blob to the old array for later erase
////		m_Bloblist_past.blob[i].wx = wx_curr;
////		m_Bloblist_past.blob[i].wy = wy_curr;
////		m_Bloblist_past.blob[i].min_x = min_x_curr;
////		m_Bloblist_past.blob[i].min_y = min_y_curr;
//	}
//
//	m_Bloblist_past = m_Bloblist;
////	Blob_count_past = Blob_count_curr;
//
////	printf("CPU1: vovrly_write_back finish drawing %d rectangle\n\r", i);
// *
// *
// */
//}

