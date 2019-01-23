################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/app_cpu0.c \
../src/cache_disable.c \
../src/fg_match_det_threshold_config.c \
../src/fmc_imageon_hdmi_passthrough.c \
../src/foreground_threshold_config.c \
../src/input_param.c \
../src/learnfact_config.c \
../src/match_det_threshold_config.c \
../src/mog_params_config.c \
../src/object_detection.c \
../src/object_detection_intr.c \
../src/object_focus.c \
../src/system_reset_assert.c \
../src/system_reset_deassert.c \
../src/temp.c \
../src/vdma_cfg.c \
../src/vdma_stat.c \
../src/video_resolution.c \
../src/vision_flow.c \
../src/woi_config.c 

OBJS += \
./src/app_cpu0.o \
./src/cache_disable.o \
./src/fg_match_det_threshold_config.o \
./src/fmc_imageon_hdmi_passthrough.o \
./src/foreground_threshold_config.o \
./src/input_param.o \
./src/learnfact_config.o \
./src/match_det_threshold_config.o \
./src/mog_params_config.o \
./src/object_detection.o \
./src/object_detection_intr.o \
./src/object_focus.o \
./src/system_reset_assert.o \
./src/system_reset_deassert.o \
./src/temp.o \
./src/vdma_cfg.o \
./src/vdma_stat.o \
./src/video_resolution.o \
./src/vision_flow.o \
./src/woi_config.o 

C_DEPS += \
./src/app_cpu0.d \
./src/cache_disable.d \
./src/fg_match_det_threshold_config.d \
./src/fmc_imageon_hdmi_passthrough.d \
./src/foreground_threshold_config.d \
./src/input_param.d \
./src/learnfact_config.d \
./src/match_det_threshold_config.d \
./src/mog_params_config.d \
./src/object_detection.d \
./src/object_detection_intr.d \
./src/object_focus.d \
./src/system_reset_assert.d \
./src/system_reset_deassert.d \
./src/temp.d \
./src/vdma_cfg.d \
./src/vdma_stat.d \
./src/video_resolution.d \
./src/vision_flow.d \
./src/woi_config.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O2 -g3 -I../../standalone_bsp_0/ps7_cortexa9_0/include -I/export/scratch/wenyu/wenyu_vision_project/vivado_vflow_working_Mar13_15/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/standalone_bsp_0/ps7_cortexa9_0/include -I/export/scratch/wenyu/wenyu_vision_project/vivado_vflow_working_Mar13_15/custom_repo/SWcodes/inc -I/home/LAB/asawant2/VisionGit/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/custom_repo/SWcodes/inc -I/home/uncc_embed/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/custom_repo/SWcodes/inc -I/home/work1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/custom_repo/SWcodes/inc -c -fmessage-length=0 -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


