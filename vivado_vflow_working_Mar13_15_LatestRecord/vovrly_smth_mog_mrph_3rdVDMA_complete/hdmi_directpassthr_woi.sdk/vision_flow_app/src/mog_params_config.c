/*
 * mog_params_config.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */
/*
 * mog_param_config.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */

/***************************** Include Files *******************************/
#include "mog_params_config.h"
#include "xparameters.h"
//#include <stdio.h>

/************************** Function Definitions ***************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @note    Caching must be turned off for this function to work.
 *
 */
int mog_params_config(u32 MD_THRESHOLD, u32 LEARNING_FACTOR, u32 FG_THRESHOLD, u32 FGDM_THRESHOLD, u32 base_address)
{

	match_det_threshold_config ( MD_THRESHOLD, base_address );
	learnfact_config ( LEARNING_FACTOR, base_address );
	//foreground_threshold_config ( FG_THRESHOLD, base_address );
	fg_match_det_threshold_config ( FGDM_THRESHOLD, base_address );

	return 0;
}



