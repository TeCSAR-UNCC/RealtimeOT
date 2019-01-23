################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/axi_display.c \
../src/ivk_osd.c \
../src/ivk_video_resolution.c \
../src/platform.c \
../src/vtc_config.c \
../src/xtpg_app.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/axi_display.o \
./src/ivk_osd.o \
./src/ivk_video_resolution.o \
./src/platform.o \
./src/vtc_config.o \
./src/xtpg_app.o 

C_DEPS += \
./src/axi_display.d \
./src/ivk_osd.d \
./src/ivk_video_resolution.d \
./src/platform.d \
./src/vtc_config.d \
./src/xtpg_app.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -I../../vdma_display_bsp/processor_subsystem_microblaze_1/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v9.2 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


