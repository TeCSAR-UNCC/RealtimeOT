/*
 * matrix.h
 *
 *  Created on: Jul 20, 2015
 *      Author: xufaneric
 */

#ifndef _MATRIX_H
#define _MATRIX_H

#include <stdio.h>
#include <stdlib.h>

struct _Matrix
{
    int m;
    int n;
    float *arr;
};
struct _Matrix_X
{
    float arr[4][1];
};
struct _Matrix_P
{
    float arr[4][4];
};
//set row number
void matrix_set_m(struct _Matrix *m,int mm);
//set column number
void matrix_set_n(struct _Matrix *m,int nn);

void matrix_set_X(struct _Matrix_X *a,struct _Matrix *b);
void matrix_set_P(struct _Matrix_P *a,struct _Matrix *b);

void matrix_init(struct _Matrix *m);

void matrix_free(struct _Matrix *m);

//read a value, if fails, return -31415, otherwise return value
float matrix_read(struct _Matrix *m,int i,int j);

//write a value, if fails, return -1
int matrix_write(struct _Matrix *m,int i,int j,float val);

//C = A + B, if fails, return -1, otherwise return 1
int matrix_add(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C);

//C = A - B, if fails, return -1, otherwise return 1
int matrix_subtract(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C);

//C = A * B, if fails, return -1, otherwise return 1
int matrix_multiply(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C);

//determinant, only for 2*2 or 3*3, if fails, return -31415, otherwise return value
float matrix_det(struct _Matrix *A);

//B = A^T, if fails, return -1, otherwise return 1
int matrix_transpos(struct _Matrix *A,struct _Matrix *B);

//B = A^(-1), if fails, return -1, otherwise return 1
int matrix_inverse(struct _Matrix *A,struct _Matrix *B);

int matrix_display(struct _Matrix *A,int i,int j);

#endif

