/*
 * vdma_cfg.h
 *
 *  Created on: Apr 8, 2015
 *      Author: xufaneric
 */

#ifndef VDMA_CFG_H_
#define VDMA_CFG_H_


#include <stdio.h>
#include "xaxivdma.h"
#include "xparameters.h"
#include "xscugic.h"

/****************************** Subframe Resolution **********************************/

#define MAX_WIDTH 0x800
#define MAX_HEIGHT 0x438
#define SUB_WIDTH 1280
#define SUB_HEIGHT 720

/****************************** VDMAs ID **********************************/
#define MoG_VDMA_ID					XPAR_AXIVDMA_0_DEVICE_ID
#define VIDEO_OVERLAY_VDMA_ID		XPAR_AXIVDMA_1_DEVICE_ID
#define YCBCR2MEM_VDMA_ID			XPAR_AXIVDMA_2_DEVICE_ID
/****************************** No. of VDMA **********************************/
#define NUMBER_OF_VDMAS 2
/****************************** Enabling the VDMA **********************************/
#define MoG_VDMA_INIT
#define VOUT_OVERLAY_VDMA_INIT
#define YCBCR2MEM_VDMA_INIT
/****************************** DDR Address Space Definitions **********************************/
#ifdef XPAR_V6DDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_V6DDR_0_S_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_V6DDR_0_S_AXI_HIGHADDR
#elif XPAR_S6DDR_0_S0_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_S6DDR_0_S0_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_S6DDR_0_S0_AXI_HIGHADDR
#elif XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_AXI_7SDDR_0_S_AXI_HIGHADDR
#else
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
			DEFAULT SET TO 0x01000000

#define DDR_START_OFFSET 	0x01000000
#define DDR_BASE_ADDR		0x00000000 + DDR_START_OFFSET
#define DDR_HIGH_ADDR		0x1FFFFFFF

#endif
/****************************** Transfer Directions **********************************/
#define READ_WRITE  2
#define ONLY_READ  1
#define ONLY_WRITE 0
/****************************** VDMA Specific Definitions **********************************/
/* Subframe to be transferred by Video DMA
 *
 *|<----------------- FRAME_HORIZONTAL_LEN ---------------------->|
 * --------------------------------------------------------------------
 *|                                                                | ^
 *|                                                                | |
 *|               |<-SUBFRAME_HORIZONTAL_SIZE ->|                  | FRAME_
 *|               -----------------------------------              | VERTICAL_
 *|               |/////////////////////////////|  ^               | LEN
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////| SUBFRAME_        | |
 *|               |/////////////////////////////| VERTICAL_        | |
 *|               |/////////////////////////////| SIZE             | |
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////|  v               | |
 *|                ----------------------------------              | |
 *|                                                                | v
 *--------------------------------------------------------------------
 *
 * Note that SUBFRAME_HORIZONTAL_SIZE and SUBFRAME_VERTICAL_SIZE must ensure
 * to be inside the frame.
 */

/************************************************************************************/
/******************** MoG Address Space Definition **********************************/
/************************************************************************************/
/* Delay timer counter
 *
 * WARNING: If you are using fsync, please increase the delay counter value
 * to be 255. Because with fsync, the inter-frame delay is long. If you do not
 * care about inactivity of the hardware, set this counter to be 0, which
 * disables delay interrupt.
 */
//#define DELAY_TIMER_COUNTER	10
#define DELAY_TIMER_COUNTER	0


#define ADDRESS_SPACE_FOR_PARAMETERS 0x0B000000
#define MEM_BASE_ADDR_MoG		DDR_BASE_ADDR
#define MEM_HIGH_ADDR_MoG		DDR_BASE_ADDR + ADDRESS_SPACE_FOR_PARAMETERS
#define MEM_SPACE_MoG		(MEM_HIGH_ADDR_MoG - MEM_BASE_ADDR_MoG)

/* Read channel and write channel start from the same place
 *
 * One video IP write to the memory region, the other video IP read from it
 *
 */
