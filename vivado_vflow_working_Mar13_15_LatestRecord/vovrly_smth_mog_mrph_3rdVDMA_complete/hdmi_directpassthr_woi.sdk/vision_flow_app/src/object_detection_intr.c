/*
 * object_detection_intr.c
 *
 *  Created on: Feb 12, 2015
 *      Author: xufaneric
 */


#include "object_detection_intr.h"
#include "xtime_l.h"

extern struct vdma_chan_parms vdma_struct[NUMBER_OF_VDMAS];
extern int ReadDone;
extern int ReadError;
extern int WriteDone;
extern int WriteError;

/************************* extern variables ************************************/
// extern unsigned char MoG_READ_WRITE_REGION[184549376];
// extern unsigned char VOVRLAY_READ_REGION[327680];
// extern unsigned char VOVRLAY_WRITE_REGION[327680];
// //extern unsigned char YCBCR2MEM_READ_REGION[4194304];
// extern unsigned char YCBCR2MEM_READ_REGION[4194304];
// extern unsigned char YCBCR2MEM_WRITE_REGION[4194304];

 /*******************interrupt component begin*********************/
 #define INTC_DEVICE_ID 		XPAR_PS7_SCUGIC_0_DEVICE_ID
 #define WRITE_INTR_VIDEO_OVERLAY		XPAR_FABRIC_VIDEO_OVERLAY_UNIT_VOVRLY_VDMA_S2MM_INTROUT_INTR
 #define READ_INTR_VIDEO_OVERLAY		XPAR_FABRIC_VIDEO_OVERLAY_UNIT_VOVRLY_VDMA_MM2S_INTROUT_INTR

 static XScuGic Intc;	/* Instance of the Interrupt Controller */

 static int InterruptFlag = 0;
 static int interrupt_num = 0;
 static int interrupt_for_blob_control = 0;
 static int double_buf_flag = 0;

 //int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId,
 //u16 WriteIntrId)
 static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId,
 				u16 WriteIntrId);
 static void DisableIntrSystem(u16 ReadIntrId, u16 WriteIntrId);
 static void user_IntrHandler(XScuGic *InstancePtr);
 static void user_callback();
 static void ReadIntrHandler(void * InstancePtr);
 static void WriteIntrHandler(void * InstancePtr);

 /* Interrupt call back functions
  */
 static void ReadCallBack(void *CallbackRef, u32 Mask);
 static void ReadErrorCallBack(void *CallbackRef, u32 Mask);
 static void WriteCallBack(void *CallbackRef, u32 Mask);
 static void WriteErrorCallBack(void *CallbackRef, u32 Mask);
 /*******************interrupt component end*********************/

int object_detection_intr()
{
	COMM_VAL = 0;

	int Status;
	Status = XAxiVdma_SetFrameCounter(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, &vdma_struct[VIDEO_OVERLAY_VDMA_ID].FrameCfg);


	if (Status != XST_SUCCESS) {
		xil_printf("Set frame counter failed %d\r\n", Status);

		if(Status == XST_VDMA_MISMATCH_ERROR)
			xil_printf("DMA Mismatch Error\r\n");

		return XST_FAILURE;
	}



	Status = SetupIntrSystem(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, READ_INTR_VIDEO_OVERLAY, WRITE_INTR_VIDEO_OVERLAY);
	if (Status != XST_SUCCESS) {

		xil_printf(
				"Setup interrupt system failed %d\r\n", Status);

		return XST_FAILURE;
	}


	XAxiVdma_IntrEnable(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_WRITE);

//	XAxiVdma_IntrEnable(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, XAXIVDMA_IXR_FRMCNT_MASK, XAXIVDMA_WRITE);

//	XAxiVdma_IntrEnable(&vdma_struct[VIDEO_OVERLAY_VDMA_ID].AxiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_READ);


//	while(1)
//	{
//	}


	return XST_SUCCESS;
}


