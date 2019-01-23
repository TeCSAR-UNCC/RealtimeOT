/*
 * common_value_defination.h
 *
 *  Created on: Mar 26, 2015
 *      Author: xufaneric
 */

#ifndef COMMON_VALUE_DEFINATION_H_
#define COMMON_VALUE_DEFINATION_H_

#define COMM_VAL  (*(volatile unsigned long *)(0xFFFF4000))
#define NumberOfFrames  (*(volatile unsigned long *)(0xFFFF4040))


#define Bloblist_Buf0 (*(volatile struct sBloblist *)(0xFFFF0000))
#define Bloblist_Buf1 (*(volatile struct sBloblist *)(0xFFFF2000))

#define VOVRLAY_READ_REGION (*(volatile unsigned char (*)[655360])(0x14000000))
#define VOVRLAY_WRITE_REGION (*(volatile unsigned char (*)[655360])(0x15000000))
#define YCBCR2MEM_WRITE_REGION (*(volatile unsigned char (*)[4194304])(0x16000000))

#endif /* COMMON_VALUE_DEFINATION_H_ */
