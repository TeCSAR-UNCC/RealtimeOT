/*
 * conf.h
 *
 *  Created on: Oct 9, 2015
 *      Author: wkui
 */

#ifndef CONF_H_
#define CONF_H_

#define Kui //for calculating Kalman

#define KALMAN
#define KALMAN_PARAM_f 1
#define KALMAN_PARAM_r 200
#define KALMAN_PARAM_q 0.3

#define WH_KALMAN //width & height kalman filter

//#define PRED
#define PRED_FRAME 10
//#define SMOTHWH

//#define PRT
//#define TIMING

#define LABELING
#define LABELTHRES 120

//#define POSOUT
/*********POSITION OUTPUT FORMAT**************
%4d %2d %1d %3d %3d %3d %3d %3d %3d %3d %3d
%8d               %3d     %2d         %5d          %5d           %5d              %5d              %5d         %5d        %5d               %5d
Frame_counter Obj_counter  2   Width_BeforeK Height_BK CenX_BeforeKalman CenY_BeforeKalman Width_AfterK Height_AK  CenX_AfterKalman CenY_AfterKalman
Frame_counter Obj_counter  1   Width_BeforeK Height_BK CenX_BeforeKalman CenY_BeforeKalman Width_Vel    Height_Vel CenX_Vel         CenY_Vel
Frame_counter Obj_counter  3           0            0             0               0                 0            0          0                0
Status means: New -> 1, Update -> 2, Disappear -> 3
*/

#define APPEAR_THRES 20
#define DISAPPEAR_THRES 20
#define SCORE_THRES 400

#endif /* CONF_H_ */
