################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
#create_clock -name clock_name -period 10 [get_ports clock_name]
################################################################################
create_clock -name CLK_IN1_N -period 10 [get_ports CLK_IN1_N]
create_clock -name CLK_IN1_P -period 10 [get_ports CLK_IN1_P]

################################################################################