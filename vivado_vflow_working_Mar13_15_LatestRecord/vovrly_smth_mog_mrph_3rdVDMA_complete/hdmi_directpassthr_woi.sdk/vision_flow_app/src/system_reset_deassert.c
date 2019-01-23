/*
 * system_reset_deassert.c
 *
 *  Created on: Jul 31, 2014
 *      Author: htabkhi
 */
#include <stdio.h>
#include "system_reset.h"

int system_reset_deassert (void)
{
    unsigned int Reg32Value;
    unsigned int RegisterAddress;

	///////////////////// System Reset /////////////////////////////////////
	printf("\n********** System Reset Deassertion ***********\n");
//	de-assert reset
	RegisterAddress =  SLCR_Base_Address + FPGA_RST_RELATIVE;
	Xil_Out32(RegisterAddress, 0x0);
	Reg32Value = Xil_In32(RegisterAddress);
		xil_printf("Setting new value Xil_In32:at address %x, value = %x\n\r", RegisterAddress, Reg32Value);
	///////////////////////////////////////////////////////////////////////////

	return 0;
}