/*****************************************************************************/
/*
*
* This function setups the interrupt system so interrupts can occur for the
* DMA.  This function assumes INTC component exists in the hardware system.
*
* @param	AxiDmaPtr is a pointer to the instance of the DMA engine
* @param	ReadIntrId is the read channel Interrupt ID.
* @param	WriteIntrId is the write channel Interrupt ID.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
//static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId,
//				u16 WriteIntrId)
static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId,
				u16 WriteIntrId)
{
	int Status;
	xil_printf("entering SetupIntrSystem function domain\r\n");

//#ifdef XPAR_INTC_0_DEVICE_ID
#ifdef XPAR_INTC_1_DEVICE_ID
	XIntc *IntcInstancePtr =&Intc;


	/* Initialize the interrupt controller and connect the ISRs */
	//Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID_0);
	Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID_1);
	if (Status != XST_SUCCESS) {

		xil_printf( "Failed init intc\r\n");
		return XST_FAILURE;
	}

	Status = XIntc_Connect(IntcInstancePtr, ReadIntrId,
			 (XInterruptHandler)XAxiVdma_ReadIntrHandler, AxiVdmaPtr);
	if (Status != XST_SUCCESS) {

		xil_printf(
			"Failed read channel connect intc %d\r\n", Status);
		return XST_FAILURE;
	}

	Status = XIntc_Connect(IntcInstancePtr, WriteIntrId,
			 (XInterruptHandler)XAxiVdma_WriteIntrHandler, AxiVdmaPtr);
	if (Status != XST_SUCCESS) {

		xil_printf(
			"Failed write channel connect intc %d\r\n", Status);
		return XST_FAILURE;
	}

	/* Start the interrupt controller */
	Status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {

		xil_printf( "Failed to start intc\r\n");
		return XST_FAILURE;
	}

	/* Enable interrupts from the hardware */
	XIntc_Enable(IntcInstancePtr, ReadIntrId);
	XIntc_Enable(IntcInstancePtr, WriteIntrId);

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XIntc_InterruptHandler,
			(void *)IntcInstancePtr);

	Xil_ExceptionEnable();


#else

	XScuGic *IntcInstancePtr = &Intc;	/* Instance of the Interrupt Controller */
	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	//IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID_0);
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, ReadIntrId, 0xA0, 0x3);
	XScuGic_SetPriorityTriggerType(IntcInstancePtr, WriteIntrId, 0xA0, 0x3);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
//	Status = XScuGic_Connect(IntcInstancePtr, ReadIntrId,
//				(Xil_InterruptHandler)ReadIntrHandler,
//				AxiVdmaPtr);
	Status = XScuGic_Connect(IntcInstancePtr, ReadIntrId,
				(Xil_InterruptHandler)XAxiVdma_ReadIntrHandler,
				AxiVdmaPtr);
//	Status = XScuGic_Connect(IntcInstancePtr, ReadIntrId,
//					(Xil_InterruptHandler)user_callback,
//					AxiVdmaPtr);
	if (Status != XST_SUCCESS)
	{
		return Status;
	}

//	Status = XScuGic_Connect(IntcInstancePtr, WriteIntrId,
//				(Xil_InterruptHandler)WriteIntrHandler,
//				AxiVdmaPtr);
	Status = XScuGic_Connect(IntcInstancePtr, WriteIntrId,
					(Xil_InterruptHandler)XAxiVdma_WriteIntrHandler,
					AxiVdmaPtr);
//	Status = XScuGic_Connect(IntcInstancePtr, WriteIntrId,
//					(Xil_InterruptHandler)user_callback,
//					AxiVdmaPtr);
	if (Status != XST_SUCCESS)
	{
		return Status;
	}

	/*
	 * Enable the interrupt for the DMA device.
	 */
	XScuGic_Enable(IntcInstancePtr, ReadIntrId);
	XScuGic_Enable(IntcInstancePtr, WriteIntrId);

	Xil_ExceptionInit();

	/*
	 * Important!
	 * This is where we set the interrupt handler!!!
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the processor!!!!
	 */

