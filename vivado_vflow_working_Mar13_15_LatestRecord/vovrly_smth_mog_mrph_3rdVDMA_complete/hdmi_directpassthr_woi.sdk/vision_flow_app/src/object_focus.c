/*
 * object_focus.c
 *
 *  Created on: Aug 21, 2014
 *      Author: msabbagh
 */


#include "object_focus.h"

int object_focus (
		u32 X_c,//# pixels
		u32 Y_c,//# pixels
		u32 Width,//# pixels
		u32 Height,//# pixels
		u32 base_address,//Base address for writing the value
		u32 value,//32 bit value
		u32 SetClear,//1 set, 0 clear
		u32 VdmaId//VDMA ID
		)
{
	//Width is in terms of 32 bit
	int i, j;//loop indices
	u32 start_address;
	u32 * offset_pointer, base_pointer;
	//u32 volatile start_address;
	//u32 volatile * offset_pointer, base_pointer;
	u32 index;
	u32 shift_amount;
	u32 remain;
	u32 temp0;
	//Calculate remaining of X_c after dividing by 32
	temp0 = (X_c / 32) * 4;
	//Calculate Start Address for drawing the Rectangular Address
	//start_address = (READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA + SUBFRAME_START_OFFSET_VIDEO_OVERLAY) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	start_address = (base_address + SUBFRAME_START_OFFSET_VIDEO_OVERLAY) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	//start_address = (READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	base_pointer = start_address;

	index = (Width / 32);
	remain = Width % 32;
	for(j=0; j < LINE_THICKNESS; j++)
	{
		//set the offset
		offset_pointer = base_pointer;
				for(i=0; i < index; i+=1)
				{
					//Set the value
					if(SetClear)
						*offset_pointer |= value;
					else
						*offset_pointer &= SetClear;
					//go on the line
					offset_pointer++;
				}
				if(remain != 0)
				{
					if(SetClear)
						*offset_pointer |= ~(value << remain);
					else
						*offset_pointer &= (value << remain);
				}
				//go to next line
				base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
	}

	//Side lines drawing
	for(j=0; j<(Height-3); j++)
		{
			//Calculate Line Start Address
			offset_pointer = base_pointer;
			//Set the value
			if(SetClear)
				*offset_pointer |= value & (LINE_THICKNESS + 1);
			else
				*offset_pointer &= ~(value & (LINE_THICKNESS + 1));
			//Calculate End of Line Start Address + Set the Value
			if(Width >= 32)
				{
					if(remain == 0)
						{
							//Calculate End of Line Start Address
							offset_pointer += (Width/32) - 1;
							//Set the value
							if(SetClear)
								*offset_pointer |= ~(value >> (LINE_THICKNESS));
							else
								*offset_pointer &= (value >> (LINE_THICKNESS));
						}
					if(remain == 1)
						{
							//Calculate End of Line Start Address
							offset_pointer += (Width/32) - 1;
							//Set the value
							if(SetClear)
								*offset_pointer |= ~(value >> (LINE_THICKNESS/2));
							else
								*offset_pointer &= (value >> (LINE_THICKNESS/2));
							//Calculate End of Line Start Address
							offset_pointer ++;
							//Set the value
							if(SetClear)
								*offset_pointer |= ~(value << (LINE_THICKNESS/2));
							else
								*offset_pointer &= (value << (LINE_THICKNESS/2));
						}
					if(remain >= 2)
						{
							//diff_32 = Width - 32;
							shift_amount = remain - LINE_THICKNESS;
							//Calculate End of Line Start Address
							offset_pointer += (Width/32);
							//Set the value
							if(SetClear)
								*offset_pointer |= ((LINE_THICKNESS + 1) << shift_amount);
							else
								*offset_pointer &= ~((LINE_THICKNESS + 1) << shift_amount);
						}
				}
			else
				{
					//Set the value
					if(SetClear)
						*offset_pointer |= ((LINE_THICKNESS + 1) << (Width - 2));
					else
						*offset_pointer &= ~((LINE_THICKNESS + 1) << (Width - 2));
				}
			//go to the next line
			base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
		}


	for(j=0; j<LINE_THICKNESS; j++)
		{
		//set the offset
		offset_pointer = base_pointer;
				//Calculate Rectangular Start Address
				for(i=0; i < index; i+=1)
					{
					//Set the value
					if(SetClear)
						*offset_pointer |= value;
					else
						*offset_pointer &= SetClear;
					//go on the line
					offset_pointer++;
					}
				if(remain != 0)
				{
					if(SetClear)
						*offset_pointer |= ~(value << remain);
					else
						*offset_pointer &= (value << remain);
				}
				//go to next line
				base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
		}

	return 0;

}
