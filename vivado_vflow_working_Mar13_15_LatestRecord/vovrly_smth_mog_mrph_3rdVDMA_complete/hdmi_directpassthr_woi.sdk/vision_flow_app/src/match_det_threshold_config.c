/*
 * match_det_threshold_config.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */
#include "mog_params_config.h"

int match_det_threshold_config (u32 match_det_threshold, u32 base_address){

	u32 current_match_det_threshold;
	u32 new_match_det_threshold;

	current_match_det_threshold = MIXTUREOFGAUSSIANS_mReadReg(
			base_address,
			MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG0_OFFSET
 		   );

	   switch(match_det_threshold)
	   {
	       case 1:
	    	   new_match_det_threshold = 0X00000000;
	    	   break;
	       case 2:
	    	   new_match_det_threshold = 0X00000001;
	    	   break;
	       case 3:
	    	   new_match_det_threshold = 0X00000002;
	    	   break;
	       case 4:
	    	   new_match_det_threshold = 0X00000003;
	    	   break;
	       case 5:
	    	   new_match_det_threshold = 0X00000004;
	    	   break;
	       case 6:
	    	   new_match_det_threshold = 0X00000005;
	    	   break;
	       case 7:
	    	   new_match_det_threshold = 0X00000006;
	    	   break;
	       case 8:
	    	   new_match_det_threshold = 0X00000007;
	    	   break;
	       case 9:
	    	   new_match_det_threshold = 0X00000008;
	    	   break;
	       case 10:
	    	   new_match_det_threshold = 0X00000009;
	    	   break;
	       case 11:
	    	   new_match_det_threshold = 0X0000000A;
	    	   break;
	       case 12:
	    	   new_match_det_threshold = 0X0000000B;
	    	   break;
	       case 13:
	    	   new_match_det_threshold = 0X0000000C;
	    	   break;
	       case 14:
	    	   new_match_det_threshold = 0X0000000D;
	    	   break;
	       case 15:
	    	   new_match_det_threshold = 0X0000000E;
	    	   break;
	       case 16:
	    	   new_match_det_threshold = 0X0000000F;
	    	   break;
	       default :
	    	   new_match_det_threshold = 0X00000005;
	   }

	   //printf("Replacing %u with %u ... \n\n", current_match_det_threshold, new_match_det_threshold);

	   // write our value to our peripheral at register 2
	   MIXTUREOFGAUSSIANS_mWriteReg(
			   base_address,
			   MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG0_OFFSET,
			   new_match_det_threshold
	   );

	   //printf("Done.\r\n\n");

	   xil_printf("base_address: %x, new_match_det_threshold: %x\r\n\n", base_address, new_match_det_threshold);

	   return 0;
}
