/*
 * vdma_cfg.c

 *
 *  Created on: Jul 13, 2014
 *      Author: htabkhi
 */

// To solve the frame store error (read channel error), comment the 4th block in the XAxiVdma_SetFrmStore function,
//currently starting from Line 19

#include "vdma_cfg.h"
#include "common_value_defination.h"

//static int ReadDone = 0;
//static int ReadError = 0;
//static int WriteDone = 0;
//static int WriteError = 0;
int ReadDone = 0;
int ReadError = 0;
int WriteDone = 0;
int WriteError = 0;

static int ReadSetup(XAxiVdma *InstancePtr, u32 SubframeHorizSize, u32 SubframeVertSize, u32 FrameHorizSize, u32 VdmaId);
static int WriteSetup(XAxiVdma * InstancePtr, u32 SubframeHorizSize, u32 SubframeVertSize, u32 FrameHorizSize, u32 VdmaId);
//static int StartTransfer(XAxiVdma *InstancePtr, u32 direction);
int StartTransfer(XAxiVdma *InstancePtr, u32 direction);

unsigned char MoG_READ_WRITE_REGION[184549376];
//unsigned char VOVRLAY_READ_REGION[327680];
//unsigned char VOVRLAY_WRITE_REGION[327680];
//unsigned char VOVRLAY_READ_REGION[655360];
//unsigned char VOVRLAY_WRITE_REGION[655360];
unsigned char YCBCR2MEM_READ_REGION[4194304];
//unsigned char YCBCR2MEM_WRITE_REGION[4194304];


//static struct vdma_chan_parms vdma_struct[NUMBER_OF_VDMAS];
struct vdma_chan_parms vdma_struct[NUMBER_OF_VDMAS];

int vdma_cfg (void)
{
	int Status;

#ifdef MoG_VDMA_INIT
	vdma_struct[MoG_VDMA_ID].AXIVDMA_DEVICE_ID = MoG_VDMA_ID;
	vdma_struct[MoG_VDMA_ID].Num_Read_Frames = NUMBER_OF_READ_FRAMES_MoG;
	vdma_struct[MoG_VDMA_ID].Num_Write_Frames = NUMBER_OF_WRITE_FRAMES_MoG;
	vdma_struct[MoG_VDMA_ID].FrameCfg.ReadFrameCount = NUMBER_OF_READ_FRAMES_MoG;
	vdma_struct[MoG_VDMA_ID].FrameCfg.WriteFrameCount = NUMBER_OF_WRITE_FRAMES_MoG;
	vdma_struct[MoG_VDMA_ID].FrameCfg.ReadDelayTimerCount = DELAY_TIMER_COUNTER;
	vdma_struct[MoG_VDMA_ID].FrameCfg.WriteDelayTimerCount = DELAY_TIMER_COUNTER;
//	vdma_struct[MoG_VDMA_ID].RD_ADDR_BASE = READ_ADDRESS_BASE_MoG_VDMA;
//	vdma_struct[MoG_VDMA_ID].WR_ADDR_BASE = WRITE_ADDRESS_BASE_MoG_VDMA;
	vdma_struct[MoG_VDMA_ID].RD_ADDR_BASE = &MoG_READ_WRITE_REGION;
	vdma_struct[MoG_VDMA_ID].WR_ADDR_BASE = &MoG_READ_WRITE_REGION;
	vdma_struct[MoG_VDMA_ID].BlockStartOffset = SUBFRAME_START_OFFSET_MoG;
	vdma_struct[MoG_VDMA_ID].FrameHoriz = FRAME_HORIZONTAL_LEN_MoG;
	vdma_struct[MoG_VDMA_ID].FrameVert = FRAME_VERTICAL_LEN_MoG;
	vdma_struct[MoG_VDMA_ID].BlockHoriz = SUBFRAME_HORIZONTAL_SIZE_MoG;
	vdma_struct[MoG_VDMA_ID].BlockVert = SUBFRAME_VERTICAL_SIZE_MoG;
	vdma_struct[MoG_VDMA_ID].FrameWidth = FRAME_HORIZONTAL_LEN_MoG;
	vdma_struct[MoG_VDMA_ID].FrameHeight = FRAME_VERTICAL_LEN_MoG;
#endif

#ifdef VOUT_OVERLAY_VDMA_INIT
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].AXIVDMA_DEVICE_ID = VIDEO_OVERLAY_VDMA_ID;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].Num_Read_Frames = NUMBER_OF_READ_FRAMES_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].Num_Write_Frames = NUMBER_OF_WRITE_FRAMES_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameCfg.ReadFrameCount = NUMBER_OF_READ_FRAMES_VIDEO_OVERLAY_INTR;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameCfg.WriteFrameCount = NUMBER_OF_WRITE_FRAMES_VIDEO_OVERLAY_INTR;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameCfg.ReadDelayTimerCount = DELAY_TIMER_COUNTER;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameCfg.WriteDelayTimerCount = DELAY_TIMER_COUNTER;
//	vdma_struct[VIDEO_OVERLAY_VDMA_ID].RD_ADDR_BASE = READ_ADDRESS_BASE_VIDEO_OVERLAY_VDMA;  //fixed address, Go into it to see which CPU use it
//	vdma_struct[VIDEO_OVERLAY_VDMA_ID].WR_ADDR_BASE = WRITE_ADDRESS_BASE_VIDEO_OVERLAY_VDMA;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].RD_ADDR_BASE = &VOVRLAY_READ_REGION;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].WR_ADDR_BASE = &VOVRLAY_WRITE_REGION;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].BlockStartOffset = SUBFRAME_START_OFFSET_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameHoriz = FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameVert = FRAME_VERTICAL_LEN_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].BlockHoriz = SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].BlockVert = SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameWidth = FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY;
	vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameHeight = FRAME_VERTICAL_LEN_VIDEO_OVERLAY;
