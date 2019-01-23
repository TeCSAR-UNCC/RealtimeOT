/*
 * learnfact_config.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */
#include "mog_params_config.h"

int learnfact_config (u32 learnfact, u32 base_address)
{
    u32 current_learnfact;
    u32 new_learnfact;

	   //********************************************************//
	   //********************************************************//
	   //********************************************************//

	   	   // read out the current value from our peripheral, at register four
    	   current_learnfact = MIXTUREOFGAUSSIANS_mReadReg(
    			   base_address,
    			   MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG1_OFFSET
	   	   );

	   //********************************************************//
	   //********************************************************//
	   //********************************************************//


		   new_learnfact = learnfact;

		   //printf("Replacing %i with %i ... \n\n", current_learnfact, new_learnfact);

		   // write our value to our peripheral at register 0
		   MIXTUREOFGAUSSIANS_mWriteReg(
				   base_address,
				   MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG1_OFFSET,
				   new_learnfact
		   );

		   //printf("Done.\r\n\n");
		   xil_printf("base_address: %x, new_learnfact: %x\r\n\n", base_address, new_learnfact);

	return 0;
}

