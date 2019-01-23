/*
 * system_reset.h
 *
 *  Created on: Jul 4, 2014
 *      Author: msabbagh
 */

#ifndef SYSTEM_RESET_H_
#define SYSTEM_RESET_H_

#define SLCR_Base_Address   0xF8000000
#define FPGA_RST_RELATIVE   0x00000240
#define SLCR_UNLOCK_RELATIVE   0x00000008

int system_reset_assert (void);
int system_reset_deassert (void);

#endif /* SYSTEM_RESET_H_ */
