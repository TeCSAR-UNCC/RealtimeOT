/*
 * ObjectFocus.h
 *
 *  Created on: Aug 14, 2014
 *      Author: msabbagh
 */

#ifndef OBJECTFOCUS_H_
#define OBJECTFOCUS_H_

#include "xbasic_types.h"
#include "vdma_cfg.h"

int object_focus (
			u32 X_c,//# pixels
			u32 Y_c,//# pixels
			u32 Width,//# pixels
			u32 Height,//# pixels
			u32 base_address,//Base address for writing the value
			u32 value,//32 bit value
			u32 SetClear,//0 set, 1 clear
			u32 VdmaId//VDMA ID
		);


#endif /* OBJECTFOCUS_H_ */