#endif

#ifdef YCBCR2MEM_VDMA_INIT
	vdma_struct[YCBCR2MEM_VDMA_ID].AXIVDMA_DEVICE_ID = YCBCR2MEM_VDMA_ID;
	vdma_struct[YCBCR2MEM_VDMA_ID].Num_Read_Frames = NUMBER_OF_READ_FRAMES_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].Num_Write_Frames = NUMBER_OF_WRITE_FRAMES_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameCfg.ReadFrameCount = NUMBER_OF_READ_FRAMES_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameCfg.WriteFrameCount = NUMBER_OF_WRITE_FRAMES_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameCfg.ReadDelayTimerCount = DELAY_TIMER_COUNTER;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameCfg.WriteDelayTimerCount = DELAY_TIMER_COUNTER;
	vdma_struct[YCBCR2MEM_VDMA_ID].RD_ADDR_BASE = &YCBCR2MEM_READ_REGION;
	vdma_struct[YCBCR2MEM_VDMA_ID].WR_ADDR_BASE = &YCBCR2MEM_WRITE_REGION;
	vdma_struct[YCBCR2MEM_VDMA_ID].BlockStartOffset = SUBFRAME_START_OFFSET_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameHoriz = FRAME_HORIZONTAL_LEN_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameVert = FRAME_VERTICAL_LEN_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].BlockHoriz = SUBFRAME_HORIZONTAL_SIZE_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].BlockVert = SUBFRAME_VERTICAL_SIZE_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameWidth = FRAME_HORIZONTAL_LEN_YCBCR2MEM;
	vdma_struct[YCBCR2MEM_VDMA_ID].FrameHeight = FRAME_VERTICAL_LEN_YCBCR2MEM;
#endif

/* The information of the XAxiVdma_Config comes from hardware build.
	 * The user IP should pass this information to the AXI DMA core.
	 */


	//*******************************************************************************//
	//************************************ MoG **************************************//
	//*******************************************************************************//

