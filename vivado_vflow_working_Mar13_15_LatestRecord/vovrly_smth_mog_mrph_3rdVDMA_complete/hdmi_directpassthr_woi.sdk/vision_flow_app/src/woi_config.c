/*
 * woi_config.c
 *
 *  Created on: Oct 30, 2014
 *      Author: msabbagh
 */
#include "woi_config.h"

int woi_config (u32 width_start, u32 width_end, u32 height_start, u32 height_end, u32 base_address)
{
    u32 current_width_start;
    u32 current_width_end;
    u32 current_height_start;
    u32 current_height_end;

	   //********************************************************//
	   //********************************************************//
	   //********************************************************//

	   // read out the current value from our peripheral, at register 0
    	   current_width_start = AXI_WINDOW_OF_INTEREST_DETECTION_mReadReg(
    			   base_address,
    			   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG0_OFFSET
	   	   );

	   // read out the current value from our peripheral, at register 1
    	   current_width_end = AXI_WINDOW_OF_INTEREST_DETECTION_mReadReg(
    			   base_address,
    			   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG1_OFFSET
	   	   );

	   // read out the current value from our peripheral, at register 2
    	   current_height_start = AXI_WINDOW_OF_INTEREST_DETECTION_mReadReg(
    			   base_address,
    			   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG2_OFFSET
	   	   );

	   // read out the current value from our peripheral, at register 3
    	   current_height_end = AXI_WINDOW_OF_INTEREST_DETECTION_mReadReg(
    			   base_address,
    			   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG3_OFFSET
	   	   );


	   //********************************************************//
	   //********************************************************//
	   //********************************************************//

		  // printf("Replacing %i with %i ... \n\n", current_width_start, width_start);
		  // printf("Replacing %i with %i ... \n\n", current_width_end, width_end);
		  // printf("Replacing %i with %i ... \n\n", current_height_start, height_start);
		  // printf("Replacing %i with %i ... \n\n", current_height_end, height_end);

		   // write our value to our peripheral at register 0
		   AXI_WINDOW_OF_INTEREST_DETECTION_mWriteReg(
				   base_address,
				   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG0_OFFSET,
				   width_start
		   );
		   // write our value to our peripheral at register 1
		   AXI_WINDOW_OF_INTEREST_DETECTION_mWriteReg(
				   base_address,
				   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG1_OFFSET,
				   width_end
		   );
		   // write our value to our peripheral at register 2
		   AXI_WINDOW_OF_INTEREST_DETECTION_mWriteReg(
				   base_address,
				   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG2_OFFSET,
				   height_start
		   );
		   // write our value to our peripheral at register 3
		   AXI_WINDOW_OF_INTEREST_DETECTION_mWriteReg(
				   base_address,
				   AXI_WINDOW_OF_INTEREST_DETECTION_S_AXI_SLV_REG3_OFFSET,
				   height_end
		   );

		   printf("Done.\r\n\n");

	return 0;
}

