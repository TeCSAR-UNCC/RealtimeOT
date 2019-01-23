/*
 * vision_flow.h
 *
 *  Created on: Mar 6, 2015
 *      Author: xufaneric
 */

#ifndef VISION_FLOW_H_
#define VISION_FLOW_H_

#include <stdio.h>
#include "cache_disable.h"
#include "fmc_imageon_hdmi_passthrough.h"
#include "vdma_cfg.h"
#include "system_reset.h"
#include "vdma_stat.h"
#include "object_focus.h"
#include "object_detection.h"
#include "object_detection_intr.h"
#include "xil_cache.h"
#include "mog_params_config.h"
#include "woi_config.h"
#include "input_param.h"
#include "xtime_l.h"

void vision_flow();

#endif /* VISION_FLOW_H_ */