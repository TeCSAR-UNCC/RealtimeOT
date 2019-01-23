/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 */

/***************************** Include Files ********************************/
#include "xparameters.h"
#include <stdio.h>
#include "xil_io.h"
#include "xil_mmu.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "sleep.h"
#include "vovrly_write_back.h"
#include "blob_tracking.h"
#include "common_value_defination.h"
#include "xtime_l.h"
#include "kalman_filter_helper.h"
#include "conf.h"

/************************** Constant Definitions ****************************/
//#define INTC		    XScuGic
//#define INTC_HANDLER	XScuGic_InterruptHandler
//#define INTC_DEVICE_ID	XPAR_PS7_SCUGIC_0_DEVICE_ID
//#define PL_IRQ_ID       XPS_IRQ_INT_ID

//#define IRQ_PCORE_GEN_BASE  XPAR_IRQ_GEN_0_BASEADDR

#ifndef COMM_VAL
#define COMM_VAL    (*(volatile unsigned long *)(0xFFFF4000))
#endif

/**************************** Type Definitions ******************************/
/**
 * This typedef contains configuration information for the device driver.
 */
typedef struct {
	u16 DeviceId;		/**< Unique ID of device */
	u32 BaseAddress;	/**< Base address of the device */
} Pl_Config;


/**
 * The driver instance data. The user is required to allocate a
 * variable of this type.
 * A pointer to a variable of this type is then passed to the driver API
 * functions.
 */
//typedef struct {
//	Pl_Config Config;   /**< Hardware Configuration */
//	u32 IsReady;		/**< Device is initialized and ready */
//	u32 IsStarted;		/**< Device is running */
//} XPlIrq;

/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/
extern u32 MMUTable;

/**
 * Assign the driver structures for the interrupt controller and
 * PL Core interrupt source
 */
//INTC   IntcInstancePtr;
//XPlIrq PlIrqInstancePtr;

// Global for IRQ communication to main()
//int irq_count;

/************************** Function Prototypes *****************************/

//void        Xil_L1DCacheFlush(void);
//static int  SetupIntrSystem(INTC *IntcInstancePtr, XPlIrq *PeriphInstancePtr, u16 IntrId);
//static void DisableIntrSystem(INTC *IntcInstancePtr, u16 IntrId);
//static void PlIntrHandler(void *CallBackRef);


/*****************************************************************************/
/**
*
* main()
*	- Runs example.
*
*
* @param	tbd
*
* @return
*		- tbd
*
* @note		tbd
*
******************************************************************************/
int main()
{
//	while(1);
	int Status;

//printf("IN CPU1 %d \n",COMM_VAL);
    //Disable cache on OCM
	Xil_SetTlbAttributes(0xFFFF0000,0x14de2);           // S=b1 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0

	while (!COMM_VAL) {//xil_printf("CPU1: test0 \n\r");
	}

    NumberOfFrames = 3000000;
//    xil_printf("CPU1: init_platform, please input number of frames: \n\r");
//    scanf("%d", &NumberOfFrames);
 //   xil_printf("NumberOfFrames = %d.\n\r", NumberOfFrames);
    int number = NumberOfFrames;

#ifdef KALMAN
	kalman_filter_helper_init();
#endif
    while(number--){
    	// xil_printf("CPU1: frame number %d \n",NumberOfFrames);
     	while(COMM_VAL == 0){}
     	// xil_printf("Common Value of From CPU 1:%d",COMM_VAL);
     	blob_tracking(APPEAR_THRES, DISAPPEAR_THRES, SCORE_THRES);
     	//xil_printf("Common Value of From CPU 1 After track:%d",COMM_VAL);
     	COMM_VAL = 0;
     }
#ifdef KALMAN
    kalman_filter_helper_free();
#endif

    return 0;
}
