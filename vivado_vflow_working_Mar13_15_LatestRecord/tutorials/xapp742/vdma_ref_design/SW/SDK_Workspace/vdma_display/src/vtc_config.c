/* $Id: */
/******************************************************************************
 -- (c) Copyright 2013 - 2011 Xilinx, Inc. All rights reserved.
 --
 -- This file contains confidential and proprietary information
 -- of Xilinx, Inc. and is protected under U.S. and
 -- international copyright and other intellectual property
 -- laws.
 --
 -- DISCLAIMER
 -- This disclaimer is not a license and does not grant any
 -- rights to the materials distributed herewith. Except as
 -- otherwise provided in a valid license issued to you by
 -- Xilinx, and to the maximum extent permitted by applicable
 -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 -- (2) Xilinx shall not be liable (whether in contract or tort,
 -- including negligence, or under any other theory of
 -- liability) for any loss or damage of any kind or nature
 -- related to, arising under or in connection with these
 -- materials, including for any direct, or any indirect,
 -- special, incidental, or consequential loss or damage
 -- (including loss of data, profits, goodwill, or any type of
 -- loss or damage suffered as a result of any action brought
 -- by a third party) even if such damage or loss was
 -- reasonably foreseeable or Xilinx had been advised of the
 -- possibility of the same.
 --
 -- CRITICAL APPLICATIONS
 -- Xilinx products are not designed or intended to be fail-
 -- safe, or for use in any application requiring fail-safe
 -- performance, such as life-support or safety devices or
 -- systems, Class III medical devices, nuclear facilities,
 -- applications related to the deployment of airbags, or any
 -- other applications that could lead to death, personal
 -- injury, or severe property or environmental damage
 -- (individually and collectively, "Critical
 -- Applications"). Customer assumes the sole risk and
 -- liability of any use of Xilinx products in Critical
 -- Applications, subject only to applicable laws and
 -- regulations governing limitations on product liability.
 --
 -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 -- PART OF THIS FILE AT ALL TIMES.
******************************************************************************/

/*****************************************************************************/
/**
 *
 * @file example.c
 *
 * This file demonstrates how to use Xilinx Video Timing Controller driver on
 * Xilinx MVI Video Timing Controller core.
 *
 * This code makes the following assumptions:
 * - Caching is disabled. Flushing and Invalidation operations for data buffer
 *   need to be added to this code if it is not the case.
 *
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- -------- -------------------------------------------------------
 * 1.00a xd   04/23/09 First release
 * 2.00a xd   04/23/09 Renamed to "Video Timing Controller"
 * </pre>
 *
 * ***************************************************************************
 */

#include "xvtc.h"
#include "xparameters.h"
/*
 * Device related constants. Defined in xparameters.h.
 */


#define NUMBER_VIDEO_TIMING_PARAMS 10
#define NUMBER_VIDEO_RESOLUTIONS 8

static Xuint16 VideoTimingParamValues[NUMBER_VIDEO_RESOLUTIONS][NUMBER_VIDEO_TIMING_PARAMS] = {
   // vav,  vfp,  vsw,  vbp,  vsp,  hav,  hfp,  hsw,  hbp,  hsp
   {  480,   10,    2,   33,    0,  640,   16,   96,   48,    0 }, // VIDEO_RESOLUTION_VGA
   {  480,    9,    6,   30,    1,  720,   16,   62,   60,    1 }, // VIDEO_RESOLUTION_NTSC
   {  600,    1,    4,   23,    1,  800,   40,  128,   88,    1 }, // VIDEO_RESOLUTION_SVGA
   {  768,    3,    6,   29,    1, 1024,   24,  136,  160,    1 }, // VIDEO_RESOLUTION_XGA
   {  720,    5,    5,   20,    1, 1280,  110,   40,  220,    1 }, // VIDEO_RESOLUTION_720P
   { 1024,    1,    3,   26,    1, 1280,   48,  184,  200,    1 }, // VIDEO_RESOLUTION_SXGA
   { 1080,    4,    5,   36,    1, 1920,   88,   44,  148,    1 }, // VIDEO_RESOLUTION_1080P
   { 1200,    1,    3,   46,    1, 1600,   64,  192,  304,    1 }  // VIDEO_RESOLUTION_UXGA
};

