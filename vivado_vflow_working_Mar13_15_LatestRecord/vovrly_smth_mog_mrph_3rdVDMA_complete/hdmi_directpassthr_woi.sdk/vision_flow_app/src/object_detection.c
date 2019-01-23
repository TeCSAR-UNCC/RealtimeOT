/*
 * object_detection.c
 *
 *  Created on: Aug 21, 2014
 *      Author: msabbagh
 */


/*
 * blob_detection.c
 *
 *  Created on: Aug 18, 2014
 *      Author: lchenyan
 *
 *  Repackage
 */


#include "object_detection.h"
#include "string.h"
#include "xtime_l.h"

//downsampling factors
#define down_resolution_x_sampling_size 4
#define down_resolution_y_sampling_size 2

//downsampled resolution
#define reduced_width FRAME_WIDTH/down_resolution_x_sampling_size
#define reduced_height FRAME_HEIGHT/down_resolution_y_sampling_size

//label parameters
#define reduced_width_label 992/down_resolution_x_sampling_size
#define reduced_height_label reduced_height

u16 Label[reduced_width_label*reduced_height_label];

struct blob_info bloblist[1000];
struct sBlob m_Blob;

//global variable outputs by object_detection() for use by object_focus() and blob_tracking()
u32	wx_curr, wy_curr, min_x_curr, min_y_curr, Blob_count_curr = 0;
u32 wx_past, wy_past, min_x_past, min_y_past, Blob_count_past = 0;

