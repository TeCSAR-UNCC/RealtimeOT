/*
 * matrix.c
 *
 *  Created on: Jul 20, 2015
 *      Author: xufaneric
 */

#include "matrix.h"
//#include "xil_printf.h"

//set row number
void matrix_set_m(struct _Matrix *m,int mm)
{
	m->m = mm;
}

//set column number
void matrix_set_n(struct _Matrix *m,int nn)
{
	m->n = nn;
}
void matrix_set_X(struct _Matrix_X *a,struct _Matrix *b)
{
	b->m = 4;
	b->n = 1;
	b->arr = &a->arr[0][0];
}
void matrix_set_P(struct _Matrix_P *a,struct _Matrix *b)
{
	b->m = 4;
	b->n = 4;
	b->arr = &a->arr[0][0];
}

void matrix_init(struct _Matrix *m)
{
	m->arr = (float *)malloc(m->m * m->n * sizeof(float));
}


void matrix_free(struct _Matrix *m)
{
	free(m->arr);
}

//read a value, if fails, return -31415
float matrix_read(struct _Matrix *m,int i,int j)
{
	if (i >= m->m || j >= m->n)
    {
		printf("error: matrix_read");
        return -31415;
    }

    return *(m->arr + i * m->n + j);
}

//write a value, if fails, return -1
int matrix_write(struct _Matrix *m,int i,int j,float val)
{
	if (i >= m->m || j >= m->n)
    {
		printf("error: matrix_write");
        return -1;
    }

    *(m->arr + i * m->n + j) = val;
    return 1;
}

//C = A + B, if fails, return -1, otherwise return 1
int matrix_add(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C)
{
	int i = 0;
    int j = 0;


	if (A->m != B->m || A->n != B->n || \
        A->m != C->m || A->n != C->n)
    {
		printf("error: matrix_add");
        return -1;
    }

	//calculation
    for (i = 0;i < C->m;i++)
    {
        for (j = 0;j < C->n;j++)
        {
            matrix_write(C,i,j,matrix_read(A,i,j) + matrix_read(B,i,j));
        }
    }

    return 1;
}

//C = A - B, if fails, return -1, otherwise return 1
int matrix_subtract(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C)
{
	int i = 0;
    int j = 0;


    if (A->m != B->m || A->n != B->n || \
        A->m != C->m || A->n != C->n)
    {
    	printf("error: matrix_subtract");
        return -1;
    }

    //calculation
    for (i = 0;i < C->m;i++)
    {
        for (j = 0;j < C->n;j++)
        {
            matrix_write(C,i,j,matrix_read(A,i,j) - matrix_read(B,i,j));
        }
    }

    return 1;
}

//C = A * B, if fails, return -1, otherwise return 1
int matrix_multiply(struct _Matrix *A,struct _Matrix *B,struct _Matrix *C)
{
	int i = 0;
    int j = 0;
    int k = 0;
    float temp = 0;


    if (A->m != C->m || B->n != C->n || \
        A->n != B->m)
    {
    	printf("error: matrix_multiply");
        return -1;
    }

    //calculation
    for (i = 0;i < C->m;i++)
    {
        for (j = 0;j < C->n;j++)
        {
            temp = 0;
            for (k = 0;k < A->n;k++)
            {
                temp += matrix_read(A,i,k) * matrix_read(B,k,j);
            }
            matrix_write(C,i,j,temp);
        }
    }

    return 1;
}

//determinant, only for 2*2 or 3*3, if fails, return -31415, otherwise return value
float matrix_det(struct _Matrix *A)
{
	float value = 0;


    if (A->m != A->n || (A->m != 2 && A->m != 3))
    {
    	printf("error: matrix_det");
        return -31415;
    }

    if (A->m == 2)
    {
        value = matrix_read(A,0,0) * matrix_read(A,1,1) - matrix_read(A,0,1) * matrix_read(A,1,0);
    }
    else
    {
        value = matrix_read(A,0,0) * matrix_read(A,1,1) * matrix_read(A,2,2) + \
                matrix_read(A,0,1) * matrix_read(A,1,2) * matrix_read(A,2,0) + \
                matrix_read(A,0,2) * matrix_read(A,1,0) * matrix_read(A,2,1) - \
                matrix_read(A,0,0) * matrix_read(A,1,2) * matrix_read(A,2,1) - \
                matrix_read(A,0,1) * matrix_read(A,1,0) * matrix_read(A,2,2) - \
                matrix_read(A,0,2) * matrix_read(A,1,1) * matrix_read(A,2,0);
    }

    return value;
}