/*
 * Video Timing Controller Device related data structures
 */
XVtc Vtc;			/* Device driver instance */
XVtc_Signal Signal;		/* VTC Signal configuration */
XVtc_Polarity Polarity;		/* Polarity configuration */
XVtc_SourceSelect SourceSelect;	/* Source Selection configuration */


/*
 * Function prototypes
 */
static void SignalSetup(XVtc_Signal *SignalCfgPtr,Xuint32 resolution);
static int VtcExample(u16 VtcDeviceID,Xuint32 resolution);


/*****************************************************************************/
/**
*
* This is the main function for the Video Timing Controller example.
*
* @param	None.
*
* @return	0 to indicate success, otherwise 1.
*
* @note	None.
*
****************************************************************************/
int vtc_config(Xuint32 resolution)
{
	int Status,i;

	/*
	 * Call the Video Timing Controller example , specify the Device ID
	 * generated in xparameters.h
	 */
	for(i=0;i<1;i++)
	{
		Status = VtcExample(i,resolution);
		if (Status != 0) {
			return 1;
		}
	}

	return 0;
}

/*****************************************************************************/
/**
*
* This function sets up the Video Timing Controller Signal configuration.
*
* @param	None.
*
* @return	None.
*
* @note		None.
*
****************************************************************************/
static void SignalSetup(XVtc_Signal *SignalCfgPtr,Xuint32 resolution)
{
	int HFrontPorch;
	int HSyncWidth;
	int HBackPorch;
	int VFrontPorch;
	int VSyncWidth;
	int VBackPorch;
	int LineWidth;
	int FrameHeight;


	/* Choose the configuration for 1920@1080 */

//	HFrontPorch = 88;
//	HSyncWidth = 44;
//	HBackPorch = 148;
//	VFrontPorch = 4;
//	VSyncWidth = 5;
//	VBackPorch = 36;
//	LineWidth = 1920;
//	FrameHeight = 1080;
	HFrontPorch = VideoTimingParamValues[resolution][6];
	HSyncWidth  = VideoTimingParamValues[resolution][7];
	HBackPorch  = VideoTimingParamValues[resolution][8];
	VFrontPorch = VideoTimingParamValues[resolution][1];
	VSyncWidth  = VideoTimingParamValues[resolution][2];
	VBackPorch  = VideoTimingParamValues[resolution][3];
	LineWidth   = VideoTimingParamValues[resolution][5];
	FrameHeight = VideoTimingParamValues[resolution][0];

        xil_printf("VTC Config: %d,%d,%d,%d,%d,%d,%d,\n\r",HFrontPorch,HSyncWidth,HBackPorch,VFrontPorch,VSyncWidth,LineWidth,FrameHeight);
	/* Clear the VTC Signal config structure */

	memset((void *)SignalCfgPtr, 0, sizeof(XVtc_Signal));
#if 1
	/* Populate the VTC Signal config structure. Ignore the Field 1 */
	SignalCfgPtr->OriginMode = 0;
	SignalCfgPtr->HFrontPorchStart = 0;
	SignalCfgPtr->HTotal = HFrontPorch + HSyncWidth + HBackPorch
				+ LineWidth - 1;
	SignalCfgPtr->HBackPorchStart = HFrontPorch + HSyncWidth;
	SignalCfgPtr->HSyncStart = HFrontPorch;
	SignalCfgPtr->HActiveStart = HFrontPorch + HSyncWidth + HBackPorch;

	SignalCfgPtr->V0FrontPorchStart = 0;
	SignalCfgPtr->V0Total = VFrontPorch + VSyncWidth + VBackPorch
				+ FrameHeight - 1;
	SignalCfgPtr->V0BackPorchStart = VFrontPorch + VSyncWidth;
	SignalCfgPtr->V0SyncStart = VFrontPorch;
	SignalCfgPtr->V0ChromaStart = VFrontPorch + VSyncWidth + VBackPorch;
	SignalCfgPtr->V0ActiveStart = VFrontPorch + VSyncWidth + VBackPorch;

#else
	/* Populate the VTC Signal config structure. Ignore the Field 1 */
	SignalCfgPtr->HFrontPorchStart = LineWidth;
	SignalCfgPtr->HTotal = HFrontPorch + HSyncWidth + HBackPorch
				+ LineWidth;
	SignalCfgPtr->HBackPorchStart = LineWidth + HFrontPorch + HSyncWidth;
	SignalCfgPtr->HSyncStart = LineWidth + HFrontPorch;
	SignalCfgPtr->HActiveStart = 0;

	SignalCfgPtr->V0FrontPorchStart = FrameHeight;
	SignalCfgPtr->V0Total = VFrontPorch + VSyncWidth + VBackPorch
				+ FrameHeight;
	SignalCfgPtr->V0BackPorchStart = FrameHeight + VFrontPorch + VSyncWidth;
	SignalCfgPtr->V0SyncStart = FrameHeight + VFrontPorch;
	SignalCfgPtr->V0ChromaStart = FrameHeight + VFrontPorch + VSyncWidth + VBackPorch;
	SignalCfgPtr->V0ActiveStart = 0;
#endif
	 return;
}