//MoG Param
#define READ_ADDRESS_BASE_MoG_VDMA	MEM_BASE_ADDR_MoG
#define WRITE_ADDRESS_BASE_MoG_VDMA	MEM_BASE_ADDR_MoG

/* Frame size related constants
 */
//original, for 1024*768, 60Hz
#define FRAME_HORIZONTAL_LEN_MoG  MAX_WIDTH*16   /* 1920 pixels, each pixel 4 bytes */
#define FRAME_VERTICAL_LEN_MoG    MAX_HEIGHT    /* 1080 pixels */


//MoG Subframe Definitions
#define SUBFRAME_START_OFFSET_MoG    (FRAME_HORIZONTAL_LEN_MoG * 5 + 32)

//original, for 1024*768, 60Hz
#define SUBFRAME_HORIZONTAL_SIZE_MoG SUB_WIDTH*16
#define SUBFRAME_VERTICAL_SIZE_MoG   SUB_HEIGHT

//#define SUBFRAME_HORIZONTAL_SIZE_MoG 0x4000
//#define SUBFRAME_VERTICAL_SIZE_MoG   0x300
//for camera 1280*720 30Hz
//#define SUBFRAME_HORIZONTAL_SIZE_MoG 0x5000
//#define SUBFRAME_VERTICAL_SIZE_MoG   0x2D0

//MoG
/* Number of frames to work on, this is to set the frame count threshold
 *
 * We multiply 15 to the num stores is to increase the intervals between
 * interrupts. If you are using fsync, then it is not necessary.
 */
#define NUMBER_OF_READ_FRAMES_MoG	1
#define NUMBER_OF_WRITE_FRAMES_MoG	1

/**********************************************************************************************/
/******************** Video Overlay Address Space Definition **********************************/
/**********************************************************************************************/

//Address Spaces are for Full HD resolution
#define ADDRESS_GAP 0x00010000

#define ADDRESS_SPACE_FOR_FG_MASK 0x000A0000
#define MEM_BASE_ADDR_VIDEO_OVERLAY		MEM_HIGH_ADDR_MoG + ADDRESS_GAP
#define MEM_HIGH_ADDR_VIDEO_OVERLAY		MEM_HIGH_ADDR_MoG + ADDRESS_GAP + ADDRESS_SPACE_FOR_FG_MASK
#define MEM_SPACE_VIDEO_OVERLAY		(MEM_HIGH_ADDR_VIDEO_OVERLAY - MEM_BASE_ADDR_VIDEO_OVERLAY)

#define MEM_BASE_ADDR_VIDEO_OVERLAY_CPU1 0x10000000

//Read Base Address
//Video Overlay
//CPU0
//#define READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA	 MEM_BASE_ADDR_VIDEO_OVERLAY
//CPU1
#define READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA	 MEM_BASE_ADDR_VIDEO_OVERLAY_CPU1

//#define READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA	 0

#define ADDRESS_SPACE_FOR_READ_FG_MASK 0x00050000

#define WRITE_ADDRESS_BASE_VIDEO_OVERLAY_VDMA (MEM_BASE_ADDR_VIDEO_OVERLAY + ADDRESS_SPACE_FOR_READ_FG_MASK + ADDRESS_GAP)
//#define WRITE_ADDRESS_BASE_VIDEO_OVERLAY_VDMA READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA

//original, for 1024*768, 60Hz
#define FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY  MAX_WIDTH / 0x8   /* 1920 pixels, each pixel 1 bit */
#define FRAME_VERTICAL_LEN_VIDEO_OVERLAY    MAX_HEIGHT   /* 1080 pixels */

#define VIDEO_OVERLAY_VDMA_STRIDE FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY

//Video Overlay Subframe Definitions
#define SUBFRAME_START_OFFSET_VIDEO_OVERLAY    (FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY * 5 + 32)


//original, for 1024*768, 60Hz
#define SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY SUB_WIDTH / 0x8 //always multiple of 32
#define SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY SUB_HEIGHT

//#define SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY 0X400 / 0x8 //always multiple of 32
//#define SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY 0x300

