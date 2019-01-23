/*
 * main.c
 *
 *  Created on: Jun 29, 2014
 *      Author: msabbagh
 */

#include "vision_flow.h"

fmc_imageon_hdmi_passthrough_t demo;

void print( const char *str);

void vision_flow()
{
	int reconfig, default_param;

	u32 MD_THRESHOLD = 0;
	u32 LEARNING_FACTOR = 0;
	u32 FG_THRESHOLD = 0;
	u32 FGDM_THRESHOLD = 0;

	///////////////////// System Reset Assertion /////////////////////////////////////
//	Unlocks configuration registers
	system_reset_assert();
	//////////////////////////////////////////////////////////////////////////////////


	//FMC Module (hosting HDMI RX/TX ICs) Initialization
	print("FMC Modules Initialization\n\r");
	demo.uBaseAddr_IIC_FmcImageon = XPAR_FMC_IMAGEON_IIC_0_BASEADDR;

	fmc_imageon_hdmi_passthrough_init( &demo );


	//VDMA Configuration
	vdma_cfg();

	//MoG Parameters Initialization
	woi_config (0, SUB_WIDTH-1, 0, SUB_HEIGHT-1, XPAR_MOG_WOI_DET_S_AXI_BASEADDR);
	woi_config (0, SUB_WIDTH-1, 0, SUB_HEIGHT-1, XPAR_VIDEO_OVERLAY_UNIT_VOVRLAY_WOI_DET_S_AXI_BASEADDR);
	///////////////////// System Reset deassertion /////////////////////////////////////
//	Assert reset at least for 0.5 s, which means 5000000 cycles with frequency of 10 MHZ !!
	usleep(1000000);
//	Adarsh changes below -- HE MADE IT WORK!!!!
//	Used sdk functions for reset instead of low-level functions in app_cpu0.c
	system_reset_deassert();
	//////////////////////////////////////////////////////////////////////////////////

//	VDMA Status Monitoring
#ifdef DEBUG
	vdma_stat();// Debug information so commented
#endif

	while (1)
	{
		printf("\n\n*****************Please Enter Your Desired Parameters*****************\n\n");

//		*********************************************************************************************************************************
//		Optimal parameters for A3 traffic video => MD_THRESHOLD = 3; LEARNING_FACTOR = 6, FG_THRESHOLD = 9, FGDM_THRESHOLD = 4;
//		https://www.youtube.com/watch?v=UM0hX7nomi8
//		Optimal parameters for original traffic video => MD_THRESHOLD = 3; LEARNING_FACTOR = 2, FG_THRESHOLD = 12,FGDM_THRESHOLD = 3;
//		test_video.mp4
//		Optimal parameters for pedestrian traffic video => MD_THRESHOLD = 3; LEARNING_FACTOR = 2, FG_THRESHOLD = 12,FGDM_THRESHOLD = 3;
//		https://www.youtube.com/watch?v=aUdKzb4LGJI
//		*********************************************************************************************************************************

		printf("Do you want to apply default values? 0: No, 1: Yes\n\n");
		default_param = input_param();
		if (default_param == 1)
		{
			mog_params_config(3, 2, 12, 3, MIXTUREOFGAUSSIANS_S00_AXI_SLV_BASE_ADDRESS);
			printf("Default param values have been applied. \n\n");
			printf("MD_THRESHOLD = 3. \n\n");
			printf("LEARNING_FACTOR = 2. \n\n");
			printf("FG_THRESHOLD = 12. \n\n");
			printf("FGDM_THRESHOLD = 3. \n\n");
			break;
		}

		printf("*****************Match Detection Threshold Configuration*****************\n\n");
		printf("***************************************************\n\n");
		printf(" 1: 0 \n 2: 1 \n 3: 2 \n 4: 3 \n 5: 4 \n 6: 5 \n");
		printf(" 7: 6 \n 8: 7 \n 9: 8 \n 10: 9 \n 11: 10 \n 12: 11\n");
		printf(" 13: 12 \n 14: 13 \n 15: 14 \n 16: 15 \n");
		printf("***************************************************\n\n");
//		Match detection threshold determines level of difference between foreground and background
//		necessary to differentiate between the two.
//		Higher is a greater threshold distance, lower is a lower threshold difference
		MD_THRESHOLD = input_param();
		printf("*****************Learning Factor Configuration*****************\n\n");
		printf("***************************************************\n");
		printf(" 1: 50%% \n 2: 75%% \n 3: 87.5%% \n 4: 93.7%% \n 5: 96.8%% \n 6: 99.21%% \n");
		printf("***************************************************\n");
//		Learning factor determines rate that pixel is changed from background/foreground
//		Higher is faster, lower is slower
		LEARNING_FACTOR = input_param();
		printf("*****************Foreground Threshold Configuration*****************\n\n");
		printf("***************************************************\n\n");
		printf(" 1: 0.06 \n 2: 0.12 \n 3: 0.18 \n 4: 0.24 \n 5: 0.31 \n 6: 0.37 \n");
		printf(" 7: 0.43 \n 8: 0.50 \n 9: 0.56 \n 10: 0.62 \n 11: 0.68 \n 12: 0.75 \n");
		printf(" 13: 0.81 \n 14: 0.87 \n 15: 0.94 \n 16: 1.00 \n");
		printf("***************************************************\n\n");
//		Foreground threshold determines what pixels are counted as foreground (motion)
//		Higher means more foreground, lower means less foreground
		FG_THRESHOLD = input_param();
		printf("*****************ForeGround Match Detection Threshold Configuration*****************\n\n");
		printf("***************************************************\n\n");
		printf(" 1: 0 \n 2: 1 \n 3: 2 \n 4: 3 \n 5: 4 \n 6: 5 \n");
		printf(" 7: 6 \n 8: 7 \n 9: 8 \n 10: 9 \n 11: 10 \n 12: 11\n");
		printf(" 13: 12 \n 14: 13 \n 15: 14 \n 16: 15 \n");
		printf("***************************************************\n\n");
//		Foreground match detection threshold determines the "likeness" required for pixels to be detected as foreground
//		Higher means more "likeness" required, so fewer matches, lower means less "likeness" required, so more matches
		FGDM_THRESHOLD = input_param();

//		MoG Parameters Configuration
		mog_params_config(MD_THRESHOLD, LEARNING_FACTOR, FG_THRESHOLD, FGDM_THRESHOLD, MIXTUREOFGAUSSIANS_S00_AXI_SLV_BASE_ADDRESS);

//		VDMA Status Monitoring
//		vdma_stat();
		printf("***************** Do you want to reconfigure the parameters? 0: No, 1: Yes *****************\n\n");
		reconfig = input_param();

		if(reconfig == 0)
			break;

	}

	/************Starting Object Detection Process **************/

	object_detection_intr(); // blob detection with interrupt

}