//	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
//				(Xil_ExceptionHandler)XScuGic_InterruptHandler,
//				IntcInstancePtr);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
					(Xil_ExceptionHandler)user_IntrHandler,
					IntcInstancePtr);


	/*
	 * Enable interrupts in the Processor.
	 */
	Xil_ExceptionEnable();
	//InterruptFlag = 1;


#endif

	xil_printf("exiting SetupIntrSystem function domain\r\n");

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function disables the interrupts
*
* @param	ReadIntrId is interrupt ID associated w/ DMA read channel
* @param	WriteIntrId is interrupt ID associated w/ DMA write channel
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void DisableIntrSystem(u16 ReadIntrId, u16 WriteIntrId)
{

//#ifdef XPAR_INTC_0_DEVICE_ID
#ifdef XPAR_INTC_1_DEVICE_ID
	XIntc *IntcInstancePtr =&Intc;

	/* Disconnect the interrupts for the DMA TX and RX channels */
	XIntc_Disconnect(IntcInstancePtr, ReadIntrId);
	XIntc_Disconnect(IntcInstancePtr, WriteIntrId);
#else
	XScuGic *IntcInstancePtr = &Intc;

	XScuGic_Disable(IntcInstancePtr, ReadIntrId);
	XScuGic_Disable(IntcInstancePtr, WriteIntrId);

	XScuGic_Disconnect(IntcInstancePtr, ReadIntrId);
	XScuGic_Disconnect(IntcInstancePtr, WriteIntrId);
#endif
}


/*****************************************************************************/
/*
 * Call back function for read channel
 *
 * This callback only clears the interrupts and updates the transfer status.
 *
 * @param	CallbackRef is the call back reference pointer
 * @param	Mask is the interrupt mask passed in from the driver
 *
 * @return	None
*
******************************************************************************/
static void ReadCallBack(void *CallbackRef, u32 Mask)
//static void ReadCallBack(XAxiVdma *InstancePtr, u32 Mask)
{
	//XAxiVdma_IntrClear(&dma_struct[1].AxiVdma, XAXIVDMA_IXR_FRMCNT_MASK, XAXIVDMA_READ);
	if (Mask & XAXIVDMA_IXR_FRMCNT_MASK) {
		ReadDone += 1;
		xil_printf("ReadDone = %d\r\n", ReadDone);
	}

}

/*****************************************************************************/
/*
 * Call back function for read channel error interrupt
 *
 * @param	CallbackRef is the call back reference pointer
 * @param	Mask is the interrupt mask passed in from the driver
 *
 * @return	None
*
******************************************************************************/
static void ReadErrorCallBack(void *CallbackRef, u32 Mask)
//static void ReadErrorCallBack(XAxiVdma *InstancePtr, u32 Mask)
{
	//XAxiVdma_IntrClear(&dma_struct[1].AxiVdma, XAXIVDMA_IXR_ERROR_MASK, XAXIVDMA_READ);
	if (Mask & XAXIVDMA_IXR_ERROR_MASK) {
		ReadError += 1;
	}

}

/*****************************************************************************/
/*
 * Call back function for write channel
 *
 * This callback only clears the interrupts and updates the transfer status.
 *
 * @param	CallbackRef is the call back reference pointer
 * @param	Mask is the interrupt mask passed in from the driver
 *
 * @return	None
*
******************************************************************************/
static void WriteCallBack(void *CallbackRef, u32 Mask)
//static void WriteCallBack(XAxiVdma *InstancePtr, u32 Mask)
{
	//XAxiVdma_IntrClear(&dma_struct[1].AxiVdma, XAXIVDMA_IXR_FRMCNT_MASK, XAXIVDMA_WRITE);
	if (Mask & XAXIVDMA_IXR_FRMCNT_MASK) {
		WriteDone += 1;
		xil_printf("WriteDone = %d\r\n", WriteDone);
	}

}