//for camera 1280*720 30Hz
//#define SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY   0x5000
//#define SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY   0x2D0

//Object focus defines
#define LINE_THICKNESS 2

//Video Overlay
#define NUMBER_OF_READ_FRAMES_VIDEO_OVERLAY		2
#define NUMBER_OF_WRITE_FRAMES_VIDEO_OVERLAY	2

//Interrupt Counter Threshold
#define NUMBER_OF_READ_FRAMES_VIDEO_OVERLAY_INTR	1
#define NUMBER_OF_WRITE_FRAMES_VIDEO_OVERLAY_INTR	1

/******************************************************************/
/**********************************************************************************************/
/******************** YCBCR Address Space Definition **********************************/
/**********************************************************************************************/

//Address Spaces are for Full HD resolution
#define ADDRESS_GAP 0x00010000

#define ADDRESS_SPACE_FOR_YCBCR_DATA 0x00400000

#define MEM_BASE_ADDR_YCBCR2MEM		MEM_HIGH_ADDR_VIDEO_OVERLAY + ADDRESS_GAP
#define MEM_HIGH_ADDR_YCBCR2MEM		MEM_HIGH_ADDR_VIDEO_OVERLAY + ADDRESS_GAP + ADDRESS_SPACE_FOR_YCBCR_DATA
#define MEM_SPACE_YCBCR2MEM			(MEM_HIGH_ADDR_YCBCR2MEM - MEM_BASE_ADDR_YCBCR2MEM)

//Read Base Address
//Video Overlay
#define READ_ADDRESS_BASE_YCBCR2MEM_VDMA	 MEM_BASE_ADDR_VIDEO_OVERLAY

//#define READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA	 0

//#define ADDRESS_SPACE_FOR_READ_FG_MASK 0x00050000

//#define WRITE_ADDRESS_BASE_VIDEO_OVERLAY_VDMA (MEM_BASE_ADDR_VIDEO_OVERLAY + ADDRESS_SPACE_FOR_READ_FG_MASK + ADDRESS_GAP)

#define WRITE_ADDRESS_BASE_YCBCR2MEM_VDMA MEM_BASE_ADDR_YCBCR2MEM

#define FRAME_HORIZONTAL_LEN_YCBCR2MEM   MAX_WIDTH * 0x2   /* 1920 pixels, each pixel 16 bit */
#define FRAME_VERTICAL_LEN_YCBCR2MEM     MAX_HEIGHT   /* 1080 pixels */

//Video Overlay Subframe Definitions
#define SUBFRAME_START_OFFSET_YCBCR2MEM     	(FRAME_HORIZONTAL_LEN_YCBCR2MEM * 5 + 32)
#define SUBFRAME_HORIZONTAL_SIZE_YCBCR2MEM  	SUB_WIDTH * 0x2 //always multiple of 32
#define SUBFRAME_VERTICAL_SIZE_YCBCR2MEM 		SUB_HEIGHT

//Video Overlay
#define NUMBER_OF_READ_FRAMES_YCBCR2MEM		1
#define NUMBER_OF_WRITE_FRAMES_YCBCR2MEM 	1

/******************************************************************/

int vdma_cfg (void);

/*
 * Device instance definitions
 */
/* Struct instance for VDMA block(s) */
struct vdma_chan_parms {
	u32 AXIVDMA_DEVICE_ID;
    u32 RD_ADDR_BASE;
    u32 WR_ADDR_BASE;
	u32 FrameHoriz;
	u32 FrameVert;
	u32 BlockStartOffset;
	u32 BlockHoriz;
	u32 BlockVert;
	u32 FrameWidth;
	u32 FrameHeight;
	u32 Num_Read_Frames;
	u32 Num_Write_Frames;
	XAxiVdma AxiVdma;
	XAxiVdma_DmaSetup ReadCfg;
	XAxiVdma_DmaSetup WriteCfg;
	XAxiVdma_Config *Config;
	XAxiVdma_FrameCounter FrameCfg;
	u32 *buf_pointer;
};


#endif /* VDMA_CFG_H_ */
