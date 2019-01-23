/*
 * object_focus.c
 *
 *  Created on: Aug 21, 2014
 *      Author: msabbagh
 */


#include "object_focus.h"
#include "conf.h"
const u8 Bitmaps[300] =
{
		// @0 '0' (11 pixels wide)
		0x1E, 0x00, //    ####
		0x3F, 0x00, //   ######
		0x61, 0x80, //  ##    ##
		0x61, 0x80, //  ##    ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xE1, 0xC0, // ###    ###
		0x61, 0x80, //  ##    ##
		0x3F, 0x00, //   ######
		0x1E, 0x00, //    ####

		// @30 '1' (11 pixels wide)
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x1C, 0x00, //    ###
		0x1F, 0x80, //    ######
		0x1B, 0x80, //    ## ###
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##

		// @60 '2' (11 pixels wide)
		0x3F, 0x00, //   ######
		0x7F, 0x80, //  ########
		0xE1, 0xC0, // ###    ###
		0xC0, 0xC0, // ##      ##
		0xC0, 0x00, // ##
		0xC0, 0x00, // ##
		0x60, 0x00, //  ##
		0x60, 0x00, //  ##
		0x38, 0x00, //   ###
		0x0C, 0x00, //     ##
		0x06, 0x00, //      ##
		0x03, 0x00, //       ##
		0x01, 0x80, //        ##
		0xFF, 0xC0, // ##########
		0xFF, 0xC0, // ##########

		// @90 '3' (11 pixels wide)
		0x1F, 0x00, //    #####
		0x3F, 0x80, //   #######
		0x71, 0xC0, //  ###   ###
		0x60, 0xC0, //  ##     ##
		0x60, 0x00, //  ##
		0x70, 0x00, //  ###
		0x3C, 0x00, //   ####
		0x7C, 0x00, //  #####
		0x60, 0x00, //  ##
		0xC0, 0x00, // ##
		0xC0, 0x00, // ##
		0xC0, 0xC0, // ##      ##
		0xE1, 0xC0, // ###    ###
		0x7F, 0x80, //  ########
		0x1F, 0x00, //    #####

		// @120 '4' (11 pixels wide)
		0x30, 0x00, //   ##
		0x38, 0x00, //   ###
		0x3C, 0x00, //   ####
		0x3C, 0x00, //   ####
		0x36, 0x00, //   ## ##
		0x33, 0x00, //   ##  ##
		0x31, 0x80, //   ##   ##
		0x30, 0xC0, //   ##    ##
		0x30, 0x60, //   ##     ##
		0xFF, 0xE0, // ###########
		0xFF, 0xE0, // ###########
		0x30, 0x00, //   ##
		0x30, 0x00, //   ##
		0x30, 0x00, //   ##
		0x30, 0x00, //   ##

		// @150 '5' (11 pixels wide)
		0x7F, 0x00, //  #######
		0x7F, 0x00, //  #######
		0x03, 0x00, //       ##
		0x03, 0x00, //       ##
		0x01, 0x80, //        ##
		0x3F, 0x80, //   #######
		0x7F, 0x80, //  ########
		0xE1, 0x80, // ###    ##
		0xC0, 0x00, // ##
		0xC0, 0x00, // ##
		0xC0, 0x00, // ##
		0xC0, 0xC0, // ##      ##
		0x61, 0xC0, //  ##    ###
		0x7F, 0x80, //  ########
		0x1F, 0x00, //    #####

		// @180 '6' (11 pixels wide)
		0x3E, 0x00, //   #####
		0x7F, 0x00, //  #######
		0xE3, 0x80, // ###   ###
		0xC1, 0x80, // ##     ##
		0x00, 0xC0, //         ##
		0x3E, 0xC0, //   ##### ##
		0x7F, 0xC0, //  #########
		0x61, 0xC0, //  ##    ###
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC1, 0x80, // ##     ##
		0x63, 0x80, //  ##   ###
		0x7F, 0x00, //  #######
		0x1E, 0x00, //    ####

		// @210 '7' (11 pixels wide)
		0xFF, 0xC0, // ##########
		0xFF, 0xC0, // ##########
		0xC0, 0x00, // ##
		0x60, 0x00, //  ##
		0x60, 0x00, //  ##
		0x30, 0x00, //   ##
		0x30, 0x00, //   ##
		0x18, 0x00, //    ##
		0x18, 0x00, //    ##
		0x0C, 0x00, //     ##
		0x0C, 0x00, //     ##
		0x0C, 0x00, //     ##
		0x06, 0x00, //      ##
		0x06, 0x00, //      ##
		0x03, 0x00, //       ##

		// @240 '8' (11 pixels wide)
		0x1E, 0x00, //    ####
		0x3F, 0x00, //   ######
		0x61, 0x80, //  ##    ##
		0x61, 0x80, //  ##    ##
		0x61, 0x80, //  ##    ##
		0x33, 0x00, //   ##  ##
		0x1E, 0x00, //    ####
		0x3F, 0x00, //   ######
		0x73, 0x80, //  ###  ###
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xE1, 0xC0, // ###    ###
		0x7F, 0x80, //  ########
		0x3F, 0x00, //   ######

		// @270 '9' (11 pixels wide)
		0x1E, 0x00, //    ####
		0x3F, 0x80, //   #######
		0x71, 0x80, //  ###   ##
		0x60, 0xC0, //  ##     ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xC0, 0xC0, // ##      ##
		0xE1, 0x80, // ###    ##
		0xFF, 0x80, // #########
		0xDF, 0x00, // ## #####
		0xC0, 0x00, // ##
		0x60, 0xC0, //  ##     ##
		0x71, 0xC0, //  ###   ###
		0x3F, 0x80, //   #######
		0x1F, 0x00, //    #####
};