#ifdef MoG_VDMA_INIT

	/* VDMA 0 */
	printf("\n *********MoG VDMA Initialization*********** \n");

	vdma_struct[MoG_VDMA_ID].Config = XAxiVdma_LookupConfig(vdma_struct[MoG_VDMA_ID].AXIVDMA_DEVICE_ID);
	if (!vdma_struct[MoG_VDMA_ID].Config) {
		xil_printf(
		    "No video DMA found for ID %d\r\n", vdma_struct[MoG_VDMA_ID].AXIVDMA_DEVICE_ID);

		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiVdma_CfgInitialize(&vdma_struct[MoG_VDMA_ID].AxiVdma, vdma_struct[MoG_VDMA_ID].Config, vdma_struct[MoG_VDMA_ID].Config->BaseAddress);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Configuration Initialization failed %d\r\n", Status);

		return XST_FAILURE;
	}

	Status = XAxiVdma_SetFrmStore(&vdma_struct[MoG_VDMA_ID].AxiVdma, vdma_struct[MoG_VDMA_ID].Num_Read_Frames, XAXIVDMA_READ);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Read Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	Status = XAxiVdma_SetFrmStore(&vdma_struct[MoG_VDMA_ID].AxiVdma, vdma_struct[MoG_VDMA_ID].Num_Write_Frames, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Write Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	/*
	 * Setup your video IP that writes to the memory
	 */

	/* VDMA 0 */

	/* Setup the write channel
	 */
	Status = WriteSetup(&vdma_struct[MoG_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_MoG, SUBFRAME_VERTICAL_SIZE_MoG, FRAME_HORIZONTAL_LEN_MoG, MoG_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Write channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}


	/*
	 * Setup your video IP that reads from the memory
	 */

	/* Setup the read channel
	 */
	Status = ReadSetup(&vdma_struct[MoG_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_MoG, SUBFRAME_VERTICAL_SIZE_MoG, FRAME_HORIZONTAL_LEN_MoG, MoG_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Read channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}

//	u32 j;
//	//initializing of the parameters in the Memory
//	vdma_struct[MoG_VDMA_ID].buf_pointer = vdma_struct[MoG_VDMA_ID].RD_ADDR_BASE;
//	for (j = 0; j < vdma_struct[MoG_VDMA_ID].FrameWidth * vdma_struct[MoG_VDMA_ID].FrameHeight * vdma_struct[MoG_VDMA_ID].Num_Read_Frames; j+= 4){
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x99;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x55;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x22;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x06;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x06;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x06;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x33;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x00;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//		*vdma_struct[MoG_VDMA_ID].buf_pointer = 0x33;
//		vdma_struct[MoG_VDMA_ID].buf_pointer ++;
//					}

	/* Enable DMA read and write channel interrupts
	 *
	 * If interrupts overwhelms the system, please do not enable interrupt
	 */
	XAxiVdma_IntrDisable(&vdma_struct[MoG_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_WRITE);
	XAxiVdma_IntrDisable(&vdma_struct[MoG_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_READ);

	//Start DMA TRANSFER
	Status = StartTransfer(&vdma_struct[MoG_VDMA_ID].AxiVdma, READ_WRITE);
	if (Status != XST_SUCCESS) {
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");
		return XST_FAILURE;
	}

//	Status = StartTransfer(&vdma_struct[MoG_VDMA_ID].AxiVdma, ONLY_WRITE);
//	if (Status != XST_SUCCESS) {
//		if(Status == XST_VDMA_MISMATCH_ERROR)
//			xil_printf("DMA Mismatch Error\r\n");
//		return XST_FAILURE;
//	}



	/* Every set of frame buffer finish causes a completion interrupt
	 */

	if (ReadError || WriteError) {
		xil_printf("Test has transfer error %d/%d\r\n",
		    ReadError, WriteError);

		Status = XST_FAILURE;
	}
	else {
		xil_printf("Test passed\r\n");
	}

	//Mismatch Error Check
	if (Status != XST_SUCCESS) {
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");
		return XST_FAILURE;
	}
	//reset status global variables
	ReadDone = 0;
	ReadError = 0;
	WriteDone = 0;
	WriteError = 0;

#endif

	//*******************************************************************************//
	//***************************** VIDEO OVERLAY ***********************************//
	//*******************************************************************************//

#ifdef VOUT_OVERLAY_VDMA_INIT

	/* VDMA 1 */
	printf("\n **********Video Overlay VDMA Initialization*********** \n");

	vdma_struct[VIDEO_OVERLAY_VDMA_ID].Config = XAxiVdma_LookupConfig(vdma_struct[VIDEO_OVERLAY_VDMA_ID].AXIVDMA_DEVICE_ID);
	if (!vdma_struct[VIDEO_OVERLAY_VDMA_ID].Config) {
		xil_printf(
		    "No video DMA found for ID %d\r\n", vdma_struct[VIDEO_OVERLAY_VDMA_ID].AXIVDMA_DEVICE_ID);

		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiVdma_CfgInitialize(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, vdma_struct[VIDEO_OVERLAY_VDMA_ID].Config, vdma_struct[VIDEO_OVERLAY_VDMA_ID].Config->BaseAddress);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Configuration Initialization failed %d\r\n", Status);

		return XST_FAILURE;
	}
//	xil_printf("vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma->maxNum is %d\n", vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma.MaxNumFrames);
	Status = XAxiVdma_SetFrmStore(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, vdma_struct[VIDEO_OVERLAY_VDMA_ID].Num_Read_Frames, XAXIVDMA_READ);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Read Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	Status = XAxiVdma_SetFrmStore(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, vdma_struct[VIDEO_OVERLAY_VDMA_ID].Num_Write_Frames, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Write Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	/* VDMA 1 */

	/* Setup the write channelSearch commands
	 */

	Status = WriteSetup(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY, SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY, FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY, VIDEO_OVERLAY_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Write channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}

	/*
	 * Setup your video IP that reads from the memory
	 */

	/* Setup the read channel
	 */

	Status = ReadSetup(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_VIDEO_OVERLAY, SUBFRAME_VERTICAL_SIZE_VIDEO_OVERLAY, FRAME_HORIZONTAL_LEN_VIDEO_OVERLAY, VIDEO_OVERLAY_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Read channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}

	memset((void *)vdma_struct[VIDEO_OVERLAY_VDMA_ID].RD_ADDR_BASE, 0x00,
			 (vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameWidth * vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameHeight)
			* vdma_struct[VIDEO_OVERLAY_VDMA_ID].Num_Read_Frames);

	//xil_printf("\nMM2S Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x5c )));

	//Start DMA TRANSFER
//	Status = StartTransfer(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, ONLY_READ);
//	if (Status != XST_SUCCESS) {
//		if(Status == XST_VDMA_MISMATCH_ERROR)
//			xil_printf("DMA Mismatch Error\r\n");
//		return XST_FAILURE;
//	}



	/* Disable VDMA read and write channel interrupts
	/* VDMA 1 */
	XAxiVdma_IntrDisable(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_WRITE);
	XAxiVdma_IntrDisable(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_READ);

//	object_detection_intr(); // blob detection with interrupt

	//Start DMA TRANSFER
	Status = StartTransfer(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, READ_WRITE);
	if (Status != XST_SUCCESS) {
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");
		return XST_FAILURE;
	}

//	Status = StartTransfer(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, ONLY_WRITE);
//	if (Status != XST_SUCCESS) {
//		if(Status == XST_VDMA_MISMATCH_ERROR)
//			xil_printf("DMA Mismatch Error\r\n");
//		return XST_FAILURE;
//	}



	//printf("\n start address: %x \n", vdma_struct[VIDEO_OVERLAY_VDMA_ID].ReadCfg.FrameStoreStartAddr[0]);

	//xil_printf("\nMM2S Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x5c )));

	if (ReadError || WriteError) {
		xil_printf("Test has transfer error %d/%d\r\n",
		    ReadError, WriteError);

		Status = XST_FAILURE;
	}
	else {
		xil_printf("Test passed\r\n");
	}

	//Mismatch Error Check
	if (Status != XST_SUCCESS) {
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");
		return XST_FAILURE;
	}

	ReadDone = 0;
	ReadError = 0;
	WriteDone = 0;
	WriteError = 0;

#endif

	//*******************************************************************************//
	//*************************** YCBCR to Memory ***********************************//
	//*******************************************************************************//

#ifdef YCBCR2MEM_VDMA_INIT

	/* VDMA 2 */
	printf("\n **********YCBCR to MEM VDMA Initialization*********** \n");

	vdma_struct[YCBCR2MEM_VDMA_ID].Config = XAxiVdma_LookupConfig(vdma_struct[YCBCR2MEM_VDMA_ID].AXIVDMA_DEVICE_ID);
	if (!vdma_struct[YCBCR2MEM_VDMA_ID].Config) {
		xil_printf(
		    "No video DMA found for ID %d\r\n", vdma_struct[YCBCR2MEM_VDMA_ID].AXIVDMA_DEVICE_ID);

		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiVdma_CfgInitialize(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, vdma_struct[YCBCR2MEM_VDMA_ID].Config, vdma_struct[YCBCR2MEM_VDMA_ID].Config->BaseAddress);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Configuration Initialization failed %d\r\n", Status);

		return XST_FAILURE;
	}

	Status = XAxiVdma_SetFrmStore(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, vdma_struct[YCBCR2MEM_VDMA_ID].Num_Read_Frames, XAXIVDMA_READ);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Read Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	Status = XAxiVdma_SetFrmStore(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, vdma_struct[YCBCR2MEM_VDMA_ID].Num_Write_Frames, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {

		xil_printf(
		    "Setting Frame Store Number Failed in Write Channel"
		    					" %d\r\n", Status);

		return XST_FAILURE;
	}

	/* VDMA 2 */

	/* Setup the write channelSearch commands
	 */

	Status = WriteSetup(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_YCBCR2MEM, SUBFRAME_VERTICAL_SIZE_YCBCR2MEM, FRAME_HORIZONTAL_LEN_YCBCR2MEM, YCBCR2MEM_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Write channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}

	/*
	 * Setup your video IP that reads from the memory
	 */

	/* Setup the read channel
	 */

	Status = ReadSetup(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, SUBFRAME_HORIZONTAL_SIZE_YCBCR2MEM, SUBFRAME_VERTICAL_SIZE_YCBCR2MEM, FRAME_HORIZONTAL_LEN_YCBCR2MEM, YCBCR2MEM_VDMA_ID);
	if (Status != XST_SUCCESS) {
		xil_printf(
		    	"Read channel setup failed %d\r\n", Status);
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}


	/* Disable VDMA read and write channel interrupts
	/* VDMA 2 */
	XAxiVdma_IntrDisable(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_WRITE);
	XAxiVdma_IntrDisable(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_READ);

//	Status = StartTransfer(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, ONLY_WRITE);
//	if (Status != XST_SUCCESS) {
//		if(Status == XST_VDMA_MISMATCH_ERROR)
//			xil_printf("DMA Mismatch Error\r\n");
//		return XST_FAILURE;
//	}

		Status = StartTransfer(&vdma_struct[YCBCR2MEM_VDMA_ID].AxiVdma, READ_WRITE);
		if (Status != XST_SUCCESS) {
			if(Status == XST_VDMA_MISMATCH_ERROR)
				xil_printf("DMA Mismatch Error\r\n");
			return XST_FAILURE;
		}

	if (ReadError || WriteError) {
		xil_printf("Test has transfer error %d/%d\r\n",
		    ReadError, WriteError);

		Status = XST_FAILURE;
	}
	else {
		xil_printf("Test passed\r\n");
	}

	//Mismatch Error Check
	if (Status != XST_SUCCESS) {
		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");
		return XST_FAILURE;
	}

	ReadDone = 0;
	ReadError = 0;
	WriteDone = 0;
	WriteError = 0;
#endif

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function sets up the read channel
*
* @param	InstancePtr is the instance pointer to the DMA engine.
*
* @return	XST_SUCCESS if the setup is successful, XST_FAILURE otherwise.
*
* @note		None.
*
******************************************************************************/
static int ReadSetup(XAxiVdma *InstancePtr, u32 SubframeHorizSize, u32 SubframeVertSize, u32 FrameHorizSize, u32 VdmaId)//VdmaId is 0,1,2, ... for the first, second and ... VDMA
{
	int Index;
	u32 Addr;
	int Status;

	vdma_struct[VdmaId].ReadCfg.VertSizeInput = SubframeVertSize;
	vdma_struct[VdmaId].ReadCfg.HoriSizeInput = SubframeHorizSize;
	vdma_struct[VdmaId].ReadCfg.Stride = FrameHorizSize;

	vdma_struct[VdmaId].ReadCfg.FrameDelay = 0;  /* This example does not test frame delay */

	vdma_struct[VdmaId].ReadCfg.EnableCircularBuf = 1;
	vdma_struct[VdmaId].ReadCfg.EnableSync = 0;  /* No Gen-Lock */

	vdma_struct[VdmaId].ReadCfg.PointNum = 0;    /* No Gen-Lock */
	vdma_struct[VdmaId].ReadCfg.EnableFrameCounter = 0; /* Endless transfers */

	vdma_struct[VdmaId].ReadCfg.FixedFrameStoreAddr = 0; /* We are not doing parking */

	Status = XAxiVdma_DmaConfig(InstancePtr, XAXIVDMA_READ, &vdma_struct[VdmaId].ReadCfg);

	if (Status != XST_SUCCESS) {
		xil_printf(
		    "Read channel config failed %d\r\n", Status);

		return XST_FAILURE;
	}

	/* Initialize buffer addresses
	 *
	 * These addresses are physical addresses
	 */


	Addr = vdma_struct[VdmaId].RD_ADDR_BASE + vdma_struct[VdmaId].BlockStartOffset;

	//printf("\n start address: %x \n", Addr);

			for(Index = 0; Index < vdma_struct[VdmaId].Num_Read_Frames; Index++) {
				xil_printf("***********\n\rvdma_struct[%d] read addr is 0x%08X\n\r\n", VdmaId, Addr);
				vdma_struct[VdmaId].ReadCfg.FrameStoreStartAddr[Index] = Addr;
				Addr += vdma_struct[VdmaId].FrameHoriz * vdma_struct[VdmaId].FrameVert;
			}

	//printf("\n start address: %x \n", vdma_struct[VdmaId].ReadCfg.FrameStoreStartAddr[0]);
	Status = XAxiVdma_DmaSetBufferAddr(InstancePtr, XAXIVDMA_READ, vdma_struct[VdmaId].ReadCfg.FrameStoreStartAddr);


	if (Status != XST_SUCCESS) {
		xil_printf(
		    "Read channel set buffer address failed %d\r\n", Status);

		return XST_FAILURE;
	}

//Reset the Video Overlay read address space

//			memset((void *)vdma_struct[VdmaId].RD_ADDR_BASE, 0x00,
//					 (vdma_struct[VdmaId].FrameWidth * vdma_struct[VdmaId].FrameHeight)
//					* vdma_struct[VdmaId].Num_Read_Frames);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function sets up the write channel
*
* @param	InstancePtr is the instance pointer to the DMA engine.
*
* @return	XST_SUCCESS if the setup is successful, XST_FAILURE otherwise.
*
* @note		None.
*
******************************************************************************/
static int WriteSetup(XAxiVdma *InstancePtr, u32 SubframeHorizSize, u32 SubframeVertSize, u32 FrameHorizSize, u32 VdmaId)//VdmaId is 0,1,2, ... for the first, second and ... VDMA
{
	int Index;
	u32 Addr;
	int Status;

	vdma_struct[VdmaId].WriteCfg.VertSizeInput = SubframeVertSize;
	vdma_struct[VdmaId].WriteCfg.HoriSizeInput = SubframeHorizSize;
	vdma_struct[VdmaId].WriteCfg.Stride = FrameHorizSize;

	vdma_struct[VdmaId].WriteCfg.FrameDelay = 0;  /* This example does not test frame delay */

	vdma_struct[VdmaId].WriteCfg.EnableCircularBuf = 1;
	vdma_struct[VdmaId].WriteCfg.EnableSync = 0;  /* No Gen-Lock */

	vdma_struct[VdmaId].WriteCfg.PointNum = 0;    /* No Gen-Lock */
	vdma_struct[VdmaId].WriteCfg.EnableFrameCounter = 0; /* Endless transfers */

	vdma_struct[VdmaId].WriteCfg.FixedFrameStoreAddr = 0; /* We are not doing parking */

	Status = XAxiVdma_DmaConfig(InstancePtr, XAXIVDMA_WRITE, &vdma_struct[VdmaId].WriteCfg);

	if (Status != XST_SUCCESS) {
		xil_printf(
		    "Write channel config failed %d\r\n", Status);

		return XST_FAILURE;
	}

	/* Initialize buffer addresses
	 *
	 * Use physical addresses
	 */


	Addr = vdma_struct[VdmaId].WR_ADDR_BASE + vdma_struct[VdmaId].BlockStartOffset;

			for(Index = 0; Index < vdma_struct[VdmaId].Num_Write_Frames; Index++) {
				vdma_struct[VdmaId].WriteCfg.FrameStoreStartAddr[Index] = Addr;
				Addr += vdma_struct[VdmaId].FrameHoriz * vdma_struct[VdmaId].FrameVert;
//				xil_printf("***********vdma_struct[%d] write addr is %d\n", VdmaId, Addr);
			}

	/* Set the buffer addresses for transfer in the DMA engine
	 */
	Status = XAxiVdma_DmaSetBufferAddr(InstancePtr, XAXIVDMA_WRITE, vdma_struct[VdmaId].WriteCfg.FrameStoreStartAddr);


	if (Status != XST_SUCCESS) {
		xil_printf(
		    "Write channel set buffer address failed %d\r\n", Status);

		return XST_FAILURE;
	}

	/* Clear data buffer
	 */

		memset((void *)vdma_struct[VdmaId].WR_ADDR_BASE, 0x00,
				vdma_struct[VdmaId].FrameWidth * vdma_struct[VdmaId].FrameHeight
				* vdma_struct[VdmaId].Num_Write_Frames);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function starts the DMA transfers. Since the DMA engine is operating
* in circular buffer mode, video frames will be transferred continuously.
*
* @param	InstancePtr points to the DMA engine instance
*
* @return	XST_SUCCESS if both read and write start succesfully
*		XST_FAILURE if one or both directions cannot be started
*
* @note		None.
*
******************************************************************************/
//static int StartTransfer(XAxiVdma *InstancePtr, u32 direction)
int StartTransfer(XAxiVdma *InstancePtr, u32 direction)
{
	int Status;

	if(direction == READ_WRITE)
		{
		xil_printf("READ_WRITE\r\n");
			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_WRITE);
			if (Status != XST_SUCCESS) {
				xil_printf(
					"Start Write transfer failed %d\r\n", Status);

				return XST_FAILURE;
			}

			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_READ);
			if (Status != XST_SUCCESS) {
				xil_printf(
					"Start read transfer failed %d\r\n", Status);

				return XST_FAILURE;
			}
		}
	else if(direction == ONLY_READ)
		{
		xil_printf("ONLY_READ\r\n");
			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_READ);
			if (Status != XST_SUCCESS) {
				xil_printf(
					"Start read transfer failed %d\r\n", Status);

				return XST_FAILURE;
			}
		}
	else if(direction == ONLY_WRITE)
		{
		xil_printf("ONLY_WRITE\r\n");
			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_WRITE);
			if (Status != XST_SUCCESS) {
				xil_printf(
					"Start Write transfer failed %d\r\n", Status);

				return XST_FAILURE;
			}
		}

	return XST_SUCCESS;
}
