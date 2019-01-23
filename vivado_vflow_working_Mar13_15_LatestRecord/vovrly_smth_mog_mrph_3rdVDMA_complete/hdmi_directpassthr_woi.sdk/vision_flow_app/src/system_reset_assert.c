/*
 * system_reset_assert.c
 *
 *  Created on: Jul 31, 2014
 *      Author: htabkhi
 */
#include <stdio.h>
#include "system_reset.h"

int system_reset_assert (void)
{
    unsigned int Reg32Value;
    unsigned int RegisterAddress;

	///////////////////// System Reset /////////////////////////////////////
	printf("\n********** System Reset Assertion ***********\n");
	//unlock write to reset register
	RegisterAddress =  SLCR_Base_Address + SLCR_UNLOCK_RELATIVE;
	Xil_Out32(RegisterAddress, 0xDF0D);
	xil_printf("UNLOCK Xil_In32:at address %x, value = %x\n\r", RegisterAddress, Reg32Value);

	//check the initial reset value
	RegisterAddress =  SLCR_Base_Address + FPGA_RST_RELATIVE;
	Reg32Value = Xil_In32(RegisterAddress);
		xil_printf("checking initial value Xil_In32:at address %x, value = %x\n\r", RegisterAddress, Reg32Value);

	//assert reset
	RegisterAddress =  SLCR_Base_Address + FPGA_RST_RELATIVE;
	Xil_Out32(RegisterAddress, 0x4);
	Reg32Value = Xil_In32(RegisterAddress);
		xil_printf("Setting new value Xil_In32:at address %x, value = %x\n\r", RegisterAddress, Reg32Value);

	return 0;
}
