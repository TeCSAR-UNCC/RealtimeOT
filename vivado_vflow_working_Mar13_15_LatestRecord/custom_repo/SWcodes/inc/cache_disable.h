/*
 * cache_disable.h
 *
 *  Created on: Jul 14, 2014
 *      Author: msabbagh
 */

#ifndef CACHE_DISABLE_H_
#define CACHE_DISABLE_H_

#include <stdio.h>
#include "xbasic_types.h"
#include "vdma_cfg.h"

int cache_disable (u32 start_address, u32 region_size_mb);

#endif /* CACHE_DISABLE_H_ */
