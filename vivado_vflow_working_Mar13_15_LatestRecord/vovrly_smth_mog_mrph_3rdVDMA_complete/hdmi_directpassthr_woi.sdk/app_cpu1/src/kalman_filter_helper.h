/*
 * kalman_filter_helper.h
 *
 *  Created on: Jul 20, 2015
 *      Author: xufaneric
 */

#ifndef KALMAN_FILTER_HELPER_H_
#define KALMAN_FILTER_HELPER_H_


#include "matrix.h"
#include "conf.h"

struct _Matrix F; //(4*4)
struct _Matrix FT; //(4*4)
struct _Matrix Q; //(4*4)
struct _Matrix H; //(2*4)
struct _Matrix HT;  //(4*2)
struct _Matrix R;  //(2*2)
struct _Matrix I;  //(4*4)

struct _Matrix X_tmp; // X_tmp(4*1) = F * X
struct _Matrix P_tmp; // P_tmp(4*4) = TMP2 + Q = F*P*FT + Q
struct _Matrix K; // K(4*2) = TMP7 * TMP6 = P_tmp * HT * (H * P_tmp * HT + R)^-1
struct _Matrix Z; // Z(2*1) = |x|
//							  |y|

struct _Matrix TMP1; // TMP1(4*4) = F*P
struct _Matrix TMP2; // TMP2(4*4) = TMP1*FT = F*P*FT
struct _Matrix TMP3; // TMP3(2*4) = H * P_tmp
struct _Matrix TMP4; // TMP4(2*2) = TMP3 * HT = H * P_tmp * HT
struct _Matrix TMP5; // TMP5(2*2) = TMP4 + R = H * P_tmp * HT + R
struct _Matrix TMP6; // TMP6(2*2) = TMP5^-1 = (H * P_tmp * HT + R)^-1
struct _Matrix TMP7; // TMP7(4*2) = P_tmp * HT
struct _Matrix TMP8; // TMP8(2*1) = H * X_tmp
struct _Matrix TMP9; // TMP9(2*1) = Z - TMP8 = Z - H * X_tmp
struct _Matrix TMP10; // TMP10(4*1) = K * TMP9 = K * (Z - H * X_tmp)
struct _Matrix TMP11; // TMP11(4*4) = K * H
struct _Matrix TMP12; // TMP12(4*4) = I - TMP11 = I - K * H

// X(4*1) = X_tmp + TMP10 = X_tmp + K * (Z - H * X_tmp)
// P(4*4) = TMP12 * P_tmp = (I - K * H) * P_tmp

void kalman_filter_helper_init();
void kalman_filter_helper_free();

#endif /* KALMAN_FILTER_HELPER_H_ */
