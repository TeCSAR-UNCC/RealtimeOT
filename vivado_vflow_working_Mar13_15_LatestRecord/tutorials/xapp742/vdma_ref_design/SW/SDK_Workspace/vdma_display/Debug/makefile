################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
vdma_display.elf.size \

ELFCHECK += \
vdma_display.elf.elfcheck \


# All Target
all: vdma_display.elf secondary-outputs

# Tool invocations
vdma_display.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../vdma_display_bsp/processor_subsystem_microblaze_1/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v9.2 -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "vdma_display.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

vdma_display.elf.size: vdma_display.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size vdma_display.elf  |tee "vdma_display.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

vdma_display.elf.elfcheck: vdma_display.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck vdma_display.elf -hw ../../hw_platform_0/system.xml -pe processor_subsystem_microblaze_1  |tee "vdma_display.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) vdma_display.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
