################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/app_cpu1.c \
../src/blob_tracking.c \
../src/kalman_filter_helper.c \
../src/matrix.c \
../src/object_focus.c \
../src/vovrly_write_back.c 

OBJS += \
./src/app_cpu1.o \
./src/blob_tracking.o \
./src/kalman_filter_helper.o \
./src/matrix.o \
./src/object_focus.o \
./src/vovrly_write_back.o 

C_DEPS += \
./src/app_cpu1.d \
./src/blob_tracking.d \
./src/kalman_filter_helper.d \
./src/matrix.d \
./src/object_focus.d \
./src/vovrly_write_back.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O2 -g3 -c -fmessage-length=0 -MT"$@" -I../../app_cpu1_bsp/ps7_cortexa9_1/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


