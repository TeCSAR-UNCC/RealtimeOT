/*
 * cache_disable.c
 *
 *  Created on: Jul 14, 2014
 *      Author: msabbagh
 */
#include "cache_disable.h"

int cache_disable (u32 start_address, u32 region_size_mb)
{
	u32 j;
	for(j=0; j<region_size_mb ;j++)
	Xil_SetTlbAttributes(start_address + (1024 * 1024 * j), 0x04deA);

	printf("\n ****************** Cache is disabled for %d Mega Byte of memory address space starting from address: %x ****************** \n\n", region_size_mb, start_address);

	return 0;
}