int object_focus (
		u32 X_c,//# pixels
		u32 Y_c,//# pixels
		u32 Width,//# pixels
		u32 Height,//# pixels
		u32 base_address,//Base address for writing the value
		u32 value,//32 bit value
		u32 SetClear,//1 set, 0 clear
		u32 VdmaId,//VDMA ID
		u32 Label
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
	//temp0 = (X_c / 32) * 4;
	temp0 = (X_c >> 5) << 2;
	u32 x_residue = X_c & 31;
	u32 right_line_residue = (X_c + Width - 2) & 31; // mod 32

//	temp0 = X_c / 8;
	//Calculate Start Address for drawing the Rectangular Address
	//start_address = (READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA + SUBFRAME_START_OFFSET_VIDEO_OVERLAY) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	start_address = (base_address + SUBFRAME_START_OFFSET_VIDEO_OVERLAY) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	//start_address = (READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA) + ( temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * Y_c );
	base_pointer = start_address;

	if (x_residue != 0){
		if(Width < 32 - x_residue)
			index = 0;
		else
			index = ((Width - (32 - x_residue)) / 32);
	}
	else
		index = ((Width) / 32);
	remain = (Width + x_residue) & 31;

//xil_printf("index:%8d, x_residue:%d, right_residue:%d\n",index, x_residue, right_line_residue);
	for (j = 0; j < LINE_THICKNESS; j++) {
		//set the offset
		offset_pointer = base_pointer;
		if (x_residue != 0) {
			//Set the value
			if (SetClear)
				*offset_pointer |= ~(value >> (32 - x_residue));
			else
				*offset_pointer &= SetClear;
		}
		if ((index || Width + x_residue > 31)&&(x_residue))
			offset_pointer++;
		for (i = 0; i < index; i += 1) {
			//Set the value
			if (SetClear)
				*offset_pointer |= value;
			else
				*offset_pointer &= SetClear;
			//go on the line
			offset_pointer++;
		}
		if (remain != 0) {
			if (SetClear)
				if (!index && Width + x_residue <= 31)
					if (x_residue)
						*offset_pointer &= ~(value << remain);
					else
						*offset_pointer |= ~(value << remain);
				else
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
			//left vertical line
			offset_pointer = base_pointer;
			if (x_residue == 31)
			{
				if(SetClear)
					*offset_pointer |= ~(value >> 1);
				else
					*offset_pointer = SetClear;
				offset_pointer++;
				if(SetClear)
					*offset_pointer |= 1;
				else
					*offset_pointer = SetClear;
				offset_pointer--; //for drawing the vertical line, keep the pointer as the same as x_residue!=31
			}
			else
				if(SetClear)
					*offset_pointer |= (value & (LINE_THICKNESS + 1)) << x_residue;
				else
					*offset_pointer = SetClear;


			//right vertical line
			offset_pointer += (x_residue + Width - 2) >> 5; // =()/32

			if (right_line_residue == 31)
			{
				if(SetClear)
					*offset_pointer |= ~(value >> 1);
				else
					*offset_pointer = SetClear;
				offset_pointer++;

				if(SetClear)
					*offset_pointer |= 1;
				else
					*offset_pointer = SetClear;
			}
			else
				if(SetClear)
					*offset_pointer |= (value & (LINE_THICKNESS + 1)) << right_line_residue;
				else
					*offset_pointer = SetClear;
			//go to the next line
			base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
		}

	for (j = 0; j < LINE_THICKNESS; j++) {
		//set the offset
		offset_pointer = base_pointer;
		if (x_residue != 0) {
			//Set the value
			if (SetClear)
				*offset_pointer |= ~(value >> (32 - x_residue));
			else
				*offset_pointer &= SetClear;
		}
		if ((index || Width + x_residue > 31)&&(x_residue))
			offset_pointer++;
		for (i = 0; i < index; i += 1) {
			//Set the value
			if (SetClear)
				*offset_pointer |= value;
			else
				*offset_pointer &= SetClear;
			//go on the line
			offset_pointer++;
		}
		if (remain != 0) {
			if (SetClear)
				if (!index && Width + x_residue <= 31)
					if (x_residue)
						*offset_pointer &= ~(value << remain);
					else
						*offset_pointer |= ~(value << remain);
				else
					*offset_pointer |= ~(value << remain);
			else
				*offset_pointer &= (value << remain);
		}
		//go to next line
		base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
	}

#ifdef LABELING
	if (Y_c < 16)
		return 0;
	start_address = (base_address + SUBFRAME_START_OFFSET_VIDEO_OVERLAY)
			+ (temp0 + FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * (Y_c - 16)); //align to int
	base_pointer = start_address;

//	offset_pointer = start_address;
	int l1, l2;
	unsigned int number = 0;
	if (!SetClear) {
		// remove previous result
		for (i = 0; i < 16; ++i) {
			offset_pointer = base_pointer;
			if (x_residue == 0)
				*offset_pointer = 0;
			else {
				*offset_pointer++ = 0;
				*offset_pointer++ = 0;
			}
//			offset_pointer += VIDEO_OVERLAY_VDMA_STRIDE;
			base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
		}
	} else {
		// draw new data
		for (i = 0; i < 16; ++i) {
			offset_pointer = base_pointer;
			l1 = (Label/10)%10;
			l2 = (Label%10);
			number = 0;
			if (l1 == 0)
//				*offset_pointer = (digiLib[l2][i]);
				number |= (Bitmaps[l2*30+i*2]<<24)|(Bitmaps[l2*30+i*2+1]<<16);
			else
//				*offset_pointer = (digiLib[l1][i])|(digiLib[l2][i]<<8);
				number |= (Bitmaps[l2*30+i*2]<<24)|(Bitmaps[l2*30+i*2+1]<<16)|(Bitmaps[l1*30+i*2]<<8)|(Bitmaps[l1*30+i*2+1]);

			if (x_residue == 0)
				*offset_pointer |= number;
			else {
				*offset_pointer++ |= number << x_residue;
				*offset_pointer++ |= number >> (32 - x_residue);
			}

//			offset_pointer += VIDEO_OVERLAY_VDMA_STRIDE;
			base_pointer = base_pointer + VIDEO_OVERLAY_VDMA_STRIDE;
		}
	}

#endif




	return 0;

}
