/*
 * object_focus.h
 *
 *  Created on: Mar 19, 2015
 *      Author: xufaneric
 */

#ifndef OBJECT_FOCUS_H_
#define OBJECT_FOCUS_H_

#include "xbasic_types.h"
#include "vdma_cfg.h"
#include "matrix.h"

int object_focus (
			u32 X_c,//# pixels
			u32 Y_c,//# pixels
			u32 Width,//# pixels
			u32 Height,//# pixels
			u32 base_address,//Base address for writing the value
			u32 value,//32 bit value
			u32 SetClear,//0 set, 1 clear
			u32 VdmaId,//VDMA ID
			u32 Label
		);

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


struct Blob_Tracking
{
	int blobID;
	int centerX;
	int centerY;
//	int centerXPrev[60];
//	int centerYPrev[60];
//	int velocityX[60];
//	int velocityY[60];
//	int velocityXAve;
//	int velocityYAve;
//	int centerXPrevAve;
//	int centerYPrevAve;
//	double slope;
	int width;
	int height;
	//int widthPrev[60];
	//int heightPrev[60];
	int histogram[256];
	int minScore; //for every frame
//	double histogram[256];
//	int moveX;
//	int moveY;
//	int centerXLast;
//	int centerYLast;
//	int velXLast;
//	int velYLast;
	int velX;
	int velY;
	int velWidth;
	int velHeight;
	struct _Matrix_X X_solid;
	struct _Matrix_P P_solid;
	struct _Matrix X;
	struct _Matrix P;
	struct _Matrix_X WHX_solid;
	struct _Matrix_P WHP_solid;
	struct _Matrix WHX;
	struct _Matrix WHP;
	int hitCounter;
	int missCounter;
	int isActualFlag;
	int isPotentialFlag;
	int isInListFlag;
	int isNewAdded;
//	int predictNum;
};

struct Bloblist_Tracking
{
	struct Blob_Tracking blob[200];
	int actualNumber;
	int potentialNumber;
	int existNumber;
	int totalNumber;
};

#endif /* OBJECT_FOCUS_H_ */
