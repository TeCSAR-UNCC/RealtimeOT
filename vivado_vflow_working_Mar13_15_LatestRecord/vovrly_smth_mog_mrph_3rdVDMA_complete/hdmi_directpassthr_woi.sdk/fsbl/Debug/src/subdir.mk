################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/ddr_init.c \
../src/fsbl_hooks.c \
../src/image_mover.c \
../src/main.c \
../src/md5.c \
../src/nand.c \
../src/nor.c \
../src/pcap.c \
../src/ps7_init.c \
../src/qspi.c \
../src/rsa.c \
../src/sd.c 

S_UPPER_SRCS += \
../src/fsbl_handoff.S 

OBJS += \
./src/ddr_init.o \
./src/fsbl_handoff.o \
./src/fsbl_hooks.o \
./src/image_mover.o \
./src/main.o \
./src/md5.o \
./src/nand.o \
./src/nor.o \
./src/pcap.o \
./src/ps7_init.o \
./src/qspi.o \
./src/rsa.o \
./src/sd.o 

S_UPPER_DEPS += \
./src/fsbl_handoff.d 

C_DEPS += \
./src/ddr_init.d \
./src/fsbl_hooks.d \
./src/image_mover.d \
./src/main.d \
./src/md5.d \
./src/nand.d \
./src/nor.d \
./src/pcap.d \
./src/ps7_init.d \
./src/qspi.d \
./src/rsa.d \
./src/sd.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I../../fsbl_bsp/ps7_cortexa9_0/include -I"/home/work1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/hdmi_directpassthr_woi_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I../../fsbl_bsp/ps7_cortexa9_0/include -I"/home/work1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/hdmi_directpassthr_woi_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