/*****************************************************************************/
/*
* Call back function for write channel error interrupt
*
* @param	CallbackRef is the call back reference pointer
* @param	Mask is the interrupt mask passed in from the driver
*
* @return	None
*
******************************************************************************/
static void WriteErrorCallBack(void *CallbackRef, u32 Mask)
//static void WriteErrorCallBack(XAxiVdma *InstancePtr, u32 Mask)
{
	//XAxiVdma_IntrClear(&dma_struct[1].AxiVdma, XAXIVDMA_IXR_ERROR_MASK, XAXIVDMA_WRITE);
	if (Mask & XAXIVDMA_IXR_ERROR_MASK) {
		WriteError += 1;
	}

}

/************************** user interrupt handler ****************************/
static void user_IntrHandler(XScuGic *InstancePtr)
{
//	clock_t start, finish;
//	double processing_t;
	XTime start, finish;
	double time;



//	xil_printf("Function user_IntrHandler called\r\n");
	u32 IntID;
	XScuGic_VectorTableEntry *TablePtr;

	/* Assert that the pointer to the instance is valid
	 */
	Xil_AssertVoid(InstancePtr != NULL);

//	interrupt_for_blob_control = interrupt_for_blob_control + 1;
	/*****here, we call blob detection and object focus every n frames, n is set in here!!*****/


//	xil_printf("****************\r\n");
//	start = clock();
//	XTime_GetTime(&start);

//	if(interrupt_for_blob_control == 30) {
		/* Call the cache flush function to get the cache updated, when the processor get the interrupt*/
//		if (!double_buf_flag)
			Xil_DCacheFlush();
//		printf("CPU0: object_detection start\n\r");

//		xil_printf("PARK_PTR_REG = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x28 )));
//		int buf_info = *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x28 ));
//		double_buf_flag = (buf_info >> 16) & 1;
		double_buf_flag = !double_buf_flag;
//		double_buf_flag = 0;
		COMM_VAL = double_buf_flag + 1;
//		COMM_VAL = 11;
		if (FrameNumberCounter < 0 || FrameNumberCounter > 3000)
		{
			FrameNumberCounter = 0;
			TotalTime = 0;
		}
		object_detection (&VOVRLAY_WRITE_REGION, double_buf_flag);
		//FrameNumber--;
		if(FrameNumberCounter == 3000) {
			double AverageTime = TotalTime / FrameNumberCounter;
			printf("AverageTime of detection is %f ms.\r\n", AverageTime);
			FrameNumberCounter = 0;
			TotalTime = 0;
		}
//		COMM_VAL = 1;
//		while(COMM_VAL == 1);
//		interrupt_for_blob_control = 0;
//	}

//	finish = clock();
//	XTime_GetTime(&finish);

//	Calculate the time consumption of single object detection.

//	processing_t=(double)(finish - start)/CLOCKS_PER_SEC;
//	time = (double)(finish - start) / 333000000 * 1000;
//	printf("object_detection takes %f ms.\r\n", time);

	/*
	 * Read the int_ack register to identify the highest priority interrupt ID
	 * and make sure it is valid. Reading Int_Ack will clear the interrupt
	 * in the GIC.
	 */
	IntID = XScuGic_CPUReadReg(InstancePtr, XSCUGIC_INT_ACK_OFFSET) &
			XSCUGIC_ACK_INTID_MASK;  //clear the interrupt !! Question: once cleared, no more interrupt generated?
	//xil_printf("IntID = %d\r\n", IntID);
	if(XSCUGIC_MAX_NUM_INTR_INPUTS < IntID){
		goto IntrExit;
	}

	/*
	 * Execute the ISR. Jump into the Interrupt service routine based on the
	 * IRQSource. A software trigger is cleared by the ACK.
	 * This part executes the callback functions!!
	 */
		TablePtr = &(InstancePtr->Config->HandlerTable[IntID]);
		TablePtr->Handler(TablePtr->CallBackRef);
		//printf("Call back function\n %s",TablePtr->CallBackRef);


IntrExit:
	InterruptFlag = 1;
	interrupt_num = interrupt_num + 1;
//	xil_printf("interrupt no.%d detected\r\n", interrupt_num);
	XScuGic_CPUWriteReg(InstancePtr, XSCUGIC_EOI_OFFSET, IntID);
}