/*****************************************************************************/
/**
*
* This function is the entry of the feature demonstrations on MVI Video
* Timing Controller core. It initializes the Video Timing Controller device,
* then sets up the video timing controller signal for the generator module,
* polarities of the output, selects source, and last start the Video Timing
* Controller device.
*
* @param	VtcDeviceID is the device ID of the Video Timing Controller core.
*
* @return	0 if all tests pass, 1 otherwise.
*
* @note		None.
*
******************************************************************************/
static int VtcExample(u16 VtcDeviceID,Xuint32 resolution)
{
	int Status;
	XVtc_Config *VtcCfgPtr;

	/* Look for the device configuration info for the Video Timing
	 * Controller.
	 */
	VtcCfgPtr = XVtc_LookupConfig(VtcDeviceID);
	if (VtcCfgPtr == NULL) {
		return 1;
	}

	/* Initialize the Video Timing Controller instance */

	Status = XVtc_CfgInitialize(&Vtc, VtcCfgPtr,
		VtcCfgPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return 1;
	}

	/* Set up Generator */

	SignalSetup(&Signal,resolution);
	XVtc_SetGenerator(&Vtc, &Signal);

	/* Set up Polarity of all outputs */

	memset((void *)&Polarity, 0, sizeof(Polarity));
	Polarity.ActiveChromaPol = 1;
	Polarity.ActiveVideoPol = 1;
	Polarity.FieldIdPol = 0;
	Polarity.VBlankPol = VideoTimingParamValues[resolution][4];
	Polarity.VSyncPol  = VideoTimingParamValues[resolution][4];
	Polarity.HBlankPol = VideoTimingParamValues[resolution][9];
	Polarity.HSyncPol  = VideoTimingParamValues[resolution][9];
//1080p
//	Polarity.VBlankPol = 1;
//	Polarity.VSyncPol = 1;
//	Polarity.HBlankPol = 1;
//	Polarity.HSyncPol = 1;

	XVtc_SetPolarity(&Vtc, &Polarity);

	/* Set up source select */

	memset((void *)&SourceSelect, 0, sizeof(SourceSelect));
	SourceSelect.VChromaSrc = 1;
	SourceSelect.VActiveSrc = 1;
	SourceSelect.VBackPorchSrc = 1;
	SourceSelect.VSyncSrc = 1;
	SourceSelect.VFrontPorchSrc = 1;
	SourceSelect.VTotalSrc = 1;
	SourceSelect.HActiveSrc = 1;
	SourceSelect.HBackPorchSrc = 1;
	SourceSelect.HSyncSrc = 1;
	SourceSelect.HFrontPorchSrc = 1;
	SourceSelect.HTotalSrc = 1;

	XVtc_SetSource(&Vtc, &SourceSelect);


	/* Enable both generator and detector modules */

	if(VtcDeviceID==0)
		XVtc_Enable(&Vtc);
	else
		XVtc_Enable(&Vtc);
	XVtc_RegUpdate(&Vtc);

	/* Return success */

	return 0;
}
