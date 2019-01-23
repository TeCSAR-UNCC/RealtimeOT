/*
 * foreground_threshold_config.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */
#include "mog_params_config.h"

int foreground_threshold_config (u32 foreground_threshold, u32 base_address){

	u32 current_foreground_threshold;
	u32 new_foreground_threshold;

	current_foreground_threshold = MIXTUREOFGAUSSIANS_mReadReg(
			base_address,
			MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG2_OFFSET
 		   );

    		   switch(foreground_threshold)
    		   {
    		       case 1:
    		    	   new_foreground_threshold = 0X00000FFF;
    		    	   break;
    		       case 2:
    		    	   new_foreground_threshold = 0X00001FFF;
    		    	   break;
    		       case 3:
    		    	   new_foreground_threshold = 0X00002FFF;
    		    	   break;
    		       case 4:
    		    	   new_foreground_threshold = 0X00003FFF;
    		    	   break;
    		       case 5:
    		    	   new_foreground_threshold = 0X00004FFF;
    		    	   break;
    		       case 6:
    		    	   new_foreground_threshold = 0X00005FFF;
    		    	   break;
    		       case 7:
    		    	   new_foreground_threshold = 0X00006FFF;
    		    	   break;
    		       case 8:
    		    	   new_foreground_threshold = 0X00007FFF;
    		    	   break;
    		       case 9:
    		    	   new_foreground_threshold = 0X00008FFF;
    		    	   break;
    		       case 10:
    		    	   new_foreground_threshold = 0X00009FFF;
    		    	   break;
    		       case 11:
    		    	   new_foreground_threshold = 0X0000AFFF;
    		    	   break;
    		       case 12:
    		    	   new_foreground_threshold = 0X0000BFFF;
    		    	   break;
    		       case 13:
    		    	   new_foreground_threshold = 0X0000CFFF;
    		    	   break;
    		       case 14:
    		    	   new_foreground_threshold = 0X0000DFFF;
    		    	   break;
    		       case 15:
    		    	   new_foreground_threshold = 0X0000EFFF;
    		    	   break;
    		       case 16:
    		    	   new_foreground_threshold = 0X0000FFFF;
    		    	   break;
    		       default :
    		    	   new_foreground_threshold = 0X00003FFF;
    		   }

    		  // printf("Replacing %u with %u ... \n\n", current_foreground_threshold, new_foreground_threshold);

    		   // write our value to our peripheral at register 2
//    		   MIXTUREOFGAUSSIANS_mWriteReg(
//    				   base_address,
//    				   MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG2_OFFSET,
//    				   new_foreground_threshold
//    		   );

    		   MIXTUREOFGAUSSIANS_mWriteReg(
    				   base_address,
    				   MIXTUREOFGAUSSIANS_S00_AXI_SLV_REG2_OFFSET,
    				   new_foreground_threshold
    		   );

    		   //printf("Done.\r\n\n");
    		   xil_printf("base_address: %x, new_foreground_threshold: %x\r\n\n", base_address, new_foreground_threshold);

    		   return 0;
}