int object_detection(u32 base_address, u32 double_buf)//Base address for reading the blob mask
{

	XTime start, finish;
	double time;
	XTime_GetTime(&start);

	u32 frame_width_bit, frame_height_bit;
	u32 * input_pointer_base, * input_pointer_offset;
	u32 label_index, temp_label, bit_index, intermediate;
	u32 bit_label;

	//xil_printf("\r\n--- Entering blob detection() --- \r\n");
	int nighber, nighber_index, label_count;
    int index, center_index, top_index, y_index, x_index, i, j, x0, y0;

	/////////////////////////////// loading data from array "pixelall" and initialization ////////////////////////////////

    memset(bloblist,0, sizeof bloblist);

	///////////////////////////////////////////////////////////////////// First loop for component labeling

			label_count = 1;
			frame_width_bit = FRAME_WIDTH / 32;
			frame_height_bit = FRAME_HEIGHT / down_resolution_y_sampling_size;  // down_resolution
			//printf ("start of memory access and transformation \n");

			if (double_buf == 0)
			input_pointer_base = base_address + SUBFRAME_START_OFFSET_VIDEO_OVERLAY;  // start address of memory where we read data from
			else if (double_buf == 1)
			input_pointer_base = base_address + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY + SUBFRAME_START_OFFSET_VIDEO_OVERLAY;  // start address of memory where we read data from
//			printf("input_pointer_base is %d     ", input_pointer_base);

			label_index =0;
			intermediate = 0;


	////////capable of different resolution!!!
			//printf ("frame_width_bit: %x FRAME_WIDTH: %x FRAME_HEIGHT:%x\n", frame_width_bit, FRAME_WIDTH, FRAME_HEIGHT);
			for(y_index = 0; y_index < frame_height_bit ; y_index++)
			{
				//printf("%x	",y_index);
				input_pointer_offset = input_pointer_base;
				for(x_index = 0; x_index < frame_width_bit; x_index++)
				{
					temp_label = * input_pointer_offset;
					//printf ("%x	", temp_label);
					bit_label = 0x00000001;

					for(bit_index = 0; bit_index < (32/down_resolution_x_sampling_size); bit_index++)
					{
						intermediate = (bit_label & temp_label);
						if(intermediate != 0)
							{Label[label_index] = 1;}
						else
							{Label[label_index] = 0;}

						//printf ("%d", Label[label_index]);
						label_index++;
						bit_label = (bit_label << down_resolution_x_sampling_size);  // each time shift by n for sampling
					}
					input_pointer_offset ++;
				}
//				printf ("\n");
				input_pointer_base += (down_resolution_y_sampling_size*(VIDEO_OVERLAY_VDMA_STRIDE/4)); // y_dimension_sampling, n strides per sample!!!!
//				VIDEO_OVERLAY_VDMA_STRIDE is in byte level, it records how many bytes per row, thus we need to divide it by 4 to get how many 32 bits per row
			}


//			printf ("start of first loop \n");

			for(y_index = 0; y_index < reduced_height ; y_index++)
			{
				for(x_index = 0; x_index < reduced_width ; x_index++)
				{
					x0 = x_index;
					y0 = y_index;
					center_index = x_index + y_index*reduced_width;

					nighber = 0;
					nighber_index = 0;


					if (x_index==0 || x_index==reduced_width-1 || y_index==0 || y_index==reduced_height-1)
						Label[center_index] = 0;

					else if(Label[center_index] == 1)
					{
						//we only want to operate the previous labeled ones, not the later one which still have 0 label.
						if (Label[(x0-1) + (y0)*reduced_width] != 0) {nighber++; nighber_index= (x0-1) + (y0)*reduced_width;}
						if (Label[(x0-1) + (y0-1)*reduced_width] != 0) {nighber++; nighber_index= (x0-1) + (y0-1)*reduced_width;}
						if (Label[(x0) + (y0-1)*reduced_width]  != 0) {nighber++; nighber_index= (x0) + (y0-1)*reduced_width;}
						if (Label[(x0+1) + (y0-1)*reduced_width] != 0) {nighber++; nighber_index= (x0+1) + (y0-1)*reduced_width;}

						if (nighber == 0)
						{
							Label[center_index] = label_count;
							label_count = label_count + 1;
						}

						else if (nighber == 1)
						{
							Label[center_index] = Label[nighber_index];
						}

						else if (nighber > 1)
						{
							Label[center_index] = Label[nighber_index];
							Label[(x0-1) + (y0-1)*reduced_width] = Label[center_index];
							Label[(x0-1) + (y0)*reduced_width] = Label[center_index];
							Label[(x0) + (y0-1)*reduced_width]  = Label[center_index];
							Label[(x0+1) + (y0-1)*reduced_width] = Label[center_index];
						}
					}
				}
			}
	////////////////////////////////////////// merging the possible splitted objects //////////////////////////////

			//printf ("start of second loop \n");
			for(y_index = 1; y_index < reduced_height-1 ; y_index++)
			{
				for(x_index = 1; x_index < reduced_width-1 ; x_index++)
				{
					x0 = x_index;
					y0= y_index;
					center_index = x_index + y_index*reduced_width;
					top_index = x_index + (y_index-1)*reduced_width;

					if (Label[center_index] != 0 && Label[top_index] != 0 && Label[center_index] !=  Label[top_index])
					{
						i = center_index;
						while (Label[i] != 0)
						{
							Label[i] = Label[top_index];
							i--;
						}

						i = center_index + 1;
						while (Label[i] != 0)
						{
							Label[i] = Label[top_index];
							i++;
						}
					}

				/***************** MAX Min calculation *****************/
					if (Label[center_index] != 0)
					{
						index = Label[center_index];
						if (bloblist[index].tag == 0)
						{
							bloblist[index].max_x = x_index;
							bloblist[index].min_x = x_index;
							bloblist[index].max_y = y_index;
							bloblist[index].min_y = y_index;
							bloblist[index].tag =1;
						}
						else
						{
							if ( x_index > bloblist[index].max_x)
								bloblist[index].max_x = x_index;
							if ( x_index < bloblist[index].min_x)
								bloblist[index].min_x = x_index;
							if ( y_index > bloblist[index].max_y)
								bloblist[index].max_y = y_index;
							if ( y_index < bloblist[index].min_y)
								bloblist[index].min_y = y_index;
						}
					}
				}
			}


	//////////////////////////////////////////////////  calculation and show the results
//			printf ("blob filtering \n");
			j = 0;

//			recording min_x, min_y, wx, and wy parameters to Bloblist for later rectangle drawing
			for(i= 0; i<1000 ; i++)
			{
				if ((bloblist[i].max_x-bloblist[i].min_x > (32/down_resolution_x_sampling_size)) && (bloblist[i].max_y-bloblist[i].min_y > (32/down_resolution_y_sampling_size)))
				{
					if(bloblist[i].max_x-bloblist[i].min_x < (512/down_resolution_x_sampling_size))
					{
						m_Blob.blob_id = j;
						m_Blob.wx = (bloblist[i].max_x - bloblist[i].min_x)*down_resolution_x_sampling_size;
						m_Blob.wy = (bloblist[i].max_y - bloblist[i].min_y)*down_resolution_y_sampling_size;
						m_Blob.min_x = (bloblist[i].min_x)*down_resolution_x_sampling_size;
						m_Blob.min_y = (bloblist[i].min_y)*down_resolution_y_sampling_size;

						m_Bloblist.blob[j]  = m_Blob;

						//printf ("blob_id:%d  min_x:%d  min_y:%d  x_width:%d  y_width:%d \n", m_Blob.blob_id , m_Blob.min_x, m_Blob.min_y, m_Blob.wx, m_Blob.wy);
						//printf ("max_x:%d  min_x:%d  max_y:%d  min_y:%d \n", bloblist[i].max_x , bloblist[i].min_x, bloblist[i].max_y, bloblist[i].min_y);
						j ++;
					}
				}
			}

			m_Bloblist.blobtotal = j;
			//printf ("The total number of objects detected is %d \n", j);

//			printf ("m_Bloblist.blobtotal = %d \n\r", m_Bloblist.blobtotal);
//			printf("CPU0: object_detection finish\n\r");
//			XTime_GetTime(&finish);
//			time = (double)(finish - start) / 333000000 * 1000;
//			printf("object_detection takes %f ms.\r\n", time);

			if(double_buf)
			{
				Bloblist_Buf0 = m_Bloblist;
//				printf ("Bloblist_Buf0.blobtotal = %d \n\r", Bloblist_Buf0.blobtotal);
//				COMM_VAL = 1;
			}
			else
			{
				Bloblist_Buf1 = m_Bloblist;
//				printf ("Bloblist_Buf1.blobtotal = %d \n\r", Bloblist_Buf1.blobtotal);
//				COMM_VAL = 2;
			}
			XTime_GetTime(&finish);
			time = (double)(finish - start) / 333000;
			FrameNumber++;
			TotalTime += time;
//			printf("object_detection takes %f ms.\r\n", time);

//write back

			u32 *read_pointer, *read_pointer_del;
			if (double_buf == 1)
			{
				read_pointer = VOVRLAY_READ_REGION;
				read_pointer_del = read_pointer + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY / 4;
			}
			if (double_buf == 0)
			{
				read_pointer_del = VOVRLAY_READ_REGION;
				read_pointer = read_pointer_del + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * FRAME_VERTICAL_LEN_VIDEO_OVERLAY / 4;
			}

			//erase the old blobs from previous slides;
			for (i=0 ; i< Blob_count_past; i++)
			{
				wx_past = m_Bloblist_past.blob[i].wx;
				wy_past = m_Bloblist_past.blob[i].wy;
				min_x_past = m_Bloblist_past.blob[i].min_x;
				min_y_past = m_Bloblist_past.blob[i].min_y;
//				object_focus (min_x_past, min_y_past, wx_past, wy_past, read_pointer_del, 0XFFFFFFFF,  0, VIDEO_OVERLAY_VDMA_ID);
			}
			//passing the current blob parameters for drawing
			Blob_count_curr = m_Bloblist.blobtotal;

			for (i=0 ; i< Blob_count_curr; i++)
			{
				wx_curr = m_Bloblist.blob[i].wx;
				wy_curr = m_Bloblist.blob[i].wy;
				min_x_curr = m_Bloblist.blob[i].min_x;
				min_y_curr = m_Bloblist.blob[i].min_y;
//				object_focus (min_x_curr, min_y_curr, wx_curr, wy_curr, read_pointer, 0XFFFFFFFF,  (Blob_count_curr & 0x00000001), VIDEO_OVERLAY_VDMA_ID);
				// passing the current blob to the old array for later erase
				m_Bloblist_past.blob[i].wx = wx_curr;
				m_Bloblist_past.blob[i].wy = wy_curr;
				m_Bloblist_past.blob[i].min_x = min_x_curr;
				m_Bloblist_past.blob[i].min_y = min_y_curr;
			}
			Blob_count_past = Blob_count_curr;

	return 0;
}
