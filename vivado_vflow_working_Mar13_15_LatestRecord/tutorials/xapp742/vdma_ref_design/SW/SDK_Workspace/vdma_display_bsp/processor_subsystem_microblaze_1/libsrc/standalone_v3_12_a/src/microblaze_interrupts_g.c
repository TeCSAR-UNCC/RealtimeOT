
/*******************************************************************
*
* CAUTION: This file is automatically generated by libgen.
* Version: Xilinx EDK 2013.4 EDK_2013.4.20131205
* DO NOT EDIT.
*
* Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.

* 
* Description: Interrupt Handler Table for MicroBlaze Processor
*
*******************************************************************/

#include "microblaze_interrupts_i.h"
#include "xparameters.h"


extern void XIntc_DeviceInterruptHandler (void *);

/*
* The interrupt handler table for microblaze processor
*/

MB_InterruptVectorTableEntry MB_InterruptVectorTable[] =
{
{	XIntc_DeviceInterruptHandler,
	(void*) XPAR_PROCESSOR_SUBSYSTEM_INTERCONNECT_AXI_INTC_1_DEVICE_ID}
};
