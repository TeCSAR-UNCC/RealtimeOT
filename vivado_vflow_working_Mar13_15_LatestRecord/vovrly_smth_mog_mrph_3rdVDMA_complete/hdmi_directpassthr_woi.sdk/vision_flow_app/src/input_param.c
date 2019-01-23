/*
 * input_param.c
 *
 *  Created on: Oct 29, 2014
 *      Author: msabbagh
 */
#include "stdio.h"
#include "stdlib.h"
#include "input_param.h"

int input_param (void)
{
  char buf[10];
  int i, result;

  printf ("Enter your number: ");

	for (i=0; i< 10; i++){
	  buf[i] = getchar();

		if (buf[i] == 13)
		{
			break;
		}
  	  }

    result = atoi(buf);
    printf ("You entered %u\n\n", result);

  return(result);
}

