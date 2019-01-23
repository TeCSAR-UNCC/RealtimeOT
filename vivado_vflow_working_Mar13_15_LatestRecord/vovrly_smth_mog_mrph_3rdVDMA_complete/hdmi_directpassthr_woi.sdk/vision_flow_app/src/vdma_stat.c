/*
 * vdma_stat.c
 *
 *  Created on: Jul 14, 2014
 *      Author: msabbagh
 */

#include "vdma_stat.h"

int vdma_stat (void)
{
	////////////////////// DMA STATUS ///////////////////////////////////////////////////

#ifdef MoG_VDMA_INIT
    xil_printf("************* MoG VDMA Status *************\n\r");
	xil_printf("\n Read Channel \n\r");
	xil_printf("MM2S_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x0 )));
	xil_printf("MM2S_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x4 )));
	xil_printf("PARK_PTR_REG = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x28 )));

	xil_printf("\nMM2S Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x5c )));
	xil_printf("MM2S Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x58 )));
	xil_printf("MM2S Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x54 )));
	xil_printf("MM2S Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x50 )));

	xil_printf("\n Write Channel \n\r");
	xil_printf("S2MM_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x30 )));
	xil_printf("S2MM_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x34 )));
	xil_printf("\nS2MM Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0xAC )));
	xil_printf("S2MM Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0xA8 )));
	xil_printf("S2MM Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0xA4 )));
	xil_printf("S2MM Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0xA0 )));
	xil_printf("S2MM_THRESHOLD = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0x4C )));

	xil_printf("\n Hsize Error Status \n\r");
	xil_printf("Hsize captured till Error = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_0_BASEADDR+0xF0 )));
#endif

#ifdef VOUT_OVERLAY_VDMA_INIT
	xil_printf("************* Video Overlay VDMA Status *************\n\r");
	xil_printf("\n Read Channel \n\r");
	xil_printf("MM2S_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x0 )));
	xil_printf("MM2S_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x4 )));
	xil_printf("PARK_PTR_REG = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x28 )));

	xil_printf("\nMM2S Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x5c )));
	xil_printf("MM2S Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x58 )));
	xil_printf("MM2S Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x54 )));
	xil_printf("MM2S Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x50 )));

	xil_printf("\n Write Channel \n\r");
	xil_printf("S2MM_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x30 )));
	xil_printf("S2MM_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x34 )));
	xil_printf("\nS2MM Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0xAC )));
	xil_printf("S2MM Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0xA8 )));
	xil_printf("S2MM Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0xA4 )));
	xil_printf("S2MM Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0xA0 )));
	xil_printf("S2MM_THRESHOLD = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0x4C )));

	xil_printf("\n Hsize Error Status \n\r");
	xil_printf("Hsize captured till Error = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_1_BASEADDR+0xF0 )));
#endif

#ifdef YCBCR2MEM_VDMA_INIT
    xil_printf("*************YCBCR to MEM VDMA Status*************\n\r");
	xil_printf("\n Read Channel \n\r");
	xil_printf("MM2S_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x0 )));
	xil_printf("MM2S_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x4 )));

	xil_printf("\nMM2S Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x5c )));
	xil_printf("MM2S Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x58 )));
	xil_printf("MM2S Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x54 )));
	xil_printf("MM2S Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x50 )));

	xil_printf("\n Write Channel \n\r");
	xil_printf("Read S2MM_CR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x30 )));
	xil_printf("Read S2MM_SR = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x34 )));
	xil_printf("Hsize captured till Error = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0xF0 )));

	xil_printf("\nS2MM Start Addresses = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0xAC )));
	xil_printf("S2MM Frame Delay and Stride = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0xA8 )));
	xil_printf("S2MM Horizontal Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0xA4 )));
	xil_printf("S2MM Vertical Size = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0xA0 )));
	xil_printf("S2MM_THRESHOLD = 0x%08X\n\r", *((volatile int *)(XPAR_AXIVDMA_2_BASEADDR+0x4C )));
#endif

	return XST_SUCCESS;
}
