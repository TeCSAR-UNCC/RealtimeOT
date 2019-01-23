# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set NUMBER_OF_STAGES [ipgui::add_param $IPINST -parent $Page0 -name NUMBER_OF_STAGES]
	set BIT_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name BIT_WIDTH]
}

proc update_PARAM_VALUE.NUMBER_OF_STAGES { PARAM_VALUE.NUMBER_OF_STAGES } {
	# Procedure called to update NUMBER_OF_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_STAGES { PARAM_VALUE.NUMBER_OF_STAGES } {
	# Procedure called to validate NUMBER_OF_STAGES
	return true
}

proc update_PARAM_VALUE.BIT_WIDTH { PARAM_VALUE.BIT_WIDTH } {
	# Procedure called to update BIT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_WIDTH { PARAM_VALUE.BIT_WIDTH } {
	# Procedure called to validate BIT_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.BIT_WIDTH { MODELPARAM_VALUE.BIT_WIDTH PARAM_VALUE.BIT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_WIDTH}] ${MODELPARAM_VALUE.BIT_WIDTH}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_STAGES { MODELPARAM_VALUE.NUMBER_OF_STAGES PARAM_VALUE.NUMBER_OF_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_STAGES}] ${MODELPARAM_VALUE.NUMBER_OF_STAGES}
}