//B = A^T, if fails, return -1, otherwise return 1
int matrix_transpos(struct _Matrix *A,struct _Matrix *B)
{
	int i = 0;
    int j = 0;


    if (A->m != B->n || A->n != B->m)
    {
    	printf("error: matrix_transpos");
        return -1;
    }

    //calculation
    for (i = 0;i < B->m;i++)
    {
        for (j = 0;j < B->n;j++)
        {
            matrix_write(B,i,j,matrix_read(A,j,i));
        }
    }

    return 1;
}

//B = A^(-1), if fails, return -1, otherwise return 1
int matrix_inverse(struct _Matrix *A,struct _Matrix *B)
{
	int i = 0;
    int j = 0;
    int k = 0;
    struct _Matrix m;
    float temp = 0;
    float b = 0;


    if (A->m != A->n || B->m != B->n || A->m != B->m)
    {
    	printf("error: matrix_inverse");
        return -1;
    }

    /*
    //
    if (A->m == 2 || A->m == 3)
    {
        if (det(A) == 0)
        {
            return -1;
        }
    }
    */


	matrix_set_m(&m,A->m);
	matrix_set_n(&m,2 * A->m);
	matrix_init(&m);
    for (i = 0;i < m.m;i++)
    {
        for (j = 0;j < m.n;j++)
        {
            if (j <= A->n - 1)
            {
                matrix_write(&m,i,j,matrix_read(A,i,j));
            }
            else
            {
                if (i == j - A->n)
                {
                    matrix_write(&m,i,j,1);
                }
                else
                {
                    matrix_write(&m,i,j,0);
                }
            }
        }
    }


    for (k = 0;k < m.m - 1;k++)
    {

        if (matrix_read(&m,k,k) == 0)
        {
            for (i = k + 1;i < m.m;i++)
            {
                if (matrix_read(&m,i,k) != 0)
                {
                    break;
                }
            }
            if (i >= m.m)
            {
                return -1;
            }
            else
            {

                for (j = 0;j < m.n;j++)
                {
                    temp = matrix_read(&m,k,j);
                    matrix_write(&m,k,j,matrix_read(&m,k + 1,j));
                    matrix_write(&m,k + 1,j,temp);
                }
            }
        }


        for (i = k + 1;i < m.m;i++)
        {

            b = matrix_read(&m,i,k) / matrix_read(&m,k,k);

            for (j = 0;j < m.n;j++)
            {
                temp = matrix_read(&m,i,j) - b * matrix_read(&m,k,j);
                matrix_write(&m,i,j,temp);
            }
        }
    }

    for (k = m.m - 1;k > 0;k--)
    {

        if (matrix_read(&m,k,k) == 0)
        {
            for (i = k + 1;i < m.m;i++)
            {
                if (matrix_read(&m,i,k) != 0)
                {
                    break;
                }
            }
            if (i >= m.m)
            {
                return -1;
            }
            else
            {
                //
                for (j = 0;j < m.n;j++)
                {
                    temp = matrix_read(&m,k,j);
                    matrix_write(&m,k,j,matrix_read(&m,k + 1,j));
                    matrix_write(&m,k + 1,j,temp);
                }
            }
        }

        //
        for (i = k - 1;i >= 0;i--)
        {
            //
            b = matrix_read(&m,i,k) / matrix_read(&m,k,k);
            //
            for (j = 0;j < m.n;j++)
            {
                temp = matrix_read(&m,i,j) - b * matrix_read(&m,k,j);
                matrix_write(&m,i,j,temp);
            }
        }
    }
    //
    for (i = 0;i < m.m;i++)
    {
        if (matrix_read(&m,i,i) != 1)
        {
            //
            b = 1 / matrix_read(&m,i,i);
            //
            for (j = 0;j < m.n;j++)
            {
                temp = matrix_read(&m,i,j) * b;
                matrix_write(&m,i,j,temp);
            }
        }
    }
    //
    for (i = 0;i < B->m;i++)
    {
        for (j = 0;j < B->m;j++)
        {
            matrix_write(B,i,j,matrix_read(&m,i,j + m.m));
        }
    }
    //
    matrix_free(&m);

    return 1;
}
int matrix_display(struct _Matrix *A,int i,int j)
{
	int p, q;
	for (p = 0; p < i; ++p){
		for (q = 0; q < j; ++q)
			printf("  %8f",matrix_read(A, p, q));
		printf("\r\n");
	}
}