/************************** user callback function ****************************/
static void user_callback()
{
	InterruptFlag = 1;
	xil_printf("callback function called\r\n");
}


/*****************************************************************************/
/**
 * Interrupt handler for the read channel
 *
 * @param InstancePtr is the pointer to the DMA engine to work on
 *
 * @return
 *  None
 *
 * @note
 * If the channel is invalid, then no interrupt handling
 *****************************************************************************/
static void ReadIntrHandler(void * InstancePtr)
{
	XAxiVdma *DmaPtr;
	XAxiVdma_Channel *Channel;
	XAxiVdma_ChannelCallBack *CallBack;
	u32 PendingIntr;

	xil_printf("ReadIntrHandler called\r\n");

	DmaPtr = (XAxiVdma *)InstancePtr;

	CallBack = &(DmaPtr->ReadCallBack);

	if (!CallBack->CompletionCallBack) {

		return;
	}

	Channel = XAxiVdma_GetChannel(DmaPtr, XAXIVDMA_READ);

	if (!Channel->IsValid) {
		xdbg_printf(XDBG_DEBUG_ERROR,
			"Read channel is invalid, no intr handling\n\r");

		return;
	}

	PendingIntr = XAxiVdma_ChannelGetPendingIntr(Channel);
	PendingIntr &= XAxiVdma_ChannelGetEnabledIntr(Channel);

	XAxiVdma_ChannelIntrClear(Channel, PendingIntr);

	if (!PendingIntr || (PendingIntr & XAXIVDMA_IXR_ERROR_MASK)) {

		CallBack->ErrCallBack(CallBack->ErrRef,
			PendingIntr & XAXIVDMA_IXR_ERROR_MASK);

		/* The channel's error callback should reset the channel
		 * There is no need to handle other interrupts
		 */
		return;
	}

	if (PendingIntr & XAXIVDMA_IXR_COMPLETION_MASK) {

		CallBack->CompletionCallBack(CallBack->CompletionRef,
			PendingIntr);
	}

	return;
}

/*****************************************************************************/
/**
 * Interrupt handler for the write channel
 *
 * @param InstancePtr is the pointer to the DMA engine to work on
 *
 * @return
 *  None
 *
 * @note
 * If the channel is invalid, then no interrupt handling
 *****************************************************************************/
static void WriteIntrHandler(void * InstancePtr)
{
	XAxiVdma *DmaPtr;
	XAxiVdma_Channel *Channel;
	XAxiVdma_ChannelCallBack *CallBack;
	u32 PendingIntr;

	xil_printf("WriteIntrHandler called\r\n");

	DmaPtr = (XAxiVdma *)InstancePtr;

	Channel = XAxiVdma_GetChannel(DmaPtr, XAXIVDMA_WRITE);

	if (!Channel->IsValid) {
		xdbg_printf(XDBG_DEBUG_ERROR,
			"Write channel is invalid, no intr handling\n\r");

		return;
	}

	PendingIntr = XAxiVdma_ChannelGetPendingIntr(Channel);
	PendingIntr &= XAxiVdma_ChannelGetEnabledIntr(Channel);

	XAxiVdma_ChannelIntrClear(Channel, PendingIntr);

	CallBack = &(DmaPtr->WriteCallBack);

	if (!CallBack->CompletionCallBack) {

		return;
	}

	if (!PendingIntr || (PendingIntr & XAXIVDMA_IXR_ERROR_MASK)) {

		CallBack->ErrCallBack(CallBack->ErrRef,
			PendingIntr & XAXIVDMA_IXR_ERROR_MASK);

		/* The channel's error callback should reset the channel
		 * There is no need to handle other interrupts
		 */
		return;
	}

	if (PendingIntr & XAXIVDMA_IXR_COMPLETION_MASK) {

		CallBack->CompletionCallBack(CallBack->CompletionRef,
			PendingIntr);
	}

	return;
}

