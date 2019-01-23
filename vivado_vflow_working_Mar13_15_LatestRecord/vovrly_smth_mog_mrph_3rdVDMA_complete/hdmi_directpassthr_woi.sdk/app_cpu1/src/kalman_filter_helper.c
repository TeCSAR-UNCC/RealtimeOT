/*
 * kalman_filter_helper.c
 *
 *  Created on: Jul 22, 2015
 *      Author: xufaneric
 */

#include "kalman_filter_helper.h"



void kalman_filter_helper_init()
{


	//initial matrix F
	matrix_set_m(&F, 4);
	matrix_set_n(&F, 4);
	matrix_init(&F);
#ifdef Kui
	matrix_write(&F, 0, 0, 1);
	matrix_write(&F, 0, 1, 0);
	matrix_write(&F, 0, 2, KALMAN_PARAM_f);
	matrix_write(&F, 0, 3, 0);
		matrix_write(&F, 1, 0, 0);
		matrix_write(&F, 1, 1, 1);
		matrix_write(&F, 1, 2, 0);
		matrix_write(&F, 1, 3, KALMAN_PARAM_f);
			matrix_write(&F, 2, 0, 0);
			matrix_write(&F, 2, 1, 0);
			matrix_write(&F, 2, 2, 1);
			matrix_write(&F, 2, 3, 0);
				matrix_write(&F, 3, 0, 0);
				matrix_write(&F, 3, 1, 0);
				matrix_write(&F, 3, 2, 0);
				matrix_write(&F, 3, 3, 1);
#else
	matrix_write(&F, 0, 0, 1);
	matrix_write(&F, 0, 1, 1);
	matrix_write(&F, 0, 2, 0);
	matrix_write(&F, 0, 3, 0);
		matrix_write(&F, 1, 0, 0);
		matrix_write(&F, 1, 1, 1);
		matrix_write(&F, 1, 2, 0);
		matrix_write(&F, 1, 3, 0);
			matrix_write(&F, 2, 0, 0);
			matrix_write(&F, 2, 1, 0);
			matrix_write(&F, 2, 2, 1);
			matrix_write(&F, 2, 3, 1);
				matrix_write(&F, 3, 0, 0);
				matrix_write(&F, 3, 1, 0);
				matrix_write(&F, 3, 2, 0);
				matrix_write(&F, 3, 3, 1);
#endif
	//get transposition of F ==> F^T
	matrix_set_m(&FT, 4);
	matrix_set_n(&FT, 4);
	matrix_init(&FT);

	matrix_transpos(&F, &FT);

	//init Q
	matrix_set_m(&Q, 4);
	matrix_set_n(&Q, 4);
	matrix_init(&Q);

	matrix_write(&Q, 0, 0, 0);
	matrix_write(&Q, 0, 1, 0);
	matrix_write(&Q, 0, 2, 0);
	matrix_write(&Q, 0, 3, 0);
		matrix_write(&Q, 1, 0, 0);
		matrix_write(&Q, 1, 1, 0);
		matrix_write(&Q, 1, 2, 0);
		matrix_write(&Q, 1, 3, 0);
			matrix_write(&Q, 2, 0, 0);
			matrix_write(&Q, 2, 1, 0);
			matrix_write(&Q, 2, 2, KALMAN_PARAM_q);
			matrix_write(&Q, 2, 3, 0);
				matrix_write(&Q, 3, 0, 0);
				matrix_write(&Q, 3, 1, 0);
				matrix_write(&Q, 3, 2, 0);
				matrix_write(&Q, 3, 3, KALMAN_PARAM_q);

	//init H
#ifdef Kui
	matrix_set_n(&H, 4);
#else
	matrix_set_n(&H, 2);
#endif
	matrix_set_m(&H, 4);
	matrix_init(&H);

#ifdef Kui
	matrix_write(&H, 0, 0, 1);
	matrix_write(&H, 0, 1, 0);
	matrix_write(&H, 0, 2, 1);
	matrix_write(&H, 0, 3, 0);

	matrix_write(&H, 1, 0, 0);
	matrix_write(&H, 1, 1, 1);
	matrix_write(&H, 1, 2, 0);
	matrix_write(&H, 1, 3, 1);

	matrix_write(&H, 2, 0, 0);
	matrix_write(&H, 2, 1, 0);
	matrix_write(&H, 2, 2, 1);
	matrix_write(&H, 2, 3, 0);

	matrix_write(&H, 3, 0, 0);
	matrix_write(&H, 3, 1, 0);
	matrix_write(&H, 3, 2, 0);
	matrix_write(&H, 3, 3, 1);

#else
	matrix_write(&H, 0, 0, 1);
	matrix_write(&H, 0, 1, 0);
	matrix_write(&H, 0, 2, 0);
	matrix_write(&H, 0, 3, 0);

	matrix_write(&H, 1, 0, 0);
	matrix_write(&H, 1, 1, 0);
	matrix_write(&H, 1, 2, 1);
	matrix_write(&H, 1, 3, 0);
#endif

	//get transposition of H ==> H^T
#ifdef Kui
	matrix_set_n(&HT, 4);
#else
	matrix_set_n(&HT, 2);
#endif
	matrix_set_m(&HT, 4);
	matrix_init(&HT);

	matrix_transpos(&H, &HT);

	//init R
#ifdef Kui
	matrix_set_m(&R, 4);
	matrix_set_n(&R, 4);
	matrix_init(&R);

	matrix_write(&R, 0, 0, KALMAN_PARAM_r);
	matrix_write(&R, 0, 1, 0);
	matrix_write(&R, 0, 2, 0);
	matrix_write(&R, 0, 3, 0);
		matrix_write(&R, 1, 0, 0);
		matrix_write(&R, 1, 1, KALMAN_PARAM_r);
		matrix_write(&R, 1, 2, 0);
		matrix_write(&R, 1, 3, 0);
		matrix_write(&R, 2, 0, 0);
		matrix_write(&R, 2, 1, 0);
		matrix_write(&R, 2, 2, KALMAN_PARAM_r);
		matrix_write(&R, 2, 3, 0);
			matrix_write(&R, 3, 0, 0);
			matrix_write(&R, 3, 1, 0);
			matrix_write(&R, 3, 2, 0);
			matrix_write(&R, 3, 3, KALMAN_PARAM_r);

#else
	matrix_set_m(&R, 2);
	matrix_set_n(&R, 2);
	matrix_init(&R);

	matrix_write(&R, 0, 0, 5);
	matrix_write(&R, 0, 1, 0);
		matrix_write(&R, 1, 0, 0);
		matrix_write(&R, 1, 1, 5);
#endif



	//initial matrix I
	matrix_set_m(&I, 4);
	matrix_set_n(&I, 4);
	matrix_init(&I);

	matrix_write(&I, 0, 0, 1);
	matrix_write(&I, 0, 1, 0);
	matrix_write(&I, 0, 2, 0);
	matrix_write(&I, 0, 3, 0);
		matrix_write(&I, 1, 0, 0);
		matrix_write(&I, 1, 1, 1);
		matrix_write(&I, 1, 2, 0);
		matrix_write(&I, 1, 3, 0);
			matrix_write(&I, 2, 0, 0);
			matrix_write(&I, 2, 1, 0);
			matrix_write(&I, 2, 2, 1);
			matrix_write(&I, 2, 3, 0);
				matrix_write(&I, 3, 0, 0);
				matrix_write(&I, 3, 1, 0);
				matrix_write(&I, 3, 2, 0);
				matrix_write(&I, 3, 3, 1);


	matrix_set_m(&X_tmp, 4);
	matrix_set_n(&X_tmp, 1);
	matrix_init(&X_tmp);

	matrix_set_m(&P_tmp, 4);
	matrix_set_n(&P_tmp, 4);
	matrix_init(&P_tmp);

#ifdef Kui
	matrix_set_n(&K, 4);
#else
	matrix_set_n(&K, 2);
#endif
	matrix_set_m(&K, 4);
	matrix_init(&K);

#ifdef Kui
	matrix_set_m(&Z, 4);
#else
	matrix_set_m(&Z, 2);
#endif
	matrix_set_n(&Z, 1);
	matrix_init(&Z);

	matrix_set_m(&TMP1, 4);
	matrix_set_n(&TMP1, 4);
	matrix_init(&TMP1);

	matrix_set_m(&TMP2, 4);
	matrix_set_n(&TMP2, 4);
	matrix_init(&TMP2);

#ifdef Kui
	matrix_set_m(&TMP3, 4);
#else
	matrix_set_m(&TMP3, 2);
#endif
	matrix_set_n(&TMP3, 4);
	matrix_init(&TMP3);

#ifdef Kui
	matrix_set_m(&TMP4, 4);
	matrix_set_n(&TMP4, 4);
#else
	matrix_set_m(&TMP4, 2);
	matrix_set_n(&TMP4, 2);
#endif

	//matrix_set_m(&TMP4, 2);
	//matrix_set_n(&TMP4, 2);
	matrix_init(&TMP4);

#ifdef Kui
	matrix_set_m(&TMP5, 4);
	matrix_set_n(&TMP5, 4);
#else
	matrix_set_m(&TMP5, 2);
	matrix_set_n(&TMP5, 2);
#endif

	//matrix_set_m(&TMP5, 2);
	//matrix_set_n(&TMP5, 2);
	matrix_init(&TMP5);

#ifdef Kui
	matrix_set_m(&TMP6, 4);
	matrix_set_n(&TMP6, 4);
#else
	matrix_set_m(&TMP6, 2);
	matrix_set_n(&TMP6, 2);
#endif

	//matrix_set_m(&TMP6, 2);
	//matrix_set_n(&TMP6, 2);
	matrix_init(&TMP6);

#ifdef Kui
	matrix_set_n(&TMP7, 4);
#else
	matrix_set_n(&TMP7, 2);
#endif

	//matrix_set_n(&TMP7, 2);
	matrix_set_m(&TMP7, 4);
	matrix_init(&TMP7);

#ifdef Kui
	matrix_set_m(&TMP8, 4);
#else
	matrix_set_m(&TMP8, 2);
#endif

	//matrix_set_m(&TMP8, 2);
	matrix_set_n(&TMP8, 1);
	matrix_init(&TMP8);

#ifdef Kui
	matrix_set_m(&TMP9, 4);
#else
	matrix_set_m(&TMP9, 2);
#endif

	//matrix_set_m(&TMP9, 2);
	matrix_set_n(&TMP9, 1);
	matrix_init(&TMP9);

	matrix_set_m(&TMP10, 4);
	matrix_set_n(&TMP10, 1);
	matrix_init(&TMP10);

	matrix_set_m(&TMP11, 4);
	matrix_set_n(&TMP11, 4);
	matrix_init(&TMP11);

	matrix_set_m(&TMP12, 4);
	matrix_set_n(&TMP12, 4);
	matrix_init(&TMP12);
}


void kalman_filter_helper_free()
{
	matrix_free(&F);
	matrix_free(&FT);
	matrix_free(&Q);
	matrix_free(&H);
	matrix_free(&HT);
	matrix_free(&R);
	matrix_free(&I);
	matrix_free(&X_tmp);
	matrix_free(&P_tmp);
	matrix_free(&K);
	matrix_free(&Z);
	matrix_free(&TMP1);
	matrix_free(&TMP2);
	matrix_free(&TMP3);
	matrix_free(&TMP4);
	matrix_free(&TMP5);
	matrix_free(&TMP6);
	matrix_free(&TMP7);
	matrix_free(&TMP8);
	matrix_free(&TMP9);
	matrix_free(&TMP10);
	matrix_free(&TMP11);
	matrix_free(&TMP12);
}
