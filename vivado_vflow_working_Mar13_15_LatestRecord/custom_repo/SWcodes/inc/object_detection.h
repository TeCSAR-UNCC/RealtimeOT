#ifndef OBJECTDETECTION_H_
#define OBJECTDETECTION_H_

#include "vdma_cfg.h"
#include "common_value_defination.h"
///////////////////////Blob Detection /////////////////////

//#define FRAME_WIDTH SUBFRAME_HORIZONTAL_SIZE_MoG/16
#define FRAME_WIDTH ((SUBFRAME_HORIZONTAL_SIZE_MoG)>>4)
#define FRAME_HEIGHT SUBFRAME_VERTICAL_SIZE_MoG

#define FramSize (FRAME_WIDTH * FRAME_HEIGHT)
#define NUM_PIXELS FramSize

double TotalTime;
int FrameNumber, FrameNumberCounter;
//#define BLOB_BASE_ADDR	WRITE_ADDRESS_BASE_VIDEO_OVERLAY_VDMA + SUBFRAME_START_OFFSET_VIDEO_OVERLAY

struct blob_info
{
	int max_x;
    int min_x;
    int max_y;
    int min_y;
    int tag;
};

struct sBlob
{
	int blob_id;
    int min_x;
	int min_y;
	int wx;
	int wy;
};

struct sBloblist
{
	struct sBlob blob[200];
	int blobtotal;
};

struct sBloblist m_Bloblist;
struct sBloblist m_Bloblist_past;

int object_detection(u32 base_address, u32 double_buf);//Base address for reading the blob mask

#endif
