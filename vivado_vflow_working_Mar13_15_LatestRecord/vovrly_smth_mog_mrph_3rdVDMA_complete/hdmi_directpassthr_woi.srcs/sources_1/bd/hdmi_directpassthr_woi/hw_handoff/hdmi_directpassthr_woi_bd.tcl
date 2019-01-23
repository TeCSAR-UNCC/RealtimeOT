
################################################################
# This is a generated script based on design: hdmi_directpassthr_woi
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source hdmi_directpassthr_woi_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name hdmi_directpassthr_woi

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: w3_selection
proc create_hier_cell_w3_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_w3_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 15 -to 0 A
  create_bd_pin -dir I -from 15 -to 0 B
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: one16, and set properties
  set one16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {65535} \
CONFIG.CONST_WIDTH {16} \
 ] $one16

  # Create instance: one16subw1addw2, and set properties
  set one16subw1addw2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 one16subw1addw2 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.Add_Mode {Subtract} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {16} \
 ] $one16subw1addw2

  # Create instance: w1addw2, and set properties
  set w1addw2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 w1addw2 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {16} \
 ] $w1addw2

  # Create instance: w3_concat, and set properties
  set w3_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 w3_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $w3_concat

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net A_1 [get_bd_pins A] [get_bd_pins w1addw2/A]
  connect_bd_net -net B_1 [get_bd_pins B] [get_bd_pins w1addw2/B]
  connect_bd_net -net one16_dout [get_bd_pins one16/dout] [get_bd_pins one16subw1addw2/A]
  connect_bd_net -net one16subw1addw2_S [get_bd_pins one16subw1addw2/S] [get_bd_pins w3_concat/In1]
  connect_bd_net -net w1addw2_S [get_bd_pins one16subw1addw2/B] [get_bd_pins w1addw2/S]
  connect_bd_net -net w3_concat_dout [get_bd_pins dout] [get_bd_pins w3_concat/dout]
  connect_bd_net -net zero16_dout [get_bd_pins w3_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: w2_selection
proc create_hier_cell_w2_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_w2_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 15 -to 0 Dout1
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: w2_concat, and set properties
  set w2_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 w2_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $w2_concat

  # Create instance: w2_slice, and set properties
  set w2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 w2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {127} \
CONFIG.DIN_TO {112} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $w2_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins w2_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins Dout1] [get_bd_pins w2_concat/In1] [get_bd_pins w2_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins w2_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins w2_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: w1_selection
proc create_hier_cell_w1_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_w1_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 15 -to 0 Dout1
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: w1_concat, and set properties
  set w1_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 w1_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $w1_concat

  # Create instance: w1_slice, and set properties
  set w1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 w1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {111} \
CONFIG.DIN_TO {96} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $w1_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins w1_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins Dout1] [get_bd_pins w1_concat/In1] [get_bd_pins w1_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins w1_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins w1_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: sd3_selection
proc create_hier_cell_sd3_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_sd3_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: sd3_concat, and set properties
  set sd3_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sd3_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $sd3_concat

  # Create instance: sd3_slice, and set properties
  set sd3_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd3_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {95} \
CONFIG.DIN_TO {80} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $sd3_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins sd3_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins sd3_concat/In1] [get_bd_pins sd3_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins sd3_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins sd3_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: sd2_selection
proc create_hier_cell_sd2_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_sd2_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: sd2_concat, and set properties
  set sd2_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sd2_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $sd2_concat

  # Create instance: sd2_slice, and set properties
  set sd2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {79} \
CONFIG.DIN_TO {64} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $sd2_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins sd2_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins sd2_concat/In1] [get_bd_pins sd2_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins sd2_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins sd2_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: sd1_selection
proc create_hier_cell_sd1_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_sd1_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: sd1_concat, and set properties
  set sd1_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sd1_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $sd1_concat

  # Create instance: sd1_slice, and set properties
  set sd1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {63} \
CONFIG.DIN_TO {48} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $sd1_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins sd1_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins sd1_concat/In1] [get_bd_pins sd1_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins sd1_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins sd1_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mean3_selection
proc create_hier_cell_mean3_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mean3_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: mean3_concat, and set properties
  set mean3_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 mean3_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $mean3_concat

  # Create instance: mean3_slice, and set properties
  set mean3_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean3_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {47} \
CONFIG.DIN_TO {32} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {1} \
 ] $mean3_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins mean3_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins mean3_concat/In1] [get_bd_pins mean3_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins mean3_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mean3_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mean2_selection
proc create_hier_cell_mean2_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mean2_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: mean2_concat, and set properties
  set mean2_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 mean2_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $mean2_concat

  # Create instance: mean2_slice, and set properties
  set mean2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $mean2_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins mean2_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins mean2_concat/In1] [get_bd_pins mean2_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins mean2_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mean2_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mean1_selection
proc create_hier_cell_mean1_selection { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mean1_selection() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 31 -to 0 dout

  # Create instance: mean1_concat, and set properties
  set mean1_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 mean1_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $mean1_concat

  # Create instance: mean1_slice, and set properties
  set mean1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $mean1_slice

  # Create instance: zero16, and set properties
  set zero16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero16 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {16} \
 ] $zero16

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins dout] [get_bd_pins mean1_concat/dout]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins mean1_concat/In1] [get_bd_pins mean1_slice/Dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins Din] [get_bd_pins mean1_slice/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mean1_concat/In0] [get_bd_pins zero16/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ycbcr_aresetn_gen
proc create_hier_cell_ycbcr_aresetn_gen { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ycbcr_aresetn_gen() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 aresetn
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 tuser

  # Create instance: one, and set properties
  set one [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one ]

  # Create instance: pipeline_registers_0, and set properties
  set pipeline_registers_0 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_0 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_0

  # Create instance: xup_or2_0, and set properties
  set xup_or2_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_0 ]

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins pipeline_registers_0/clk]
  connect_bd_net -net pipeline_registers_0_pipe_out [get_bd_pins aresetn] [get_bd_pins pipeline_registers_0/pipe_out] [get_bd_pins xup_or2_0/a]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins one/dout] [get_bd_pins pipeline_registers_0/reset_n]
  connect_bd_net -net xup_or2_0_y [get_bd_pins pipeline_registers_0/pipe_in] [get_bd_pins xup_or2_0/y]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tuser [get_bd_pins tuser] [get_bd_pins xup_or2_0/b]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: vovrly_async_fifo_rst
proc create_hier_cell_vovrly_async_fifo_rst { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_vovrly_async_fifo_rst() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 aresetn
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 tuser

  # Create instance: pipeline_registers_10, and set properties
  set pipeline_registers_10 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_10 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_10

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xup_or2_2, and set properties
  set xup_or2_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_2 ]

  # Create port connections
  connect_bd_net -net pipeline_registers_10_pipe_out [get_bd_pins aresetn] [get_bd_pins pipeline_registers_10/pipe_out] [get_bd_pins xup_or2_2/b]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk] [get_bd_pins pipeline_registers_10/clk]
  connect_bd_net -net video_overlay_unit_m_axis_mm2s_tuser [get_bd_pins tuser] [get_bd_pins xup_or2_2/a]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins pipeline_registers_10/reset_n] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xup_or2_2_y [get_bd_pins pipeline_registers_10/pipe_in] [get_bd_pins xup_or2_2/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: color_video_pass_fifo_wr_en
proc create_hier_cell_color_video_pass_fifo_wr_en { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_color_video_pass_fifo_wr_en() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 de_in
  create_bd_pin -dir I reset_n
  create_bd_pin -dir O -from 0 -to 0 wr_en

  # Create instance: pipeline_registers_10, and set properties
  set pipeline_registers_10 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_10 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_10

  # Create instance: xup_or2_2, and set properties
  set xup_or2_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_2 ]

  # Create port connections
  connect_bd_net -net pipeline_registers_10_pipe_out [get_bd_pins wr_en] [get_bd_pins pipeline_registers_10/pipe_out] [get_bd_pins xup_or2_2/b]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk] [get_bd_pins pipeline_registers_10/clk]
  connect_bd_net -net reset_n_1 [get_bd_pins reset_n] [get_bd_pins pipeline_registers_10/reset_n]
  connect_bd_net -net video_overlay_unit_m_axis_mm2s_tuser [get_bd_pins de_in] [get_bd_pins xup_or2_2/a]
  connect_bd_net -net xup_or2_2_y [get_bd_pins pipeline_registers_10/pipe_in] [get_bd_pins xup_or2_2/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: color_video_pass_fifo_rd_en
proc create_hier_cell_color_video_pass_fifo_rd_en { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_color_video_pass_fifo_rd_en() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 de_in
  create_bd_pin -dir O -from 0 -to 0 rd_en
  create_bd_pin -dir I reset_n

  # Create instance: pipeline_registers_10, and set properties
  set pipeline_registers_10 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_10 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_10

  # Create instance: xup_or2_2, and set properties
  set xup_or2_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_2 ]

  # Create port connections
  connect_bd_net -net pipeline_registers_10_pipe_out [get_bd_pins rd_en] [get_bd_pins pipeline_registers_10/pipe_out] [get_bd_pins xup_or2_2/b]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk] [get_bd_pins pipeline_registers_10/clk]
  connect_bd_net -net reset_n_1 [get_bd_pins reset_n] [get_bd_pins pipeline_registers_10/reset_n]
  connect_bd_net -net video_overlay_unit_m_axis_mm2s_tuser [get_bd_pins de_in] [get_bd_pins xup_or2_2/a]
  connect_bd_net -net xup_or2_2_y [get_bd_pins pipeline_registers_10/pipe_in] [get_bd_pins xup_or2_2/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mog_params_packing
proc create_hier_cell_mog_params_packing { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mog_params_packing() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 127 -to 0 dout
  create_bd_pin -dir I -from 31 -to 0 mean1_up
  create_bd_pin -dir I -from 31 -to 0 mean2_up
  create_bd_pin -dir I -from 31 -to 0 mean3_up
  create_bd_pin -dir I -from 31 -to 0 sd1_up
  create_bd_pin -dir I -from 31 -to 0 sd2_up
  create_bd_pin -dir I -from 31 -to 0 sd3_up
  create_bd_pin -dir I -from 31 -to 0 w1_up
  create_bd_pin -dir I -from 31 -to 0 w2_up

  # Create instance: mean1_slice, and set properties
  set mean1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $mean1_slice

  # Create instance: mean2_slice, and set properties
  set mean2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $mean2_slice

  # Create instance: mean3_slice, and set properties
  set mean3_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mean3_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $mean3_slice

  # Create instance: params_concat, and set properties
  set params_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 params_concat ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
CONFIG.IN2_WIDTH {16} \
CONFIG.IN3_WIDTH {16} \
CONFIG.IN4_WIDTH {16} \
CONFIG.IN5_WIDTH {16} \
CONFIG.IN6_WIDTH {16} \
CONFIG.IN7_WIDTH {16} \
CONFIG.NUM_PORTS {8} \
 ] $params_concat

  # Create instance: sd1_slice, and set properties
  set sd1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $sd1_slice

  # Create instance: sd2_slice, and set properties
  set sd2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $sd2_slice

  # Create instance: sd3_slice, and set properties
  set sd3_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sd3_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $sd3_slice

  # Create instance: w1_slice, and set properties
  set w1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 w1_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $w1_slice

  # Create instance: w2_slice, and set properties
  set w2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 w2_slice ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DOUT_WIDTH {16} \
 ] $w2_slice

  # Create port connections
  connect_bd_net -net MixtureOfGuassians_0_mean1_up [get_bd_pins mean3_up] [get_bd_pins mean1_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_mean2_up [get_bd_pins mean2_up] [get_bd_pins mean2_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_mean3_up [get_bd_pins w2_up] [get_bd_pins mean3_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_sd1_up [get_bd_pins sd3_up] [get_bd_pins sd1_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_sd2_up [get_bd_pins w1_up] [get_bd_pins sd2_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_sd3_up [get_bd_pins sd1_up] [get_bd_pins sd3_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_w1_up [get_bd_pins mean1_up] [get_bd_pins w1_slice/Din]
  connect_bd_net -net MixtureOfGuassians_0_w2_up [get_bd_pins sd2_up] [get_bd_pins w2_slice/Din]
  connect_bd_net -net mean1_slice_Dout [get_bd_pins mean1_slice/Dout] [get_bd_pins params_concat/In0]
  connect_bd_net -net mean2_slice_Dout [get_bd_pins mean2_slice/Dout] [get_bd_pins params_concat/In1]
  connect_bd_net -net mean3_slice_Dout [get_bd_pins mean3_slice/Dout] [get_bd_pins params_concat/In2]
  connect_bd_net -net params_concat_dout [get_bd_pins dout] [get_bd_pins params_concat/dout]
  connect_bd_net -net sd1_slice_Dout [get_bd_pins params_concat/In3] [get_bd_pins sd1_slice/Dout]
  connect_bd_net -net sd2_slice_Dout [get_bd_pins params_concat/In4] [get_bd_pins sd2_slice/Dout]
  connect_bd_net -net sd3_slice_Dout [get_bd_pins params_concat/In5] [get_bd_pins sd3_slice/Dout]
  connect_bd_net -net w1_slice_Dout [get_bd_pins params_concat/In6] [get_bd_pins w1_slice/Dout]
  connect_bd_net -net w2_slice_Dout [get_bd_pins params_concat/In7] [get_bd_pins w2_slice/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mog_params_extraction
proc create_hier_cell_mog_params_extraction { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mog_params_extraction() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 31 -to 0 mean1
  create_bd_pin -dir O -from 31 -to 0 mean2
  create_bd_pin -dir O -from 31 -to 0 mean3
  create_bd_pin -dir I -from 127 -to 0 params
  create_bd_pin -dir O -from 31 -to 0 sd1
  create_bd_pin -dir O -from 31 -to 0 sd2
  create_bd_pin -dir O -from 31 -to 0 sd3
  create_bd_pin -dir O -from 31 -to 0 -type data w1
  create_bd_pin -dir O -from 31 -to 0 -type data w2
  create_bd_pin -dir O -from 31 -to 0 w3

  # Create instance: mean1_selection
  create_hier_cell_mean1_selection $hier_obj mean1_selection

  # Create instance: mean2_selection
  create_hier_cell_mean2_selection $hier_obj mean2_selection

  # Create instance: mean3_selection
  create_hier_cell_mean3_selection $hier_obj mean3_selection

  # Create instance: sd1_selection
  create_hier_cell_sd1_selection $hier_obj sd1_selection

  # Create instance: sd2_selection
  create_hier_cell_sd2_selection $hier_obj sd2_selection

  # Create instance: sd3_selection
  create_hier_cell_sd3_selection $hier_obj sd3_selection

  # Create instance: w1_selection
  create_hier_cell_w1_selection $hier_obj w1_selection

  # Create instance: w2_selection
  create_hier_cell_w2_selection $hier_obj w2_selection

  # Create instance: w3_selection
  create_hier_cell_w3_selection $hier_obj w3_selection

  # Create port connections
  connect_bd_net -net mean1_concat_dout [get_bd_pins mean3] [get_bd_pins mean1_selection/dout]
  connect_bd_net -net mean2_selection_dout [get_bd_pins sd2] [get_bd_pins mean2_selection/dout]
  connect_bd_net -net mean3_selection_dout [get_bd_pins sd1] [get_bd_pins mean3_selection/dout]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins params] [get_bd_pins mean1_selection/Din] [get_bd_pins mean2_selection/Din] [get_bd_pins mean3_selection/Din] [get_bd_pins sd1_selection/Din] [get_bd_pins sd2_selection/Din] [get_bd_pins sd3_selection/Din] [get_bd_pins w1_selection/Din] [get_bd_pins w2_selection/Din]
  connect_bd_net -net sd1_selection_dout [get_bd_pins mean2] [get_bd_pins sd1_selection/dout]
  connect_bd_net -net sd2_selection_dout [get_bd_pins sd3] [get_bd_pins sd2_selection/dout]
  connect_bd_net -net sd3_selection_dout [get_bd_pins mean1] [get_bd_pins sd3_selection/dout]
  connect_bd_net -net w1_selection_Dout1 [get_bd_pins w1_selection/Dout1] [get_bd_pins w3_selection/A]
  connect_bd_net -net w1_selection_dout [get_bd_pins w1] [get_bd_pins w1_selection/dout]
  connect_bd_net -net w2_selection_Dout1 [get_bd_pins w2_selection/Dout1] [get_bd_pins w3_selection/B]
  connect_bd_net -net w2_selection_dout [get_bd_pins w2] [get_bd_pins w2_selection/dout]
  connect_bd_net -net w3_selection_dout [get_bd_pins w3] [get_bd_pins w3_selection/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: mog_async_fifo_rst
proc create_hier_cell_mog_async_fifo_rst { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_mog_async_fifo_rst() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 aresetn
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 tuser

  # Create instance: pipeline_registers_10, and set properties
  set pipeline_registers_10 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_10 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_10

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xup_or2_2, and set properties
  set xup_or2_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_or2:1.0 xup_or2_2 ]

  # Create port connections
  connect_bd_net -net pipeline_registers_10_pipe_out [get_bd_pins aresetn] [get_bd_pins pipeline_registers_10/pipe_out] [get_bd_pins xup_or2_2/b]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk] [get_bd_pins pipeline_registers_10/clk]
  connect_bd_net -net video_overlay_unit_m_axis_mm2s_tuser [get_bd_pins tuser] [get_bd_pins xup_or2_2/a]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins pipeline_registers_10/reset_n] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xup_or2_2_y [get_bd_pins pipeline_registers_10/pipe_in] [get_bd_pins xup_or2_2/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ycbcr2mem_unit
proc create_hier_cell_ycbcr2mem_unit { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ycbcr2mem_unit() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 -type rst axi_resetn
  create_bd_pin -dir I clk
  create_bd_pin -dir I -type clk m_axi_mm2s_aclk
  create_bd_pin -dir I rst
  create_bd_pin -dir I -type clk s_axi_lite_aclk
  create_bd_pin -dir I system_resetn
  create_bd_pin -dir I -from 0 -to 0 window_en
  create_bd_pin -dir I -from 15 -to 0 ycbcr_data

  # Create instance: tkeep_pass, and set properties
  set tkeep_pass [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 tkeep_pass ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {4} \
CONFIG.NUMBER_OF_STAGES {2} \
 ] $tkeep_pass

  # Create instance: xup_and3_0, and set properties
  set xup_and3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_0 ]

  # Create instance: xup_and3_1, and set properties
  set xup_and3_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_1 ]

  # Create instance: xup_and3_2, and set properties
  set xup_and3_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_2 ]

  # Create instance: xup_and4_0, and set properties
  set xup_and4_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and4:1.0 xup_and4_0 ]

  # Create instance: xup_and4_1, and set properties
  set xup_and4_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and4:1.0 xup_and4_1 ]

  # Create instance: ycbcr_aresetn_gen
  create_hier_cell_ycbcr_aresetn_gen $hier_obj ycbcr_aresetn_gen

  # Create instance: ycbcr_data_packing_0, and set properties
  set ycbcr_data_packing_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:data_packing:1.0 ycbcr_data_packing_0 ]
  set_property -dict [ list \
CONFIG.IN_DATA_WIDTH {16} \
CONFIG.OUT_DATA_WIDTH {32} \
 ] $ycbcr_data_packing_0

  # Create instance: ycbcr_data_unpacking_0, and set properties
  set ycbcr_data_unpacking_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:data_unpacking:1.0 ycbcr_data_unpacking_0 ]

  # Create instance: ycbcr_mem_read_async_fifo, and set properties
  set ycbcr_mem_read_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 ycbcr_mem_read_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {509} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {511} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {512} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TKEEP_WIDTH {4} \
CONFIG.TSTRB_WIDTH {4} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $ycbcr_mem_read_async_fifo

  # Create instance: ycbcr_mem_sync_sigs_async_fifo, and set properties
  set ycbcr_mem_sync_sigs_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 ycbcr_mem_sync_sigs_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Common_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {14} \
CONFIG.Empty_Threshold_Assert_Value_rach {14} \
CONFIG.Empty_Threshold_Assert_Value_wach {14} \
CONFIG.Empty_Threshold_Assert_Value_wrch {14} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {15} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {16} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {0} \
CONFIG.TKEEP_WIDTH {0} \
CONFIG.TSTRB_WIDTH {0} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $ycbcr_mem_sync_sigs_async_fifo

  # Create instance: ycbcr_mem_write_async_fifo, and set properties
  set ycbcr_mem_write_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 ycbcr_mem_write_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {509} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {511} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {512} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TKEEP_WIDTH {4} \
CONFIG.TSTRB_WIDTH {4} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $ycbcr_mem_write_async_fifo

  # Create instance: ycbcr_vdma, and set properties
  set ycbcr_vdma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 ycbcr_vdma ]
  set_property -dict [ list \
CONFIG.c_m_axi_mm2s_data_width {32} \
CONFIG.c_m_axi_s2mm_data_width {32} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {4096} \
CONFIG.c_mm2s_max_burst_length {256} \
CONFIG.c_num_fstores {1} \
CONFIG.c_s2mm_genlock_mode {0} \
CONFIG.c_s2mm_linebuffer_depth {4096} \
CONFIG.c_s2mm_max_burst_length {256} \
CONFIG.c_use_s2mm_fsync {0} \
 ] $ycbcr_vdma

  # Create interface connections
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins ycbcr_vdma/S_AXI_LITE]
  connect_bd_intf_net -intf_net ycbcr_mem_write_async_fifo_M_AXIS [get_bd_intf_pins ycbcr_mem_write_async_fifo/M_AXIS] [get_bd_intf_pins ycbcr_vdma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net ycbcr_vdma_M_AXI_MM2S [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins ycbcr_vdma/M_AXI_MM2S]
  connect_bd_intf_net -intf_net ycbcr_vdma_M_AXI_S2MM [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins ycbcr_vdma/M_AXI_S2MM]

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins tkeep_pass/clk] [get_bd_pins ycbcr_aresetn_gen/clk] [get_bd_pins ycbcr_data_packing_0/clk] [get_bd_pins ycbcr_data_unpacking_0/clk] [get_bd_pins ycbcr_mem_read_async_fifo/m_aclk] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_aclk] [get_bd_pins ycbcr_mem_write_async_fifo/s_aclk]
  connect_bd_net -net pipeline_registers_0_pipe_out [get_bd_pins tkeep_pass/reset_n] [get_bd_pins ycbcr_aresetn_gen/aresetn] [get_bd_pins ycbcr_mem_read_async_fifo/s_aresetn] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_aresetn] [get_bd_pins ycbcr_mem_write_async_fifo/s_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins s_axi_lite_aclk] [get_bd_pins ycbcr_vdma/s_axi_lite_aclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins m_axi_mm2s_aclk] [get_bd_pins ycbcr_mem_read_async_fifo/s_aclk] [get_bd_pins ycbcr_mem_write_async_fifo/m_aclk] [get_bd_pins ycbcr_vdma/m_axi_mm2s_aclk] [get_bd_pins ycbcr_vdma/m_axi_s2mm_aclk] [get_bd_pins ycbcr_vdma/m_axis_mm2s_aclk] [get_bd_pins ycbcr_vdma/s_axis_s2mm_aclk]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_resetn] [get_bd_pins ycbcr_vdma/axi_resetn]
  connect_bd_net -net tkeep_pass_pipe_out [get_bd_pins tkeep_pass/pipe_out] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tkeep]
  connect_bd_net -net unpack_enable [get_bd_pins xup_and3_2/y] [get_bd_pins ycbcr_data_unpacking_0/unpack_enable]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins rst] [get_bd_pins ycbcr_data_packing_0/rst] [get_bd_pins ycbcr_data_unpacking_0/rst]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins system_resetn] [get_bd_pins xup_and3_0/b] [get_bd_pins xup_and3_1/b] [get_bd_pins xup_and3_2/b] [get_bd_pins xup_and4_0/b] [get_bd_pins xup_and4_1/b]
  connect_bd_net -net window_en [get_bd_pins window_en] [get_bd_pins xup_and3_2/a] [get_bd_pins xup_and4_0/d] [get_bd_pins xup_and4_1/d] [get_bd_pins ycbcr_data_packing_0/packing_en] [get_bd_pins ycbcr_data_unpacking_0/window_en]
  connect_bd_net -net xup_and3_0_y [get_bd_pins xup_and3_0/y] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tvalid]
  connect_bd_net -net xup_and3_1_y [get_bd_pins xup_and3_1/y] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/m_axis_tready]
  connect_bd_net -net xup_and4_0_y [get_bd_pins xup_and4_0/y] [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tready]
  connect_bd_net -net xup_and4_1_y [get_bd_pins xup_and4_1/y] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_axis_tvalid]
  connect_bd_net -net ycbcr_data [get_bd_pins ycbcr_data] [get_bd_pins ycbcr_data_packing_0/data_to_pack]
  connect_bd_net -net ycbcr_data_packing_0_write_data [get_bd_pins ycbcr_data_packing_0/write_data] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tdata]
  connect_bd_net -net ycbcr_data_packing_0_write_data_valid [get_bd_pins xup_and3_0/c] [get_bd_pins xup_and3_1/c] [get_bd_pins ycbcr_data_packing_0/write_data_valid]
  connect_bd_net -net ycbcr_data_unpacking_0_ready_to_unpack [get_bd_pins xup_and4_0/a] [get_bd_pins xup_and4_1/a] [get_bd_pins ycbcr_data_unpacking_0/ready_to_unpack]
  connect_bd_net -net ycbcr_mem_read_async_fifo_m_axis_tdata [get_bd_pins ycbcr_data_unpacking_0/in_data] [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tdata]
  connect_bd_net -net ycbcr_mem_read_async_fifo_m_axis_tkeep [get_bd_pins tkeep_pass/pipe_in] [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tkeep]
  connect_bd_net -net ycbcr_mem_read_async_fifo_m_axis_tlast [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tlast] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_axis_tlast]
  connect_bd_net -net ycbcr_mem_read_async_fifo_m_axis_tuser [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tuser] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_axis_tuser]
  connect_bd_net -net ycbcr_mem_read_async_fifo_m_axis_tvalid [get_bd_pins xup_and3_2/c] [get_bd_pins xup_and4_1/c] [get_bd_pins ycbcr_mem_read_async_fifo/m_axis_tvalid]
  connect_bd_net -net ycbcr_mem_read_async_fifo_s_axis_tready [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tready] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tready]
  connect_bd_net -net ycbcr_mem_sync_sigs_async_fifo_m_axis_tlast [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/m_axis_tlast] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tlast]
  connect_bd_net -net ycbcr_mem_sync_sigs_async_fifo_m_axis_tuser [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/m_axis_tuser] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tuser]
  connect_bd_net -net ycbcr_mem_sync_sigs_async_fifo_m_axis_tvalid [get_bd_pins xup_and3_0/a] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/m_axis_tvalid]
  connect_bd_net -net ycbcr_mem_sync_sigs_async_fifo_s_axis_tready [get_bd_pins xup_and4_0/c] [get_bd_pins ycbcr_mem_sync_sigs_async_fifo/s_axis_tready]
  connect_bd_net -net ycbcr_mem_write_async_fifo_s_axis_tready [get_bd_pins xup_and3_1/a] [get_bd_pins ycbcr_mem_write_async_fifo/s_axis_tready]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tdata [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tdata] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tdata]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tkeep [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tkeep] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tkeep]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tlast [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tlast] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tlast]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tuser [get_bd_pins ycbcr_aresetn_gen/tuser] [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tuser] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tuser]
  connect_bd_net -net ycbcr_vdma_m_axis_mm2s_tvalid [get_bd_pins ycbcr_mem_read_async_fifo/s_axis_tvalid] [get_bd_pins ycbcr_vdma/m_axis_mm2s_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ycbcr2gray
proc create_hier_cell_ycbcr2gray { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ycbcr2gray() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 15 -to 0 Din
  create_bd_pin -dir O -from 7 -to 0 Dout

  # Create instance: cbcr_gray, and set properties
  set cbcr_gray [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 cbcr_gray ]
  set_property -dict [ list \
CONFIG.CONST_VAL {128} \
CONFIG.CONST_WIDTH {8} \
 ] $cbcr_gray

  # Create instance: concatenation, and set properties
  set concatenation [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concatenation ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {8} \
CONFIG.IN1_WIDTH {8} \
 ] $concatenation

  # Create instance: y_sel, and set properties
  set y_sel [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 y_sel ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {8} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {8} \
 ] $y_sel

  # Create port connections
  connect_bd_net -net cbcr_gray_dout [get_bd_pins cbcr_gray/dout] [get_bd_pins concatenation/In0]
  connect_bd_net -net swap_dout [get_bd_pins Din] [get_bd_pins y_sel/Din]
  connect_bd_net -net y_sel_Dout [get_bd_pins Dout] [get_bd_pins concatenation/In1] [get_bd_pins y_sel/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: video_overlay_unit
proc create_hier_cell_video_overlay_unit { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_video_overlay_unit() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk axi_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst axi_resetn
  create_bd_pin -dir I -from 7 -to 0 grayscale_pixel_in_orig
  create_bd_pin -dir I hdmi_clk
  create_bd_pin -dir I -from 0 -to 0 input_video_hblank
  create_bd_pin -dir I -from 0 -to 0 input_video_vblank
  create_bd_pin -dir I -from 0 -to 0 is_fg
  create_bd_pin -dir O -from 31 -to 0 m_axis_tdata
  create_bd_pin -dir O -type intr mm2s_introut
  create_bd_pin -dir I -from 0 -to 0 mog_window_enable
  create_bd_pin -dir I -from 3 -to 0 output_source
  create_bd_pin -dir O ready_to_unpack
  create_bd_pin -dir O -type intr s2mm_introut
  create_bd_pin -dir I -type clk s_axi_lite_aclk
  create_bd_pin -dir I system_reset
  create_bd_pin -dir I system_reset_n
  create_bd_pin -dir O unpack_enable
  create_bd_pin -dir I -from 15 -to 0 video_color_data_smth
  create_bd_pin -dir O -from 15 -to 0 video_data_out
  create_bd_pin -dir I -from 7 -to 0 video_grayscale_data_smth
  create_bd_pin -dir O -from 0 -to 0 video_overlay_set
  create_bd_pin -dir O window_enable
  create_bd_pin -dir I -from 15 -to 0 ycbcr_data_in_orig

  # Create instance: pipeline_registers_0, and set properties
  set pipeline_registers_0 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_0 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {8} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_0

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {8} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_1

  # Create instance: pipeline_registers_2, and set properties
  set pipeline_registers_2 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_2 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_2

  # Create instance: pipeline_registers_3, and set properties
  set pipeline_registers_3 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_3 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_3

  # Create instance: pipeline_registers_4, and set properties
  set pipeline_registers_4 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_4 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {16} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_4

  # Create instance: pipeline_registers_5, and set properties
  set pipeline_registers_5 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_5 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {4} \
CONFIG.NUMBER_OF_STAGES {32} \
 ] $pipeline_registers_5

  # Create instance: pipeline_registers_6, and set properties
  set pipeline_registers_6 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_6 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {16} \
CONFIG.NUMBER_OF_STAGES {3} \
 ] $pipeline_registers_6

  # Create instance: video_overlay_0, and set properties
  set video_overlay_0 [ create_bd_cell -type ip -vlnv www.northeastern.edu:user:video_overlay:1.0 video_overlay_0 ]

  # Create instance: vovraly_rd_async_fifo, and set properties
  set vovraly_rd_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 vovraly_rd_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {1021} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {1024} \
CONFIG.Overflow_Flag_AXI {false} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TKEEP_WIDTH {4} \
CONFIG.TSTRB_WIDTH {4} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {false} \
 ] $vovraly_rd_async_fifo

  # Create instance: vovraly_wr_async_fifo, and set properties
  set vovraly_wr_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 vovraly_wr_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {509} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {511} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {512} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TKEEP_WIDTH {4} \
CONFIG.TSTRB_WIDTH {4} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $vovraly_wr_async_fifo

  # Create instance: vovrlay_data_packing_0, and set properties
  set vovrlay_data_packing_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:data_packing:1.0 vovrlay_data_packing_0 ]

  # Create instance: vovrlay_woi_det, and set properties
  set vovrlay_woi_det [ create_bd_cell -type ip -vlnv NEU-ESL:user:axi_window_of_interest_detection:1.0 vovrlay_woi_det ]

  # Create instance: vovrly_async_fifo_rst
  create_hier_cell_vovrly_async_fifo_rst $hier_obj vovrly_async_fifo_rst

  # Create instance: vovrly_data_unpacking0, and set properties
  set vovrly_data_unpacking0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:data_unpacking:1.0 vovrly_data_unpacking0 ]
  set_property -dict [ list \
CONFIG.OUT_DATA_WIDTH {1} \
 ] $vovrly_data_unpacking0

  # Create instance: vovrly_sync_sigs_pass, and set properties
  set vovrly_sync_sigs_pass [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 vovrly_sync_sigs_pass ]
  set_property -dict [ list \
CONFIG.Empty_Threshold_Assert_Value_axis {62} \
CONFIG.Empty_Threshold_Assert_Value_rach {14} \
CONFIG.Empty_Threshold_Assert_Value_wach {14} \
CONFIG.Empty_Threshold_Assert_Value_wrch {14} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {63} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {64} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {0} \
CONFIG.TKEEP_WIDTH {0} \
CONFIG.TSTRB_WIDTH {0} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $vovrly_sync_sigs_pass

  # Create instance: vovrly_vdma, and set properties
  set vovrly_vdma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 vovrly_vdma ]
  set_property -dict [ list \
CONFIG.c_include_mm2s_dre {0} \
CONFIG.c_include_s2mm {1} \
CONFIG.c_m_axi_mm2s_data_width {32} \
CONFIG.c_m_axi_s2mm_data_width {32} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {2048} \
CONFIG.c_mm2s_max_burst_length {16} \
CONFIG.c_num_fstores {2} \
CONFIG.c_s2mm_genlock_mode {0} \
CONFIG.c_s2mm_linebuffer_depth {2048} \
CONFIG.c_s2mm_max_burst_length {16} \
CONFIG.c_use_s2mm_fsync {0} \
 ] $vovrly_vdma

  # Create instance: xup_and3_1, and set properties
  set xup_and3_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_1 ]

  # Create instance: xup_and3_2, and set properties
  set xup_and3_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_2 ]

  # Create instance: xup_and3_3, and set properties
  set xup_and3_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_3 ]

  # Create instance: xup_and4_0, and set properties
  set xup_and4_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and4:1.0 xup_and4_0 ]

  # Create instance: xup_and4_1, and set properties
  set xup_and4_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and4:1.0 xup_and4_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins vovrly_vdma/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins vovrly_vdma/M_AXI_MM2S]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins vovrly_vdma/M_AXI_S2MM]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S_AXI] [get_bd_intf_pins vovrlay_woi_det/S_AXI]
  connect_bd_intf_net -intf_net vovraly_wr_async_fifo_M_AXIS [get_bd_intf_pins vovraly_wr_async_fifo/M_AXIS] [get_bd_intf_pins vovrly_vdma/S_AXIS_S2MM]

  # Create port connections
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins vovrlay_woi_det/s_axi_aresetn] [get_bd_pins vovrly_vdma/axi_resetn]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tdata [get_bd_pins vovraly_rd_async_fifo/s_axis_tdata] [get_bd_pins vovrly_vdma/m_axis_mm2s_tdata]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tkeep [get_bd_pins vovraly_rd_async_fifo/s_axis_tkeep] [get_bd_pins vovrly_vdma/m_axis_mm2s_tkeep]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tuser [get_bd_pins vovraly_rd_async_fifo/s_axis_tuser] [get_bd_pins vovrly_async_fifo_rst/tuser] [get_bd_pins vovrly_vdma/m_axis_mm2s_tuser]
  connect_bd_net -net axi_vdma_0_m_axis_mm2s_tvalid [get_bd_pins vovraly_rd_async_fifo/s_axis_tvalid] [get_bd_pins vovrly_vdma/m_axis_mm2s_tvalid]
  connect_bd_net -net clk_1 [get_bd_pins hdmi_clk] [get_bd_pins pipeline_registers_0/clk] [get_bd_pins pipeline_registers_1/clk] [get_bd_pins pipeline_registers_2/clk] [get_bd_pins pipeline_registers_3/clk] [get_bd_pins pipeline_registers_4/clk] [get_bd_pins pipeline_registers_5/clk] [get_bd_pins pipeline_registers_6/clk] [get_bd_pins video_overlay_0/clk] [get_bd_pins vovraly_rd_async_fifo/m_aclk] [get_bd_pins vovraly_wr_async_fifo/s_aclk] [get_bd_pins vovrlay_data_packing_0/clk] [get_bd_pins vovrlay_woi_det/clk] [get_bd_pins vovrly_data_unpacking0/clk] [get_bd_pins vovrly_sync_sigs_pass/s_aclk]
  connect_bd_net -net data_packing_0_write_data [get_bd_pins vovraly_wr_async_fifo/s_axis_tdata] [get_bd_pins vovrlay_data_packing_0/write_data]
  connect_bd_net -net data_packing_0_write_data_valid [get_bd_pins vovrlay_data_packing_0/write_data_valid] [get_bd_pins xup_and3_2/a] [get_bd_pins xup_and3_3/a]
  connect_bd_net -net data_unpacking_0_ready_to_unpack [get_bd_pins ready_to_unpack] [get_bd_pins vovrly_data_unpacking0/ready_to_unpack] [get_bd_pins xup_and4_0/a] [get_bd_pins xup_and4_1/a]
  connect_bd_net -net data_unpacking_0_video_overlay_set [get_bd_pins video_overlay_set] [get_bd_pins video_overlay_0/vovrlay_is_fg] [get_bd_pins vovrly_data_unpacking0/out_data]
  connect_bd_net -net fifo_generator_0_m_axis_tdata [get_bd_pins m_axis_tdata] [get_bd_pins vovraly_rd_async_fifo/m_axis_tdata] [get_bd_pins vovrly_data_unpacking0/in_data]
  connect_bd_net -net image_smoothing_full_version_0_data_out [get_bd_pins grayscale_pixel_in_orig] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net image_smoothing_full_version_0_win_enable_out [get_bd_pins mog_window_enable] [get_bd_pins pipeline_registers_2/pipe_in]
  connect_bd_net -net input_video_hblank_1 [get_bd_pins input_video_hblank] [get_bd_pins vovrlay_woi_det/input_video_hblank]
  connect_bd_net -net input_video_vblank_1 [get_bd_pins input_video_vblank] [get_bd_pins vovrlay_woi_det/input_video_vblank]
  connect_bd_net -net output_source_1 [get_bd_pins output_source] [get_bd_pins video_overlay_0/output_source]
  connect_bd_net -net pipe_in2_1 [get_bd_pins is_fg] [get_bd_pins pipeline_registers_3/pipe_in]
  connect_bd_net -net pipe_in_1 [get_bd_pins ycbcr_data_in_orig] [get_bd_pins pipeline_registers_6/pipe_in]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins pipeline_registers_1/pipe_out] [get_bd_pins video_overlay_0/video_grayscale_data]
  connect_bd_net -net pipeline_registers_2_pipe_out [get_bd_pins pipeline_registers_2/pipe_out] [get_bd_pins video_overlay_0/mog_window_enable]
  connect_bd_net -net pipeline_registers_3_pipe_out [get_bd_pins pipeline_registers_3/pipe_out] [get_bd_pins video_overlay_0/mog_is_fg] [get_bd_pins vovrlay_data_packing_0/data_to_pack]
  connect_bd_net -net pipeline_registers_5_pipe_out [get_bd_pins pipeline_registers_5/pipe_out] [get_bd_pins vovraly_wr_async_fifo/s_axis_tkeep]
  connect_bd_net -net pipeline_registers_6_pipe_out [get_bd_pins pipeline_registers_6/pipe_out] [get_bd_pins video_overlay_0/video_color_data]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins s_axi_lite_aclk] [get_bd_pins vovrlay_woi_det/s_axi_aclk] [get_bd_pins vovrly_vdma/s_axi_lite_aclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins axi_clk] [get_bd_pins vovraly_rd_async_fifo/s_aclk] [get_bd_pins vovraly_wr_async_fifo/m_aclk] [get_bd_pins vovrly_async_fifo_rst/clk] [get_bd_pins vovrly_vdma/m_axi_mm2s_aclk] [get_bd_pins vovrly_vdma/m_axi_s2mm_aclk] [get_bd_pins vovrly_vdma/m_axis_mm2s_aclk] [get_bd_pins vovrly_vdma/s_axis_s2mm_aclk]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins system_reset] [get_bd_pins video_overlay_0/rst] [get_bd_pins vovrlay_data_packing_0/rst] [get_bd_pins vovrlay_woi_det/rst] [get_bd_pins vovrly_data_unpacking0/rst]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins system_reset_n] [get_bd_pins pipeline_registers_1/reset_n] [get_bd_pins pipeline_registers_2/reset_n] [get_bd_pins pipeline_registers_3/reset_n] [get_bd_pins pipeline_registers_6/reset_n] [get_bd_pins xup_and3_1/b] [get_bd_pins xup_and3_2/c] [get_bd_pins xup_and3_3/c] [get_bd_pins xup_and4_0/d] [get_bd_pins xup_and4_1/d]
  connect_bd_net -net video_color_data_smth_1 [get_bd_pins video_color_data_smth] [get_bd_pins pipeline_registers_4/pipe_in]
  connect_bd_net -net video_grayscale_data_smth_1 [get_bd_pins video_grayscale_data_smth] [get_bd_pins pipeline_registers_0/pipe_in]
  connect_bd_net -net video_overlay_0_video_data_out [get_bd_pins video_data_out] [get_bd_pins video_overlay_0/video_data_out]
  connect_bd_net -net vovraly_rd_async_fifo_m_axis_tkeep [get_bd_pins pipeline_registers_5/pipe_in] [get_bd_pins vovraly_rd_async_fifo/m_axis_tkeep]
  connect_bd_net -net vovraly_rd_async_fifo_m_axis_tlast [get_bd_pins vovraly_rd_async_fifo/m_axis_tlast] [get_bd_pins vovrly_sync_sigs_pass/s_axis_tlast]
  connect_bd_net -net vovraly_rd_async_fifo_m_axis_tuser [get_bd_pins vovraly_rd_async_fifo/m_axis_tuser] [get_bd_pins vovrly_sync_sigs_pass/s_axis_tuser]
  connect_bd_net -net vovraly_rd_async_fifo_m_axis_tvalid [get_bd_pins vovraly_rd_async_fifo/m_axis_tvalid] [get_bd_pins xup_and3_1/c] [get_bd_pins xup_and4_0/b]
  connect_bd_net -net vovraly_rd_async_fifo_s_axis_tready [get_bd_pins vovraly_rd_async_fifo/s_axis_tready] [get_bd_pins vovrly_vdma/m_axis_mm2s_tready]
  connect_bd_net -net vovraly_wr_async_fifo_s_axis_tready [get_bd_pins vovraly_wr_async_fifo/s_axis_tready] [get_bd_pins xup_and3_2/b]
  connect_bd_net -net vovrlay_woi_det_window_enable [get_bd_pins window_enable] [get_bd_pins video_overlay_0/video_overlay_window_enable] [get_bd_pins vovrlay_data_packing_0/packing_en] [get_bd_pins vovrlay_woi_det/window_enable] [get_bd_pins vovrly_data_unpacking0/window_en] [get_bd_pins xup_and3_1/a] [get_bd_pins xup_and4_0/c] [get_bd_pins xup_and4_1/c]
  connect_bd_net -net vovrly_async_fifo_rst_aresetn [get_bd_pins pipeline_registers_0/reset_n] [get_bd_pins pipeline_registers_4/reset_n] [get_bd_pins pipeline_registers_5/reset_n] [get_bd_pins vovraly_rd_async_fifo/s_aresetn] [get_bd_pins vovraly_wr_async_fifo/s_aresetn] [get_bd_pins vovrly_async_fifo_rst/aresetn] [get_bd_pins vovrly_sync_sigs_pass/s_aresetn]
  connect_bd_net -net vovrly_sync_sigs_pass_m_axis_tlast [get_bd_pins vovraly_wr_async_fifo/s_axis_tlast] [get_bd_pins vovrly_sync_sigs_pass/m_axis_tlast]
  connect_bd_net -net vovrly_sync_sigs_pass_m_axis_tuser [get_bd_pins vovraly_wr_async_fifo/s_axis_tuser] [get_bd_pins vovrly_sync_sigs_pass/m_axis_tuser]
  connect_bd_net -net vovrly_sync_sigs_pass_m_axis_tvalid [get_bd_pins vovrly_sync_sigs_pass/m_axis_tvalid] [get_bd_pins xup_and3_3/b]
  connect_bd_net -net vovrly_sync_sigs_pass_s_axis_tready [get_bd_pins vovrly_sync_sigs_pass/s_axis_tready] [get_bd_pins xup_and4_1/b]
  connect_bd_net -net vovrly_vdma_m_axis_mm2s_tlast [get_bd_pins vovraly_rd_async_fifo/s_axis_tlast] [get_bd_pins vovrly_vdma/m_axis_mm2s_tlast]
  connect_bd_net -net vovrly_vdma_mm2s_introut [get_bd_pins mm2s_introut] [get_bd_pins vovrly_vdma/mm2s_introut]
  connect_bd_net -net vovrly_vdma_s2mm_introut [get_bd_pins s2mm_introut] [get_bd_pins vovrly_vdma/s2mm_introut]
  connect_bd_net -net xup_and3_0_y_1 [get_bd_pins vovrly_sync_sigs_pass/m_axis_tready] [get_bd_pins xup_and3_2/y]
  connect_bd_net -net xup_and3_1_y [get_bd_pins unpack_enable] [get_bd_pins vovrly_data_unpacking0/unpack_enable] [get_bd_pins xup_and3_1/y]
  connect_bd_net -net xup_and3_1_y_1 [get_bd_pins vovraly_wr_async_fifo/s_axis_tvalid] [get_bd_pins xup_and3_3/y]
  connect_bd_net -net xup_and4_0_y [get_bd_pins vovrly_sync_sigs_pass/s_axis_tvalid] [get_bd_pins xup_and4_0/y]
  connect_bd_net -net xup_and4_1_y [get_bd_pins vovraly_rd_async_fifo/m_axis_tready] [get_bd_pins xup_and4_1/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: smth_pass_sel
proc create_hier_cell_smth_pass_sel { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_smth_pass_sel() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 de_after
  create_bd_pin -dir I -from 0 -to 0 de_before
  create_bd_pin -dir O -from 0 -to 0 de_smth_sel
  create_bd_pin -dir I -from 0 -to 0 hblank_after
  create_bd_pin -dir I -from 0 -to 0 hblank_before
  create_bd_pin -dir O -from 0 -to 0 hblank_smth_sel
  create_bd_pin -dir I sel
  create_bd_pin -dir I -from 0 -to 0 spdif_after
  create_bd_pin -dir I -from 0 -to 0 spdif_before
  create_bd_pin -dir O -from 0 -to 0 spdif_smth_sel
  create_bd_pin -dir I -from 0 -to 0 vblank_after
  create_bd_pin -dir I -from 0 -to 0 vblank_before
  create_bd_pin -dir O -from 0 -to 0 vblank_smth_sel
  create_bd_pin -dir I -from 0 -to 0 window_en_after
  create_bd_pin -dir I -from 0 -to 0 window_en_before
  create_bd_pin -dir O -from 0 -to 0 windown_en_smth_sel
  create_bd_pin -dir I -from 15 -to 0 ycbcr_after
  create_bd_pin -dir I -from 15 -to 0 ycbcr_before
  create_bd_pin -dir O -from 15 -to 0 ycbcr_smth_sel

  # Create instance: after_smth, and set properties
  set after_smth [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 after_smth ]
  set_property -dict [ list \
CONFIG.IN5_WIDTH {16} \
CONFIG.NUM_PORTS {6} \
 ] $after_smth

  # Create instance: before_smth, and set properties
  set before_smth [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 before_smth ]
  set_property -dict [ list \
CONFIG.IN5_WIDTH {16} \
CONFIG.NUM_PORTS {6} \
 ] $before_smth

  # Create instance: smth_pass_over, and set properties
  set smth_pass_over [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_2_to_1_mux_vector:1.0 smth_pass_over ]
  set_property -dict [ list \
CONFIG.DELAY {0} \
CONFIG.SIZE {21} \
 ] $smth_pass_over

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_WIDTH {21} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {1} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {21} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {21} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {3} \
CONFIG.DIN_WIDTH {21} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {4} \
CONFIG.DIN_TO {4} \
CONFIG.DIN_WIDTH {21} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {20} \
CONFIG.DIN_TO {5} \
CONFIG.DIN_WIDTH {21} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_5

  # Create port connections
  connect_bd_net -net In2_1 [get_bd_pins de_before] [get_bd_pins before_smth/In0]
  connect_bd_net -net In3_1 [get_bd_pins spdif_before] [get_bd_pins before_smth/In3]
  connect_bd_net -net image_smoothing_1_Hblank_out [get_bd_pins hblank_after] [get_bd_pins after_smth/In1]
  connect_bd_net -net image_smoothing_1_Vblank_out [get_bd_pins vblank_after] [get_bd_pins after_smth/In2]
  connect_bd_net -net image_smoothing_1_data_out [get_bd_pins ycbcr_after] [get_bd_pins after_smth/In5]
  connect_bd_net -net image_smoothing_1_de_out [get_bd_pins de_after] [get_bd_pins after_smth/In0]
  connect_bd_net -net image_smoothing_1_spdif_out [get_bd_pins spdif_after] [get_bd_pins after_smth/In3]
  connect_bd_net -net image_smoothing_1_win_enable_out [get_bd_pins window_en_after] [get_bd_pins after_smth/In4]
  connect_bd_net -net image_smoothing_full_version_0_Hblank_out [get_bd_pins hblank_before] [get_bd_pins before_smth/In1]
  connect_bd_net -net image_smoothing_full_version_0_Vblank_out [get_bd_pins vblank_before] [get_bd_pins before_smth/In2]
  connect_bd_net -net mog_woi_det_window_enable [get_bd_pins window_en_before] [get_bd_pins before_smth/In4]
  connect_bd_net -net pipeline_registers_1_pipe_out1 [get_bd_pins ycbcr_before] [get_bd_pins before_smth/In5]
  connect_bd_net -net sel_1 [get_bd_pins sel] [get_bd_pins smth_pass_over/sel]
  connect_bd_net -net smth_pass_over_y [get_bd_pins smth_pass_over/y] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins before_smth/dout] [get_bd_pins smth_pass_over/a]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins after_smth/dout] [get_bd_pins smth_pass_over/b]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins de_smth_sel] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins hblank_smth_sel] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins vblank_smth_sel] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins spdif_smth_sel] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins windown_en_smth_sel] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins ycbcr_smth_sel] [get_bd_pins xlslice_5/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: morph_pass_sel
proc create_hier_cell_morph_pass_sel { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_morph_pass_sel() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 de_after
  create_bd_pin -dir I -from 0 -to 0 de_before
  create_bd_pin -dir O -from 0 -to 0 de_morph_sel
  create_bd_pin -dir I -from 0 -to 0 fg_after
  create_bd_pin -dir I -from 0 -to 0 fg_before
  create_bd_pin -dir O -from 0 -to 0 fg_morph_sel
  create_bd_pin -dir I -from 0 -to 0 hblank_after
  create_bd_pin -dir I -from 0 -to 0 hblank_before
  create_bd_pin -dir O -from 0 -to 0 hblank_morph_sel
  create_bd_pin -dir I sel
  create_bd_pin -dir I -from 0 -to 0 spdif_after
  create_bd_pin -dir I -from 0 -to 0 spdif_before
  create_bd_pin -dir O -from 0 -to 0 spdif_morph_sel
  create_bd_pin -dir I -from 0 -to 0 vblank_after
  create_bd_pin -dir I -from 0 -to 0 vblank_before
  create_bd_pin -dir O -from 0 -to 0 vblank_morph_sel
  create_bd_pin -dir I -from 0 -to 0 window_en_after
  create_bd_pin -dir I -from 0 -to 0 window_en_before
  create_bd_pin -dir O -from 0 -to 0 windown_en_morph_sel

  # Create instance: after_morph, and set properties
  set after_morph [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 after_morph ]
  set_property -dict [ list \
CONFIG.IN5_WIDTH {1} \
CONFIG.NUM_PORTS {6} \
 ] $after_morph

  # Create instance: before_morph, and set properties
  set before_morph [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 before_morph ]
  set_property -dict [ list \
CONFIG.IN5_WIDTH {1} \
CONFIG.NUM_PORTS {6} \
 ] $before_morph

  # Create instance: morph_pass_over, and set properties
  set morph_pass_over [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_2_to_1_mux_vector:1.0 morph_pass_over ]
  set_property -dict [ list \
CONFIG.DELAY {0} \
CONFIG.SIZE {6} \
 ] $morph_pass_over

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {1} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {3} \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {4} \
CONFIG.DIN_TO {4} \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {5} \
CONFIG.DIN_TO {5} \
CONFIG.DIN_WIDTH {6} \
 ] $xlslice_5

  # Create port connections
  connect_bd_net -net In2_1 [get_bd_pins de_before] [get_bd_pins before_morph/In0]
  connect_bd_net -net In3_1 [get_bd_pins spdif_before] [get_bd_pins before_morph/In3]
  connect_bd_net -net In5_1 [get_bd_pins fg_before] [get_bd_pins before_morph/In5]
  connect_bd_net -net In5_2 [get_bd_pins fg_after] [get_bd_pins after_morph/In5]
  connect_bd_net -net image_smoothing_1_Hblank_out [get_bd_pins hblank_after] [get_bd_pins after_morph/In1]
  connect_bd_net -net image_smoothing_1_Vblank_out [get_bd_pins vblank_after] [get_bd_pins after_morph/In2]
  connect_bd_net -net image_smoothing_1_de_out [get_bd_pins de_after] [get_bd_pins after_morph/In0]
  connect_bd_net -net image_smoothing_1_spdif_out [get_bd_pins spdif_after] [get_bd_pins after_morph/In3]
  connect_bd_net -net image_smoothing_1_win_enable_out [get_bd_pins window_en_after] [get_bd_pins after_morph/In4]
  connect_bd_net -net image_smoothing_full_version_0_Hblank_out [get_bd_pins hblank_before] [get_bd_pins before_morph/In1]
  connect_bd_net -net image_smoothing_full_version_0_Vblank_out [get_bd_pins vblank_before] [get_bd_pins before_morph/In2]
  connect_bd_net -net mog_woi_det_window_enable [get_bd_pins window_en_before] [get_bd_pins before_morph/In4]
  connect_bd_net -net sel_1 [get_bd_pins sel] [get_bd_pins morph_pass_over/sel]
  connect_bd_net -net smth_pass_over_y [get_bd_pins morph_pass_over/y] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins before_morph/dout] [get_bd_pins morph_pass_over/a]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins after_morph/dout] [get_bd_pins morph_pass_over/b]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins de_morph_sel] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins hblank_morph_sel] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins vblank_morph_sel] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins spdif_morph_sel] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins windown_en_morph_sel] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins fg_morph_sel] [get_bd_pins xlslice_5/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: hdmi_sync_signals_passing
proc create_hier_cell_hdmi_sync_signals_passing { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_hdmi_sync_signals_passing() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir O -from 0 -to 0 de
  create_bd_pin -dir I -from 0 -to 0 de_in
  create_bd_pin -dir O -from 0 -to 0 hblank
  create_bd_pin -dir I -from 0 -to 0 hblank_in
  create_bd_pin -dir I reset_n
  create_bd_pin -dir O -from 0 -to 0 spdif
  create_bd_pin -dir I -from 0 -to 0 spdif_in
  create_bd_pin -dir O -from 0 -to 0 vblank
  create_bd_pin -dir I -from 0 -to 0 vblank_in

  # Create instance: de_pass, and set properties
  set de_pass [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 de_pass ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {80} \
 ] $de_pass

  # Create instance: hblank, and set properties
  set hblank [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 hblank ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {80} \
 ] $hblank

  # Create instance: spdif, and set properties
  set spdif [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 spdif ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {80} \
 ] $spdif

  # Create instance: vblank, and set properties
  set vblank [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 vblank ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {80} \
 ] $vblank

  # Create port connections
  connect_bd_net -net In2_2 [get_bd_pins de_in] [get_bd_pins de_pass/pipe_in]
  connect_bd_net -net image_smoothing_full_version_0_Hblank_out1 [get_bd_pins hblank_in] [get_bd_pins hblank/pipe_in]
  connect_bd_net -net image_smoothing_full_version_0_Vblank_out1 [get_bd_pins vblank_in] [get_bd_pins vblank/pipe_in]
  connect_bd_net -net image_smoothing_full_version_0_spdif_out [get_bd_pins spdif_in] [get_bd_pins spdif/pipe_in]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins de] [get_bd_pins de_pass/pipe_out]
  connect_bd_net -net pipeline_registers_2_pipe_out [get_bd_pins vblank] [get_bd_pins vblank/pipe_out]
  connect_bd_net -net pipeline_registers_4_pipe_out [get_bd_pins hblank] [get_bd_pins hblank/pipe_out]
  connect_bd_net -net pipeline_registers_5_pipe_out [get_bd_pins spdif] [get_bd_pins spdif/pipe_out]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins clk] [get_bd_pins de_pass/clk] [get_bd_pins hblank/clk] [get_bd_pins spdif/clk] [get_bd_pins vblank/clk]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins reset_n] [get_bd_pins de_pass/reset_n] [get_bd_pins hblank/reset_n] [get_bd_pins spdif/reset_n] [get_bd_pins vblank/reset_n]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: four_signal_registering2
proc create_hier_cell_four_signal_registering2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_four_signal_registering2() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 de
  create_bd_pin -dir O -from 0 -to 0 de_out
  create_bd_pin -dir I -from 0 -to 0 hblank
  create_bd_pin -dir O -from 0 -to 0 hblank_out
  create_bd_pin -dir I reset_n
  create_bd_pin -dir I -from 0 -to 0 spdif
  create_bd_pin -dir O -from 0 -to 0 spdif_out
  create_bd_pin -dir I -from 0 -to 0 vblank
  create_bd_pin -dir O -from 0 -to 0 vblank_out

  # Create instance: de_out, and set properties
  set de_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 de_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {4} \
 ] $de_out

  # Create instance: hblank_out, and set properties
  set hblank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 hblank_out ]
  set_property -dict [ list \
CONFIG.DIN_WIDTH {4} \
 ] $hblank_out

  # Create instance: hdmi_sync_pass, and set properties
  set hdmi_sync_pass [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 hdmi_sync_pass ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $hdmi_sync_pass

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {4} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_1

  # Create instance: spdif_out, and set properties
  set spdif_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 spdif_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {3} \
CONFIG.DIN_WIDTH {4} \
 ] $spdif_out

  # Create instance: vlbank_out, and set properties
  set vlbank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 vlbank_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {1} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {4} \
 ] $vlbank_out

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins pipeline_registers_1/clk]
  connect_bd_net -net de_out_Dout [get_bd_pins de_out] [get_bd_pins de_out/Dout]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_audio_spdif [get_bd_pins spdif] [get_bd_pins hdmi_sync_pass/In3]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_de [get_bd_pins de] [get_bd_pins hdmi_sync_pass/In2]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_hblank [get_bd_pins hblank] [get_bd_pins hdmi_sync_pass/In0]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_vblank [get_bd_pins vblank] [get_bd_pins hdmi_sync_pass/In1]
  connect_bd_net -net hblank_out_Dout [get_bd_pins hblank_out] [get_bd_pins hblank_out/Dout]
  connect_bd_net -net hdmi_sync_pass_dout [get_bd_pins hdmi_sync_pass/dout] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins de_out/Din] [get_bd_pins hblank_out/Din] [get_bd_pins pipeline_registers_1/pipe_out] [get_bd_pins spdif_out/Din] [get_bd_pins vlbank_out/Din]
  connect_bd_net -net spdif_out_Dout [get_bd_pins spdif_out] [get_bd_pins spdif_out/Dout]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins reset_n] [get_bd_pins pipeline_registers_1/reset_n]
  connect_bd_net -net vlbank_out_Dout [get_bd_pins vblank_out] [get_bd_pins vlbank_out/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: four_signal_registering1
proc create_hier_cell_four_signal_registering1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_four_signal_registering1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 Dout
  create_bd_pin -dir O -from 0 -to 0 Dout1
  create_bd_pin -dir O -from 0 -to 0 Dout2
  create_bd_pin -dir O -from 0 -to 0 Dout3
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 de
  create_bd_pin -dir I -from 0 -to 0 hblank
  create_bd_pin -dir I reset_n
  create_bd_pin -dir I -from 0 -to 0 spdif
  create_bd_pin -dir I -from 0 -to 0 vblank

  # Create instance: de_out, and set properties
  set de_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 de_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {4} \
 ] $de_out

  # Create instance: hblank_out, and set properties
  set hblank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 hblank_out ]
  set_property -dict [ list \
CONFIG.DIN_WIDTH {4} \
 ] $hblank_out

  # Create instance: hdmi_sync_pass, and set properties
  set hdmi_sync_pass [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 hdmi_sync_pass ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $hdmi_sync_pass

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {4} \
CONFIG.NUMBER_OF_STAGES {4} \
 ] $pipeline_registers_1

  # Create instance: spdif_out, and set properties
  set spdif_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 spdif_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {3} \
CONFIG.DIN_WIDTH {4} \
 ] $spdif_out

  # Create instance: vlbank_out, and set properties
  set vlbank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 vlbank_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {1} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {4} \
 ] $vlbank_out

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins pipeline_registers_1/clk]
  connect_bd_net -net de_out_Dout [get_bd_pins Dout2] [get_bd_pins de_out/Dout]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_audio_spdif [get_bd_pins spdif] [get_bd_pins hdmi_sync_pass/In3]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_de [get_bd_pins de] [get_bd_pins hdmi_sync_pass/In2]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_hblank [get_bd_pins hblank] [get_bd_pins hdmi_sync_pass/In0]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_vblank [get_bd_pins vblank] [get_bd_pins hdmi_sync_pass/In1]
  connect_bd_net -net hblank_out_Dout [get_bd_pins Dout] [get_bd_pins hblank_out/Dout]
  connect_bd_net -net hdmi_sync_pass_dout [get_bd_pins hdmi_sync_pass/dout] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins de_out/Din] [get_bd_pins hblank_out/Din] [get_bd_pins pipeline_registers_1/pipe_out] [get_bd_pins spdif_out/Din] [get_bd_pins vlbank_out/Din]
  connect_bd_net -net spdif_out_Dout [get_bd_pins Dout3] [get_bd_pins spdif_out/Dout]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins reset_n] [get_bd_pins pipeline_registers_1/reset_n]
  connect_bd_net -net vlbank_out_Dout [get_bd_pins Dout1] [get_bd_pins vlbank_out/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: four_signal_registering
proc create_hier_cell_four_signal_registering { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_four_signal_registering() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 Dout
  create_bd_pin -dir O -from 0 -to 0 Dout1
  create_bd_pin -dir O -from 0 -to 0 Dout2
  create_bd_pin -dir O -from 0 -to 0 Dout3
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir I -from 0 -to 0 In1
  create_bd_pin -dir I -from 0 -to 0 In2
  create_bd_pin -dir I -from 0 -to 0 In3
  create_bd_pin -dir I clk
  create_bd_pin -dir I reset_n

  # Create instance: de_out, and set properties
  set de_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 de_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {2} \
CONFIG.DIN_TO {2} \
CONFIG.DIN_WIDTH {4} \
 ] $de_out

  # Create instance: hblank_out, and set properties
  set hblank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 hblank_out ]
  set_property -dict [ list \
CONFIG.DIN_WIDTH {4} \
 ] $hblank_out

  # Create instance: hdmi_sync_pass, and set properties
  set hdmi_sync_pass [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 hdmi_sync_pass ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $hdmi_sync_pass

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {4} \
CONFIG.NUMBER_OF_STAGES {2} \
 ] $pipeline_registers_1

  # Create instance: spdif_out, and set properties
  set spdif_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 spdif_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {3} \
CONFIG.DIN_WIDTH {4} \
 ] $spdif_out

  # Create instance: vlbank_out, and set properties
  set vlbank_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 vlbank_out ]
  set_property -dict [ list \
CONFIG.DIN_FROM {1} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {4} \
 ] $vlbank_out

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins pipeline_registers_1/clk]
  connect_bd_net -net de_out_Dout [get_bd_pins Dout2] [get_bd_pins de_out/Dout]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_audio_spdif [get_bd_pins In3] [get_bd_pins hdmi_sync_pass/In3]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_de [get_bd_pins In2] [get_bd_pins hdmi_sync_pass/In2]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_hblank [get_bd_pins In0] [get_bd_pins hdmi_sync_pass/In0]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_vblank [get_bd_pins In1] [get_bd_pins hdmi_sync_pass/In1]
  connect_bd_net -net hblank_out_Dout [get_bd_pins Dout] [get_bd_pins hblank_out/Dout]
  connect_bd_net -net hdmi_sync_pass_dout [get_bd_pins hdmi_sync_pass/dout] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins de_out/Din] [get_bd_pins hblank_out/Din] [get_bd_pins pipeline_registers_1/pipe_out] [get_bd_pins spdif_out/Din] [get_bd_pins vlbank_out/Din]
  connect_bd_net -net spdif_out_Dout [get_bd_pins Dout3] [get_bd_pins spdif_out/Dout]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins reset_n] [get_bd_pins pipeline_registers_1/reset_n]
  connect_bd_net -net vlbank_out_Dout [get_bd_pins Dout1] [get_bd_pins vlbank_out/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fmc_imageon_hdmi_output_0
proc create_hier_cell_fmc_imageon_hdmi_output_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_fmc_imageon_hdmi_output_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 IO_HDMIO
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:vid_io_rtl:1.0 VID_IO_IN

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 VID_IO_IN_active_video
  create_bd_pin -dir I -from 15 -to 0 VID_IO_IN_data
  create_bd_pin -dir I -from 0 -to 0 VID_IO_IN_hblank
  create_bd_pin -dir I -from 0 -to 0 VID_IO_IN_vblank
  create_bd_pin -dir I -from 0 -to 0 audio_spdif
  create_bd_pin -dir I clk

  # Create instance: fmc_imageon_hdmi_out_0, and set properties
  set fmc_imageon_hdmi_out_0 [ create_bd_cell -type ip -vlnv avnet:fmc_imageon:fmc_imageon_hdmi_out:2.0 fmc_imageon_hdmi_out_0 ]

  # Create instance: gnd, and set properties
  set gnd [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gnd ]

  # Create instance: vcc, and set properties
  set vcc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc ]

  # Create interface connections
  connect_bd_intf_net -intf_net fmc_imageon_hdmi_in_0_VID_IO_OUT [get_bd_intf_pins VID_IO_IN] [get_bd_intf_pins fmc_imageon_hdmi_out_0/VID_IO_IN]
  connect_bd_intf_net -intf_net fmc_imageon_hdmi_out_0_IO_HDMIO [get_bd_intf_pins IO_HDMIO] [get_bd_intf_pins fmc_imageon_hdmi_out_0/IO_HDMIO]

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins fmc_imageon_hdmi_out_0/clk]
  connect_bd_net -net fmc_imageon_hdmi_in_0_audio_spdif [get_bd_pins audio_spdif] [get_bd_pins fmc_imageon_hdmi_out_0/audio_spdif]
  connect_bd_net -net gnd_dout [get_bd_pins fmc_imageon_hdmi_out_0/reset] [get_bd_pins gnd/dout]
  connect_bd_net -net vcc_dout [get_bd_pins fmc_imageon_hdmi_out_0/embed_syncs] [get_bd_pins fmc_imageon_hdmi_out_0/oe] [get_bd_pins vcc/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: color_video_pass
proc create_hier_cell_color_video_pass { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_color_video_pass() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir I -from 0 -to 0 de_in_rd
  create_bd_pin -dir I -from 0 -to 0 de_in_wr
  create_bd_pin -dir O empty
  create_bd_pin -dir O full
  create_bd_pin -dir I reset_n
  create_bd_pin -dir I rst
  create_bd_pin -dir I -from 15 -to 0 ycbcr_orig
  create_bd_pin -dir O -from 15 -to 0 ycbcr_out

  # Create instance: color_video_pass_fifo, and set properties
  set color_video_pass_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 color_video_pass_fifo ]
  set_property -dict [ list \
CONFIG.Almost_Full_Flag {false} \
CONFIG.Data_Count_Width {16} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value {65534} \
CONFIG.Full_Threshold_Negate_Value {65533} \
CONFIG.Input_Data_Width {16} \
CONFIG.Input_Depth {65536} \
CONFIG.Output_Data_Width {16} \
CONFIG.Output_Depth {65536} \
CONFIG.Read_Data_Count_Width {16} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.Write_Data_Count_Width {16} \
 ] $color_video_pass_fifo

  # Create instance: color_video_pass_fifo_rd_en
  create_hier_cell_color_video_pass_fifo_rd_en $hier_obj color_video_pass_fifo_rd_en

  # Create instance: color_video_pass_fifo_wr_en
  create_hier_cell_color_video_pass_fifo_wr_en $hier_obj color_video_pass_fifo_wr_en

  # Create port connections
  connect_bd_net -net In2_1 [get_bd_pins de_in_wr] [get_bd_pins color_video_pass_fifo_wr_en/de_in]
  connect_bd_net -net Morphology_0_de_out [get_bd_pins de_in_rd] [get_bd_pins color_video_pass_fifo_rd_en/de_in]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins color_video_pass_fifo/clk] [get_bd_pins color_video_pass_fifo_rd_en/clk] [get_bd_pins color_video_pass_fifo_wr_en/clk]
  connect_bd_net -net color_video_pass_fifo_dout [get_bd_pins ycbcr_out] [get_bd_pins color_video_pass_fifo/dout]
  connect_bd_net -net color_video_pass_fifo_empty [get_bd_pins empty] [get_bd_pins color_video_pass_fifo/empty]
  connect_bd_net -net color_video_pass_fifo_full [get_bd_pins full] [get_bd_pins color_video_pass_fifo/full]
  connect_bd_net -net color_video_pass_fifo_wr_en1_rd_en [get_bd_pins color_video_pass_fifo/rd_en] [get_bd_pins color_video_pass_fifo_rd_en/rd_en]
  connect_bd_net -net din1_1 [get_bd_pins ycbcr_orig] [get_bd_pins color_video_pass_fifo/din]
  connect_bd_net -net reset_n_1 [get_bd_pins reset_n] [get_bd_pins color_video_pass_fifo_rd_en/reset_n] [get_bd_pins color_video_pass_fifo_wr_en/reset_n]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins rst] [get_bd_pins color_video_pass_fifo/rst]
  connect_bd_net -net vovrly_async_fifo_rst_wr_en [get_bd_pins color_video_pass_fifo/wr_en] [get_bd_pins color_video_pass_fifo_wr_en/wr_en]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: bge_unit
proc create_hier_cell_bge_unit { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_bge_unit() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -from 15 -to 0 FG_THRESHOLD
  create_bd_pin -dir I -from 15 -to 0 LEARNING_FACTOR
  create_bd_pin -dir I -from 7 -to 0 MATCH_THRESHOLD
  create_bd_pin -dir I -type clk axi_clk
  create_bd_pin -dir I axi_lite_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst axi_resetn
  create_bd_pin -dir O axis_overflow
  create_bd_pin -dir O axis_overflow1
  create_bd_pin -dir O axis_overflow2
  create_bd_pin -dir O axis_underflow
  create_bd_pin -dir O axis_underflow1
  create_bd_pin -dir O axis_underflow2
  create_bd_pin -dir I -from 7 -to 0 grayscale_pixel_in
  create_bd_pin -dir O -from 7 -to 0 grayscale_pixel_out
  create_bd_pin -dir I -type clk hdmi_clk
  create_bd_pin -dir O is_fg
  create_bd_pin -dir I system_reset
  create_bd_pin -dir I system_reset_n
  create_bd_pin -dir I -from 0 -to 0 window_enable
  create_bd_pin -dir O window_enable_out

  # Create instance: MixtureOfGaussians_0, and set properties
  set MixtureOfGaussians_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:MixtureOfGaussians:1.0 MixtureOfGaussians_0 ]

  # Create instance: grayscale8to32, and set properties
  set grayscale8to32 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 grayscale8to32 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {24} \
CONFIG.IN1_WIDTH {8} \
 ] $grayscale8to32

  # Create instance: mog_async_fifo_rst
  create_hier_cell_mog_async_fifo_rst $hier_obj mog_async_fifo_rst

  # Create instance: mog_params_extraction
  create_hier_cell_mog_params_extraction $hier_obj mog_params_extraction

  # Create instance: mog_params_packing
  create_hier_cell_mog_params_packing $hier_obj mog_params_packing

  # Create instance: mog_params_read_async_fifo, and set properties
  set mog_params_read_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 mog_params_read_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {1021} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {1024} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {16} \
CONFIG.TKEEP_WIDTH {16} \
CONFIG.TSTRB_WIDTH {16} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $mog_params_read_async_fifo

  # Create instance: mog_params_write_async_fifo, and set properties
  set mog_params_write_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 mog_params_write_async_fifo ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Empty_Threshold_Assert_Value_axis {1021} \
CONFIG.Empty_Threshold_Assert_Value_rach {13} \
CONFIG.Empty_Threshold_Assert_Value_rdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wach {13} \
CONFIG.Empty_Threshold_Assert_Value_wdch {1021} \
CONFIG.Empty_Threshold_Assert_Value_wrch {13} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.HAS_TKEEP {true} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {1024} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {16} \
CONFIG.TKEEP_WIDTH {16} \
CONFIG.TSTRB_WIDTH {16} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $mog_params_write_async_fifo

  # Create instance: mog_vdma, and set properties
  set mog_vdma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 mog_vdma ]
  set_property -dict [ list \
CONFIG.c_m_axi_mm2s_data_width {128} \
CONFIG.c_m_axi_s2mm_data_width {128} \
CONFIG.c_m_axis_mm2s_tdata_width {128} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {4096} \
CONFIG.c_mm2s_max_burst_length {256} \
CONFIG.c_num_fstores {1} \
CONFIG.c_s2mm_genlock_mode {0} \
CONFIG.c_s2mm_linebuffer_depth {4096} \
CONFIG.c_s2mm_max_burst_length {256} \
CONFIG.c_use_s2mm_fsync {0} \
 ] $mog_vdma

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {16} \
CONFIG.NUMBER_OF_STAGES {80} \
 ] $pipeline_registers_1

  # Create instance: vdma_sync_signals_passing, and set properties
  set vdma_sync_signals_passing [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 vdma_sync_signals_passing ]
  set_property -dict [ list \
CONFIG.Empty_Threshold_Assert_Value_axis {126} \
CONFIG.Empty_Threshold_Assert_Value_rach {14} \
CONFIG.Empty_Threshold_Assert_Value_wach {14} \
CONFIG.Empty_Threshold_Assert_Value_wrch {14} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} \
CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.Full_Threshold_Assert_Value_axis {127} \
CONFIG.Full_Threshold_Assert_Value_rach {15} \
CONFIG.Full_Threshold_Assert_Value_wach {15} \
CONFIG.Full_Threshold_Assert_Value_wrch {15} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {128} \
CONFIG.Overflow_Flag_AXI {true} \
CONFIG.Reset_Type {Asynchronous_Reset} \
CONFIG.TDATA_NUM_BYTES {0} \
CONFIG.TKEEP_WIDTH {0} \
CONFIG.TSTRB_WIDTH {0} \
CONFIG.TUSER_WIDTH {1} \
CONFIG.Underflow_Flag_AXI {true} \
 ] $vdma_sync_signals_passing

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {24} \
CONFIG.DOUT_WIDTH {8} \
 ] $xlslice_0

  # Create instance: xup_and3_0, and set properties
  set xup_and3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_0 ]

  # Create instance: xup_and3_1, and set properties
  set xup_and3_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_1 ]

  # Create instance: xup_and3_2, and set properties
  set xup_and3_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_2 ]

  # Create instance: xup_and3_3, and set properties
  set xup_and3_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:xup_and3:1.0 xup_and3_3 ]

  # Create instance: zero24, and set properties
  set zero24 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero24 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {24} \
 ] $zero24

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins MixtureOfGaussians_0/S_AXI]
  connect_bd_intf_net -intf_net mog_params_write_async_fifo_M_AXIS [get_bd_intf_pins mog_params_write_async_fifo/M_AXIS] [get_bd_intf_pins mog_vdma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net mog_vdma_M_AXI_MM2S [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins mog_vdma/M_AXI_MM2S]
  connect_bd_intf_net -intf_net mog_vdma_M_AXI_S2MM [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins mog_vdma/M_AXI_S2MM]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins mog_vdma/S_AXI_LITE]

  # Create port connections
  connect_bd_net -net MixtureOfGaussians_0_gp_out [get_bd_pins MixtureOfGaussians_0/gp_out] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net MixtureOfGaussians_0_is_fg [get_bd_pins is_fg] [get_bd_pins MixtureOfGaussians_0/is_fg]
  connect_bd_net -net MixtureOfGaussians_0_mean1_up [get_bd_pins MixtureOfGaussians_0/mean1_up] [get_bd_pins mog_params_packing/mean1_up]
  connect_bd_net -net MixtureOfGaussians_0_mean2_up [get_bd_pins MixtureOfGaussians_0/mean2_up] [get_bd_pins mog_params_packing/mean2_up]
  connect_bd_net -net MixtureOfGaussians_0_mean3_up [get_bd_pins MixtureOfGaussians_0/mean3_up] [get_bd_pins mog_params_packing/mean3_up]
  connect_bd_net -net MixtureOfGaussians_0_sd1_up [get_bd_pins MixtureOfGaussians_0/sd1_up] [get_bd_pins mog_params_packing/sd1_up]
  connect_bd_net -net MixtureOfGaussians_0_sd2_up [get_bd_pins MixtureOfGaussians_0/sd2_up] [get_bd_pins mog_params_packing/sd2_up]
  connect_bd_net -net MixtureOfGaussians_0_sd3_up [get_bd_pins MixtureOfGaussians_0/sd3_up] [get_bd_pins mog_params_packing/sd3_up]
  connect_bd_net -net MixtureOfGaussians_0_w1_up [get_bd_pins MixtureOfGaussians_0/w1_up] [get_bd_pins mog_params_packing/w1_up]
  connect_bd_net -net MixtureOfGaussians_0_w2_up [get_bd_pins MixtureOfGaussians_0/w2_up] [get_bd_pins mog_params_packing/w2_up]
  connect_bd_net -net MixtureOfGuassians_0_window_en_out [get_bd_pins window_enable_out] [get_bd_pins MixtureOfGaussians_0/window_en_out] [get_bd_pins xup_and3_2/c] [get_bd_pins xup_and3_3/a]
  connect_bd_net -net axi_lite_clk_1 [get_bd_pins axi_lite_clk] [get_bd_pins MixtureOfGaussians_0/s_axi_aclk] [get_bd_pins mog_async_fifo_rst/clk] [get_bd_pins mog_vdma/s_axi_lite_aclk]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins MixtureOfGaussians_0/s_axi_aresetn] [get_bd_pins mog_vdma/axi_resetn]
  connect_bd_net -net clk_1 [get_bd_pins hdmi_clk] [get_bd_pins MixtureOfGaussians_0/clk] [get_bd_pins mog_params_read_async_fifo/m_aclk] [get_bd_pins mog_params_write_async_fifo/s_aclk] [get_bd_pins pipeline_registers_1/clk] [get_bd_pins vdma_sync_signals_passing/s_aclk]
  connect_bd_net -net mean1_concat_dout [get_bd_pins MixtureOfGaussians_0/mean1] [get_bd_pins mog_params_extraction/mean3]
  connect_bd_net -net mean2_selection_dout [get_bd_pins MixtureOfGaussians_0/mean2] [get_bd_pins mog_params_extraction/sd2]
  connect_bd_net -net mean3_selection_dout [get_bd_pins MixtureOfGaussians_0/mean3] [get_bd_pins mog_params_extraction/sd1]
  connect_bd_net -net mog_async_fifo_rst_aresetn [get_bd_pins mog_async_fifo_rst/aresetn] [get_bd_pins mog_params_read_async_fifo/s_aresetn] [get_bd_pins mog_params_write_async_fifo/s_aresetn] [get_bd_pins pipeline_registers_1/reset_n] [get_bd_pins vdma_sync_signals_passing/s_aresetn]
  connect_bd_net -net mog_params_extraction_dout [get_bd_pins MixtureOfGaussians_0/w3] [get_bd_pins mog_params_extraction/w3]
  connect_bd_net -net mog_params_packing_dout [get_bd_pins mog_params_packing/dout] [get_bd_pins mog_params_write_async_fifo/s_axis_tdata]
  connect_bd_net -net mog_params_read_async_fifo_axis_overflow [get_bd_pins axis_overflow] [get_bd_pins mog_params_read_async_fifo/axis_overflow]
  connect_bd_net -net mog_params_read_async_fifo_axis_underflow [get_bd_pins axis_underflow1] [get_bd_pins mog_params_read_async_fifo/axis_underflow]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tdata [get_bd_pins mog_params_extraction/params] [get_bd_pins mog_params_read_async_fifo/m_axis_tdata]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tkeep [get_bd_pins mog_params_read_async_fifo/m_axis_tkeep] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tlast [get_bd_pins mog_params_read_async_fifo/m_axis_tlast] [get_bd_pins vdma_sync_signals_passing/s_axis_tlast]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tuser [get_bd_pins mog_params_read_async_fifo/m_axis_tuser] [get_bd_pins vdma_sync_signals_passing/s_axis_tuser]
  connect_bd_net -net mog_params_read_async_fifo_m_axis_tvalid [get_bd_pins mog_params_read_async_fifo/m_axis_tvalid] [get_bd_pins xup_and3_1/a]
  connect_bd_net -net mog_params_read_async_fifo_s_axis_tready [get_bd_pins mog_params_read_async_fifo/s_axis_tready] [get_bd_pins mog_vdma/m_axis_mm2s_tready]
  connect_bd_net -net mog_params_write_async_fifo_axis_overflow [get_bd_pins axis_overflow2] [get_bd_pins mog_params_write_async_fifo/axis_overflow]
  connect_bd_net -net mog_params_write_async_fifo_axis_underflow [get_bd_pins axis_underflow] [get_bd_pins mog_params_write_async_fifo/axis_underflow]
  connect_bd_net -net mog_params_write_async_fifo_s_axis_tready [get_bd_pins mog_params_write_async_fifo/s_axis_tready] [get_bd_pins xup_and3_3/c]
  connect_bd_net -net mog_vdma_m_axis_mm2s_tdata [get_bd_pins mog_params_read_async_fifo/s_axis_tdata] [get_bd_pins mog_vdma/m_axis_mm2s_tdata]
  connect_bd_net -net mog_vdma_m_axis_mm2s_tkeep [get_bd_pins mog_params_read_async_fifo/s_axis_tkeep] [get_bd_pins mog_vdma/m_axis_mm2s_tkeep]
  connect_bd_net -net mog_vdma_m_axis_mm2s_tlast [get_bd_pins mog_params_read_async_fifo/s_axis_tlast] [get_bd_pins mog_vdma/m_axis_mm2s_tlast]
  connect_bd_net -net mog_vdma_m_axis_mm2s_tuser [get_bd_pins mog_async_fifo_rst/tuser] [get_bd_pins mog_params_read_async_fifo/s_axis_tuser] [get_bd_pins mog_vdma/m_axis_mm2s_tuser]
  connect_bd_net -net mog_vdma_m_axis_mm2s_tvalid [get_bd_pins mog_params_read_async_fifo/s_axis_tvalid] [get_bd_pins mog_vdma/m_axis_mm2s_tvalid]
  connect_bd_net -net pipe_in1_1 [get_bd_pins grayscale_pixel_in] [get_bd_pins grayscale8to32/In1]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins mog_params_write_async_fifo/s_axis_tkeep] [get_bd_pins pipeline_registers_1/pipe_out]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins axi_clk] [get_bd_pins mog_params_read_async_fifo/s_aclk] [get_bd_pins mog_params_write_async_fifo/m_aclk] [get_bd_pins mog_vdma/m_axi_mm2s_aclk] [get_bd_pins mog_vdma/m_axi_s2mm_aclk] [get_bd_pins mog_vdma/m_axis_mm2s_aclk] [get_bd_pins mog_vdma/s_axis_s2mm_aclk]
  connect_bd_net -net sd1_selection_dout [get_bd_pins MixtureOfGaussians_0/sd1] [get_bd_pins mog_params_extraction/mean2]
  connect_bd_net -net sd2_selection_dout [get_bd_pins MixtureOfGaussians_0/sd2] [get_bd_pins mog_params_extraction/sd3]
  connect_bd_net -net sd3_selection_dout [get_bd_pins MixtureOfGaussians_0/sd3] [get_bd_pins mog_params_extraction/mean1]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins system_reset] [get_bd_pins MixtureOfGaussians_0/rst]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins system_reset_n] [get_bd_pins xup_and3_0/c] [get_bd_pins xup_and3_1/c] [get_bd_pins xup_and3_2/b] [get_bd_pins xup_and3_3/b]
  connect_bd_net -net vdma_sync_signals_passing_axis_overflow [get_bd_pins axis_overflow1] [get_bd_pins vdma_sync_signals_passing/axis_overflow]
  connect_bd_net -net vdma_sync_signals_passing_axis_underflow [get_bd_pins axis_underflow2] [get_bd_pins vdma_sync_signals_passing/axis_underflow]
  connect_bd_net -net vdma_sync_signals_passing_m_axis_tlast [get_bd_pins mog_params_write_async_fifo/s_axis_tlast] [get_bd_pins vdma_sync_signals_passing/m_axis_tlast]
  connect_bd_net -net vdma_sync_signals_passing_m_axis_tuser [get_bd_pins mog_params_write_async_fifo/s_axis_tuser] [get_bd_pins vdma_sync_signals_passing/m_axis_tuser]
  connect_bd_net -net vdma_sync_signals_passing_m_axis_tvalid [get_bd_pins vdma_sync_signals_passing/m_axis_tvalid] [get_bd_pins xup_and3_2/a]
  connect_bd_net -net vdma_sync_signals_passing_s_axis_tready [get_bd_pins vdma_sync_signals_passing/s_axis_tready] [get_bd_pins xup_and3_0/a]
  connect_bd_net -net w1_selection_dout [get_bd_pins MixtureOfGaussians_0/w1] [get_bd_pins mog_params_extraction/w1]
  connect_bd_net -net w2_selection_dout [get_bd_pins MixtureOfGaussians_0/w2] [get_bd_pins mog_params_extraction/w2]
  connect_bd_net -net window_en [get_bd_pins window_enable] [get_bd_pins MixtureOfGaussians_0/window_en] [get_bd_pins xup_and3_0/b] [get_bd_pins xup_and3_1/b]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins MixtureOfGaussians_0/gp] [get_bd_pins grayscale8to32/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins grayscale8to32/In0] [get_bd_pins zero24/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins grayscale_pixel_out] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xup_and3_0_y [get_bd_pins mog_params_read_async_fifo/m_axis_tready] [get_bd_pins xup_and3_0/y]
  connect_bd_net -net xup_and3_1_y [get_bd_pins vdma_sync_signals_passing/s_axis_tvalid] [get_bd_pins xup_and3_1/y]
  connect_bd_net -net xup_and3_2_y [get_bd_pins mog_params_write_async_fifo/s_axis_tvalid] [get_bd_pins xup_and3_2/y]
  connect_bd_net -net xup_and3_3_y [get_bd_pins vdma_sync_signals_passing/m_axis_tready] [get_bd_pins xup_and3_3/y]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set fmc_imageon_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 fmc_imageon_iic ]
  set hdmii_io [ create_bd_intf_port -mode Slave -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 hdmii_io ]
  set hdmio_io [ create_bd_intf_port -mode Master -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 hdmio_io ]

  # Create ports
  set fmc_imageon_iic_rst_n [ create_bd_port -dir O -from 0 -to 0 fmc_imageon_iic_rst_n ]
  set hdmii_clk [ create_bd_port -dir I -type clk hdmii_clk ]
  set morph_sel [ create_bd_port -dir I morph_sel ]
  set output_source [ create_bd_port -dir I -from 3 -to 0 output_source ]
  set smth_sel [ create_bd_port -dir I smth_sel ]

  # Create instance: FG_THRESHOLD, and set properties
  set FG_THRESHOLD [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 FG_THRESHOLD ]
  set_property -dict [ list \
CONFIG.CONST_VAL {16383} \
CONFIG.CONST_WIDTH {16} \
 ] $FG_THRESHOLD

  # Create instance: LEARNING_FACTOR, and set properties
  set LEARNING_FACTOR [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LEARNING_FACTOR ]
  set_property -dict [ list \
CONFIG.CONST_VAL {5} \
CONFIG.CONST_WIDTH {16} \
 ] $LEARNING_FACTOR

  # Create instance: MATCH_THRESHOLD, and set properties
  set MATCH_THRESHOLD [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 MATCH_THRESHOLD ]
  set_property -dict [ list \
CONFIG.CONST_VAL {85} \
CONFIG.CONST_WIDTH {8} \
 ] $MATCH_THRESHOLD

  # Create instance: Morphology_0, and set properties
  set Morphology_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:Morphology:1.0 Morphology_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon

  # Create instance: axi_mem_intercon_1, and set properties
  set axi_mem_intercon_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon_1

  # Create instance: axi_mem_intercon_2, and set properties
  set axi_mem_intercon_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_2 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon_2

  # Create instance: bge_unit
  create_hier_cell_bge_unit [current_bd_instance .] bge_unit

  # Create instance: color_video_pass
  create_hier_cell_color_video_pass [current_bd_instance .] color_video_pass

  # Create instance: concat_interrupt, and set properties
  set concat_interrupt [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_interrupt ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $concat_interrupt

  # Create instance: fmc_imageon_hdmi_input_0, and set properties
  set fmc_imageon_hdmi_input_0 [ create_bd_cell -type ip -vlnv avnet:fmc_imageon:fmc_imageon_hdmi_in:2.0 fmc_imageon_hdmi_input_0 ]

  # Create instance: fmc_imageon_hdmi_output_0
  create_hier_cell_fmc_imageon_hdmi_output_0 [current_bd_instance .] fmc_imageon_hdmi_output_0

  # Create instance: fmc_imageon_iic_0, and set properties
  set fmc_imageon_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 fmc_imageon_iic_0 ]

  # Create instance: four_signal_registering
  create_hier_cell_four_signal_registering [current_bd_instance .] four_signal_registering

  # Create instance: four_signal_registering1
  create_hier_cell_four_signal_registering1 [current_bd_instance .] four_signal_registering1

  # Create instance: four_signal_registering2
  create_hier_cell_four_signal_registering2 [current_bd_instance .] four_signal_registering2

  # Create instance: hdmi_sync_signals_passing
  create_hier_cell_hdmi_sync_signals_passing [current_bd_instance .] hdmi_sync_signals_passing

  # Create instance: image_smoothing_0, and set properties
  set image_smoothing_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:image_smoothing:1.0 image_smoothing_0 ]

  # Create instance: mog_woi_det, and set properties
  set mog_woi_det [ create_bd_cell -type ip -vlnv NEU-ESL:user:axi_window_of_interest_detection:1.0 mog_woi_det ]

  # Create instance: morph_pass_sel
  create_hier_cell_morph_pass_sel [current_bd_instance .] morph_pass_sel

  # Create instance: pipeline_registers_1, and set properties
  set pipeline_registers_1 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_1 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {16} \
CONFIG.NUMBER_OF_STAGES {2} \
 ] $pipeline_registers_1

  # Create instance: pipeline_registers_2, and set properties
  set pipeline_registers_2 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_2 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_2

  # Create instance: pipeline_registers_3, and set properties
  set pipeline_registers_3 [ create_bd_cell -type ip -vlnv SchuylerEldridge:user:pipeline_registers:1.0 pipeline_registers_3 ]
  set_property -dict [ list \
CONFIG.BIT_WIDTH {1} \
CONFIG.NUMBER_OF_STAGES {1} \
 ] $pipeline_registers_3

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {25.000000} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666667} \
CONFIG.PCW_CLK0_FREQ {25000000} \
CONFIG.PCW_CLK1_FREQ {125000000} \
CONFIG.PCW_CLK2_FREQ {10000000} \
CONFIG.PCW_CLK3_FREQ {10000000} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_EMIO_TTC0 {1} \
CONFIG.PCW_EN_ENET0 {1} \
CONFIG.PCW_EN_GPIO {1} \
CONFIG.PCW_EN_PTP_ENET0 {1} \
CONFIG.PCW_EN_QSPI {1} \
CONFIG.PCW_EN_RST2_PORT {1} \
CONFIG.PCW_EN_SDIO0 {1} \
CONFIG.PCW_EN_TTC0 {1} \
CONFIG.PCW_EN_UART1 {1} \
CONFIG.PCW_EN_USB0 {1} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {5} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {4} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK2_BUF {FALSE} \
CONFIG.PCW_FCLK_CLK3_BUF {FALSE} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {25.000000} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
CONFIG.PCW_GP0_EN_MODIFIABLE_TXN {0} \
CONFIG.PCW_GP1_EN_MODIFIABLE_TXN {0} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_MIO_0_DIRECTION {inout} \
CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_0_PULLUP {disabled} \
CONFIG.PCW_MIO_0_SLEW {slow} \
CONFIG.PCW_MIO_10_DIRECTION {inout} \
CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_10_PULLUP {disabled} \
CONFIG.PCW_MIO_10_SLEW {slow} \
CONFIG.PCW_MIO_11_DIRECTION {inout} \
CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_11_PULLUP {disabled} \
CONFIG.PCW_MIO_11_SLEW {slow} \
CONFIG.PCW_MIO_12_DIRECTION {inout} \
CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_12_PULLUP {disabled} \
CONFIG.PCW_MIO_12_SLEW {slow} \
CONFIG.PCW_MIO_13_DIRECTION {inout} \
CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_13_PULLUP {disabled} \
CONFIG.PCW_MIO_13_SLEW {slow} \
CONFIG.PCW_MIO_14_DIRECTION {inout} \
CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_14_PULLUP {disabled} \
CONFIG.PCW_MIO_14_SLEW {slow} \
CONFIG.PCW_MIO_15_DIRECTION {inout} \
CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_15_PULLUP {disabled} \
CONFIG.PCW_MIO_15_SLEW {slow} \
CONFIG.PCW_MIO_16_DIRECTION {out} \
CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_16_PULLUP {disabled} \
CONFIG.PCW_MIO_16_SLEW {fast} \
CONFIG.PCW_MIO_17_DIRECTION {out} \
CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_17_PULLUP {disabled} \
CONFIG.PCW_MIO_17_SLEW {fast} \
CONFIG.PCW_MIO_18_DIRECTION {out} \
CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_18_PULLUP {disabled} \
CONFIG.PCW_MIO_18_SLEW {fast} \
CONFIG.PCW_MIO_19_DIRECTION {out} \
CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_19_PULLUP {disabled} \
CONFIG.PCW_MIO_19_SLEW {fast} \
CONFIG.PCW_MIO_1_DIRECTION {out} \
CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_1_PULLUP {disabled} \
CONFIG.PCW_MIO_1_SLEW {fast} \
CONFIG.PCW_MIO_20_DIRECTION {out} \
CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_20_PULLUP {disabled} \
CONFIG.PCW_MIO_20_SLEW {fast} \
CONFIG.PCW_MIO_21_DIRECTION {out} \
CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_21_PULLUP {disabled} \
CONFIG.PCW_MIO_21_SLEW {fast} \
CONFIG.PCW_MIO_22_DIRECTION {in} \
CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_22_PULLUP {disabled} \
CONFIG.PCW_MIO_22_SLEW {fast} \
CONFIG.PCW_MIO_23_DIRECTION {in} \
CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_23_PULLUP {disabled} \
CONFIG.PCW_MIO_23_SLEW {fast} \
CONFIG.PCW_MIO_24_DIRECTION {in} \
CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_24_PULLUP {disabled} \
CONFIG.PCW_MIO_24_SLEW {fast} \
CONFIG.PCW_MIO_25_DIRECTION {in} \
CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_25_PULLUP {disabled} \
CONFIG.PCW_MIO_25_SLEW {fast} \
CONFIG.PCW_MIO_26_DIRECTION {in} \
CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_26_PULLUP {disabled} \
CONFIG.PCW_MIO_26_SLEW {fast} \
CONFIG.PCW_MIO_27_DIRECTION {in} \
CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_27_PULLUP {disabled} \
CONFIG.PCW_MIO_27_SLEW {fast} \
CONFIG.PCW_MIO_28_DIRECTION {inout} \
CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_28_PULLUP {disabled} \
CONFIG.PCW_MIO_28_SLEW {fast} \
CONFIG.PCW_MIO_29_DIRECTION {in} \
CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_29_PULLUP {disabled} \
CONFIG.PCW_MIO_29_SLEW {fast} \
CONFIG.PCW_MIO_2_DIRECTION {inout} \
CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_2_PULLUP {disabled} \
CONFIG.PCW_MIO_2_SLEW {fast} \
CONFIG.PCW_MIO_30_DIRECTION {out} \
CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_30_PULLUP {disabled} \
CONFIG.PCW_MIO_30_SLEW {fast} \
CONFIG.PCW_MIO_31_DIRECTION {in} \
CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_31_PULLUP {disabled} \
CONFIG.PCW_MIO_31_SLEW {fast} \
CONFIG.PCW_MIO_32_DIRECTION {inout} \
CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_32_PULLUP {disabled} \
CONFIG.PCW_MIO_32_SLEW {fast} \
CONFIG.PCW_MIO_33_DIRECTION {inout} \
CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_33_PULLUP {disabled} \
CONFIG.PCW_MIO_33_SLEW {fast} \
CONFIG.PCW_MIO_34_DIRECTION {inout} \
CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_34_PULLUP {disabled} \
CONFIG.PCW_MIO_34_SLEW {fast} \
CONFIG.PCW_MIO_35_DIRECTION {inout} \
CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_35_PULLUP {disabled} \
CONFIG.PCW_MIO_35_SLEW {fast} \
CONFIG.PCW_MIO_36_DIRECTION {in} \
CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_36_PULLUP {disabled} \
CONFIG.PCW_MIO_36_SLEW {fast} \
CONFIG.PCW_MIO_37_DIRECTION {inout} \
CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_37_PULLUP {disabled} \
CONFIG.PCW_MIO_37_SLEW {fast} \
CONFIG.PCW_MIO_38_DIRECTION {inout} \
CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_38_PULLUP {disabled} \
CONFIG.PCW_MIO_38_SLEW {fast} \
CONFIG.PCW_MIO_39_DIRECTION {inout} \
CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_39_PULLUP {disabled} \
CONFIG.PCW_MIO_39_SLEW {fast} \
CONFIG.PCW_MIO_3_DIRECTION {inout} \
CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_3_PULLUP {disabled} \
CONFIG.PCW_MIO_3_SLEW {fast} \
CONFIG.PCW_MIO_40_DIRECTION {inout} \
CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_40_PULLUP {disabled} \
CONFIG.PCW_MIO_40_SLEW {fast} \
CONFIG.PCW_MIO_41_DIRECTION {inout} \
CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_41_PULLUP {disabled} \
CONFIG.PCW_MIO_41_SLEW {fast} \
CONFIG.PCW_MIO_42_DIRECTION {inout} \
CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_42_PULLUP {disabled} \
CONFIG.PCW_MIO_42_SLEW {fast} \
CONFIG.PCW_MIO_43_DIRECTION {inout} \
CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_43_PULLUP {disabled} \
CONFIG.PCW_MIO_43_SLEW {fast} \
CONFIG.PCW_MIO_44_DIRECTION {inout} \
CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_44_PULLUP {disabled} \
CONFIG.PCW_MIO_44_SLEW {fast} \
CONFIG.PCW_MIO_45_DIRECTION {inout} \
CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_45_PULLUP {disabled} \
CONFIG.PCW_MIO_45_SLEW {fast} \
CONFIG.PCW_MIO_46_DIRECTION {in} \
CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_46_PULLUP {disabled} \
CONFIG.PCW_MIO_46_SLEW {slow} \
CONFIG.PCW_MIO_47_DIRECTION {in} \
CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_47_PULLUP {disabled} \
CONFIG.PCW_MIO_47_SLEW {slow} \
CONFIG.PCW_MIO_48_DIRECTION {out} \
CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_48_PULLUP {disabled} \
CONFIG.PCW_MIO_48_SLEW {slow} \
CONFIG.PCW_MIO_49_DIRECTION {in} \
CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_49_PULLUP {disabled} \
CONFIG.PCW_MIO_49_SLEW {slow} \
CONFIG.PCW_MIO_4_DIRECTION {inout} \
CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_4_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {fast} \
CONFIG.PCW_MIO_50_DIRECTION {inout} \
CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_50_PULLUP {disabled} \
CONFIG.PCW_MIO_50_SLEW {slow} \
CONFIG.PCW_MIO_51_DIRECTION {inout} \
CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_51_PULLUP {disabled} \
CONFIG.PCW_MIO_51_SLEW {slow} \
CONFIG.PCW_MIO_52_DIRECTION {out} \
CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_52_PULLUP {disabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_DIRECTION {inout} \
CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_53_PULLUP {disabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_DIRECTION {inout} \
CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_5_PULLUP {disabled} \
CONFIG.PCW_MIO_5_SLEW {fast} \
CONFIG.PCW_MIO_6_DIRECTION {out} \
CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_6_PULLUP {disabled} \
CONFIG.PCW_MIO_6_SLEW {fast} \
CONFIG.PCW_MIO_7_DIRECTION {out} \
CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_7_PULLUP {disabled} \
CONFIG.PCW_MIO_7_SLEW {slow} \
CONFIG.PCW_MIO_8_DIRECTION {out} \
CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_8_PULLUP {disabled} \
CONFIG.PCW_MIO_8_SLEW {fast} \
CONFIG.PCW_MIO_9_DIRECTION {inout} \
CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_9_PULLUP {disabled} \
CONFIG.PCW_MIO_9_SLEW {slow} \
CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#Quad SPI Flash#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#UART 1#UART 1#GPIO#GPIO#Enet 0#Enet 0} \
CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]#qspi0_sclk#gpio[7]#qspi_fbclk#gpio[9]#gpio[10]#gpio[11]#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#wp#cd#tx#rx#gpio[50]#gpio[51]#mdc#mdio} \
CONFIG.PCW_NAND_CYCLES_T_AR {0} \
CONFIG.PCW_NAND_CYCLES_T_CLR {0} \
CONFIG.PCW_NAND_CYCLES_T_RC {2} \
CONFIG.PCW_NAND_CYCLES_T_RR {0} \
CONFIG.PCW_NAND_CYCLES_T_WC {2} \
CONFIG.PCW_NOR_CS0_T_RC {2} \
CONFIG.PCW_NOR_CS0_T_WC {2} \
CONFIG.PCW_NOR_CS0_WE_TIME {2} \
CONFIG.PCW_NOR_CS1_T_RC {2} \
CONFIG.PCW_NOR_CS1_T_WC {2} \
CONFIG.PCW_NOR_CS1_WE_TIME {2} \
CONFIG.PCW_NOR_SRAM_CS0_T_RC {2} \
CONFIG.PCW_NOR_SRAM_CS0_T_WC {2} \
CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {2} \
CONFIG.PCW_NOR_SRAM_CS1_T_RC {2} \
CONFIG.PCW_NOR_SRAM_CS1_T_WC {2} \
CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {2} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.063} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.062} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.065} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.083} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.007} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.010} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.006} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.048} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
CONFIG.PCW_SD0_GRP_WP_IO {MIO 46} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {32} \
CONFIG.PCW_TRACE_INTERNAL_WIDTH {32} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_TTC0_TTC0_IO {EMIO} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.41} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.411} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.341} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.358} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {2048 MBits} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.025} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.028} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.061} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333313} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J128M16 HA-15E} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {45.0} \
CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {36.0} \
CONFIG.PCW_UIPARAM_DDR_T_RC {49.5} \
CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {1} \
CONFIG.PCW_USE_S_AXI_HP2 {1} \
CONFIG.preset {ZedBoard} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
CONFIG.NUM_MI {7} \
 ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {0} \
 ] $rst_processing_system7_0_100M

  # Create instance: rst_processing_system7_0_150M, and set properties
  set rst_processing_system7_0_150M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_150M ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {0} \
 ] $rst_processing_system7_0_150M

  # Create instance: smth_pass_sel
  create_hier_cell_smth_pass_sel [current_bd_instance .] smth_pass_sel

  # Create instance: vbb_system_reset_0, and set properties
  set vbb_system_reset_0 [ create_bd_cell -type ip -vlnv NEU-ESL:user:vbb_system_reset:1.0 vbb_system_reset_0 ]

  # Create instance: video_overlay_unit
  create_hier_cell_video_overlay_unit [current_bd_instance .] video_overlay_unit

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: ycbcr2gray
  create_hier_cell_ycbcr2gray [current_bd_instance .] ycbcr2gray

  # Create instance: ycbcr2mem_unit
  create_hier_cell_ycbcr2mem_unit [current_bd_instance .] ycbcr2mem_unit

  # Create instance: ycbcr_to_grayscale, and set properties
  set ycbcr_to_grayscale [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 ycbcr_to_grayscale ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {8} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {8} \
 ] $ycbcr_to_grayscale

  # Create interface connections
  connect_bd_intf_net -intf_net IO_HDMII_1 [get_bd_intf_ports hdmii_io] [get_bd_intf_pins fmc_imageon_hdmi_input_0/IO_HDMII]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins video_overlay_unit/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_mem_intercon_1_M00_AXI [get_bd_intf_pins axi_mem_intercon_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP1]
  connect_bd_intf_net -intf_net axi_mem_intercon_2_M00_AXI [get_bd_intf_pins axi_mem_intercon_2/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP2]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net fmc_imageon_hdmi_out_0_IO_HDMIO [get_bd_intf_ports hdmio_io] [get_bd_intf_pins fmc_imageon_hdmi_output_0/IO_HDMIO]
  connect_bd_intf_net -intf_net fmc_imageon_iic_0_IIC [get_bd_intf_ports fmc_imageon_iic] [get_bd_intf_pins fmc_imageon_iic_0/IIC]
  connect_bd_intf_net -intf_net mog_vdma_M_AXI_MM2S [get_bd_intf_pins axi_mem_intercon_1/S00_AXI] [get_bd_intf_pins bge_unit/M_AXI_MM2S]
  connect_bd_intf_net -intf_net mog_vdma_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon_1/S01_AXI] [get_bd_intf_pins bge_unit/M_AXI_S2MM]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins fmc_imageon_iic_0/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI] [get_bd_intf_pins video_overlay_unit/S_AXI_LITE]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins bge_unit/S_AXI_LITE] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI] [get_bd_intf_pins ycbcr2mem_unit/S_AXI_LITE]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M04_AXI [get_bd_intf_pins bge_unit/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M05_AXI [get_bd_intf_pins mog_woi_det/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M06_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M06_AXI] [get_bd_intf_pins video_overlay_unit/S_AXI]
  connect_bd_intf_net -intf_net video_overlay_unit_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins video_overlay_unit/M_AXI_S2MM]
  connect_bd_intf_net -intf_net ycbcr_vdma_M_AXI_MM2S [get_bd_intf_pins axi_mem_intercon_2/S00_AXI] [get_bd_intf_pins ycbcr2mem_unit/M_AXI_MM2S]
  connect_bd_intf_net -intf_net ycbcr_vdma_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon_2/S01_AXI] [get_bd_intf_pins ycbcr2mem_unit/M_AXI_S2MM]

  # Create port connections
  connect_bd_net -net Din_1 [get_bd_pins smth_pass_sel/ycbcr_smth_sel] [get_bd_pins ycbcr2gray/Din]
  connect_bd_net -net FG_THRESHOLD_dout [get_bd_pins FG_THRESHOLD/dout] [get_bd_pins bge_unit/FG_THRESHOLD]
  connect_bd_net -net In2_1 [get_bd_pins color_video_pass/de_in_wr] [get_bd_pins four_signal_registering/Dout2] [get_bd_pins image_smoothing_0/de_in] [get_bd_pins smth_pass_sel/de_before]
  connect_bd_net -net In3_1 [get_bd_pins four_signal_registering/Dout3] [get_bd_pins image_smoothing_0/spdif_in] [get_bd_pins smth_pass_sel/spdif_before]
  connect_bd_net -net LEARNING_FACTOR_dout [get_bd_pins LEARNING_FACTOR/dout] [get_bd_pins bge_unit/LEARNING_FACTOR]
  connect_bd_net -net MATCH_THRESHOLD_dout [get_bd_pins MATCH_THRESHOLD/dout] [get_bd_pins bge_unit/MATCH_THRESHOLD]
  connect_bd_net -net MixtureOfGuassians_0_is_fg [get_bd_pins Morphology_0/input_data_bit] [get_bd_pins bge_unit/is_fg] [get_bd_pins morph_pass_sel/fg_before]
  connect_bd_net -net MixtureOfGuassians_0_window_en_out [get_bd_pins Morphology_0/win_enable_in] [get_bd_pins bge_unit/window_enable_out] [get_bd_pins morph_pass_sel/window_en_before]
  connect_bd_net -net Morphology_0_Hblank_out [get_bd_pins Morphology_0/hblank_out] [get_bd_pins morph_pass_sel/hblank_after]
  connect_bd_net -net Morphology_0_Vblank_out [get_bd_pins Morphology_0/vblank_out] [get_bd_pins morph_pass_sel/vblank_after]
  connect_bd_net -net Morphology_0_de_out [get_bd_pins Morphology_0/de_out] [get_bd_pins morph_pass_sel/de_after]
  connect_bd_net -net Morphology_0_output_data_bit [get_bd_pins Morphology_0/output_data_bit] [get_bd_pins morph_pass_sel/fg_after]
  connect_bd_net -net Morphology_0_win_enable_out [get_bd_pins Morphology_0/win_enable_out] [get_bd_pins morph_pass_sel/window_en_after]
  connect_bd_net -net clk_1 [get_bd_ports hdmii_clk] [get_bd_pins Morphology_0/clk] [get_bd_pins bge_unit/hdmi_clk] [get_bd_pins color_video_pass/clk] [get_bd_pins fmc_imageon_hdmi_input_0/clk] [get_bd_pins fmc_imageon_hdmi_output_0/clk] [get_bd_pins four_signal_registering/clk] [get_bd_pins four_signal_registering1/clk] [get_bd_pins four_signal_registering2/clk] [get_bd_pins hdmi_sync_signals_passing/clk] [get_bd_pins image_smoothing_0/clk] [get_bd_pins mog_woi_det/clk] [get_bd_pins pipeline_registers_1/clk] [get_bd_pins pipeline_registers_2/clk] [get_bd_pins pipeline_registers_3/clk] [get_bd_pins vbb_system_reset_0/clk] [get_bd_pins video_overlay_unit/hdmi_clk] [get_bd_pins ycbcr2mem_unit/clk]
  connect_bd_net -net de_in_1 [get_bd_pins hdmi_sync_signals_passing/de_in] [get_bd_pins smth_pass_sel/de_smth_sel]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_audio_spdif [get_bd_pins fmc_imageon_hdmi_input_0/audio_spdif] [get_bd_pins four_signal_registering/In3]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_de [get_bd_pins fmc_imageon_hdmi_input_0/video_de] [get_bd_pins four_signal_registering/In2]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_hblank [get_bd_pins fmc_imageon_hdmi_input_0/video_hblank] [get_bd_pins four_signal_registering/In0] [get_bd_pins mog_woi_det/input_video_hblank]
  connect_bd_net -net fmc_imageon_hdmi_in_unit0_video_vblank [get_bd_pins fmc_imageon_hdmi_input_0/video_vblank] [get_bd_pins four_signal_registering/In1] [get_bd_pins mog_woi_det/input_video_vblank] [get_bd_pins vbb_system_reset_0/vblank]
  connect_bd_net -net fmc_imageon_iic_0_gpo [get_bd_ports fmc_imageon_iic_rst_n] [get_bd_pins fmc_imageon_iic_0/gpo]
  connect_bd_net -net fmc_imageon_iic_0_iic2intc_irpt [get_bd_pins concat_interrupt/In2] [get_bd_pins fmc_imageon_iic_0/iic2intc_irpt]
  connect_bd_net -net four_signal_registering1_Dout [get_bd_pins fmc_imageon_hdmi_output_0/VID_IO_IN_hblank] [get_bd_pins four_signal_registering1/Dout]
  connect_bd_net -net four_signal_registering1_Dout1 [get_bd_pins fmc_imageon_hdmi_output_0/VID_IO_IN_vblank] [get_bd_pins four_signal_registering1/Dout1]
  connect_bd_net -net four_signal_registering1_Dout2 [get_bd_pins fmc_imageon_hdmi_output_0/VID_IO_IN_active_video] [get_bd_pins four_signal_registering1/Dout2]
  connect_bd_net -net four_signal_registering1_Dout3 [get_bd_pins fmc_imageon_hdmi_output_0/audio_spdif] [get_bd_pins four_signal_registering1/Dout3]
  connect_bd_net -net four_signal_registering2_de_out [get_bd_pins four_signal_registering1/de] [get_bd_pins four_signal_registering2/de_out]
  connect_bd_net -net four_signal_registering2_hblank_out [get_bd_pins four_signal_registering1/hblank] [get_bd_pins four_signal_registering2/hblank_out] [get_bd_pins video_overlay_unit/input_video_hblank]
  connect_bd_net -net four_signal_registering2_spdif_out [get_bd_pins four_signal_registering1/spdif] [get_bd_pins four_signal_registering2/spdif_out]
  connect_bd_net -net four_signal_registering2_vblank_out [get_bd_pins four_signal_registering1/vblank] [get_bd_pins four_signal_registering2/vblank_out] [get_bd_pins video_overlay_unit/input_video_vblank]
  connect_bd_net -net hblank_in_1 [get_bd_pins hdmi_sync_signals_passing/hblank_in] [get_bd_pins smth_pass_sel/hblank_smth_sel]
  connect_bd_net -net image_smoothing_1_Hblank_out [get_bd_pins image_smoothing_0/Hblank_out] [get_bd_pins smth_pass_sel/hblank_after]
  connect_bd_net -net image_smoothing_1_Vblank_out [get_bd_pins image_smoothing_0/Vblank_out] [get_bd_pins smth_pass_sel/vblank_after]
  connect_bd_net -net image_smoothing_1_data_out [get_bd_pins image_smoothing_0/data_out] [get_bd_pins smth_pass_sel/ycbcr_after]
  connect_bd_net -net image_smoothing_1_de_out [get_bd_pins image_smoothing_0/de_out] [get_bd_pins smth_pass_sel/de_after]
  connect_bd_net -net image_smoothing_1_spdif_out [get_bd_pins image_smoothing_0/spdif_out] [get_bd_pins smth_pass_sel/spdif_after]
  connect_bd_net -net image_smoothing_1_win_enable_out [get_bd_pins image_smoothing_0/win_enable_out] [get_bd_pins smth_pass_sel/window_en_after]
  connect_bd_net -net image_smoothing_full_version_0_Hblank_out [get_bd_pins four_signal_registering/Dout] [get_bd_pins image_smoothing_0/Hblank_in] [get_bd_pins smth_pass_sel/hblank_before]
  connect_bd_net -net image_smoothing_full_version_0_Vblank_out [get_bd_pins four_signal_registering/Dout1] [get_bd_pins image_smoothing_0/Vblank_in] [get_bd_pins smth_pass_sel/vblank_before]
  connect_bd_net -net mog_woi_det_window_enable [get_bd_pins image_smoothing_0/win_enable_in] [get_bd_pins mog_woi_det/window_enable] [get_bd_pins smth_pass_sel/window_en_before]
  connect_bd_net -net morph_pass_sel_Dout [get_bd_pins morph_pass_sel/fg_morph_sel] [get_bd_pins pipeline_registers_3/pipe_in]
  connect_bd_net -net morph_pass_sel_de_smth_sel [get_bd_pins color_video_pass/de_in_rd] [get_bd_pins four_signal_registering2/de] [get_bd_pins morph_pass_sel/de_morph_sel]
  connect_bd_net -net morph_pass_sel_hblank_smth_sel [get_bd_pins four_signal_registering2/hblank] [get_bd_pins morph_pass_sel/hblank_morph_sel]
  connect_bd_net -net morph_pass_sel_spdif_smth_sel [get_bd_pins four_signal_registering2/spdif] [get_bd_pins morph_pass_sel/spdif_morph_sel]
  connect_bd_net -net morph_pass_sel_vblank_smth_sel [get_bd_pins four_signal_registering2/vblank] [get_bd_pins morph_pass_sel/vblank_morph_sel]
  connect_bd_net -net morph_pass_sel_windown_en_smth_sel [get_bd_pins morph_pass_sel/windown_en_morph_sel] [get_bd_pins pipeline_registers_2/pipe_in]
  connect_bd_net -net output_source_1 [get_bd_ports output_source] [get_bd_pins video_overlay_unit/output_source]
  connect_bd_net -net pipeline_registers_1_pipe_out [get_bd_pins Morphology_0/de_in] [get_bd_pins hdmi_sync_signals_passing/de] [get_bd_pins morph_pass_sel/de_before]
  connect_bd_net -net pipeline_registers_1_pipe_out1 [get_bd_pins color_video_pass/ycbcr_orig] [get_bd_pins image_smoothing_0/data_in] [get_bd_pins pipeline_registers_1/pipe_out] [get_bd_pins smth_pass_sel/ycbcr_before]
  connect_bd_net -net pipeline_registers_2_pipe_out [get_bd_pins Morphology_0/vblank_in] [get_bd_pins hdmi_sync_signals_passing/vblank] [get_bd_pins morph_pass_sel/vblank_before]
  connect_bd_net -net pipeline_registers_2_pipe_out1 [get_bd_pins pipeline_registers_2/pipe_out] [get_bd_pins video_overlay_unit/mog_window_enable] [get_bd_pins ycbcr2mem_unit/window_en]
  connect_bd_net -net pipeline_registers_3_pipe_out [get_bd_pins pipeline_registers_3/pipe_out] [get_bd_pins video_overlay_unit/is_fg]
  connect_bd_net -net pipeline_registers_4_pipe_out [get_bd_pins Morphology_0/hblank_in] [get_bd_pins hdmi_sync_signals_passing/hblank] [get_bd_pins morph_pass_sel/hblank_before]
  connect_bd_net -net pipeline_registers_5_pipe_out [get_bd_pins Morphology_0/spdif_in] [get_bd_pins hdmi_sync_signals_passing/spdif] [get_bd_pins morph_pass_sel/spdif_before]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins bge_unit/axi_lite_clk] [get_bd_pins fmc_imageon_iic_0/s_axi_aclk] [get_bd_pins mog_woi_det/s_axi_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/M04_ACLK] [get_bd_pins processing_system7_0_axi_periph/M05_ACLK] [get_bd_pins processing_system7_0_axi_periph/M06_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk] [get_bd_pins video_overlay_unit/s_axi_lite_aclk] [get_bd_pins ycbcr2mem_unit/s_axi_lite_aclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon_1/ACLK] [get_bd_pins axi_mem_intercon_1/M00_ACLK] [get_bd_pins axi_mem_intercon_1/S00_ACLK] [get_bd_pins axi_mem_intercon_1/S01_ACLK] [get_bd_pins axi_mem_intercon_2/ACLK] [get_bd_pins axi_mem_intercon_2/M00_ACLK] [get_bd_pins axi_mem_intercon_2/S00_ACLK] [get_bd_pins axi_mem_intercon_2/S01_ACLK] [get_bd_pins bge_unit/axi_clk] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP2_ACLK] [get_bd_pins rst_processing_system7_0_150M/slowest_sync_clk] [get_bd_pins video_overlay_unit/axi_clk] [get_bd_pins ycbcr2mem_unit/m_axi_mm2s_aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in] [get_bd_pins rst_processing_system7_0_150M/ext_reset_in]
  connect_bd_net -net processing_system7_0_FCLK_RESET2_N [get_bd_pins processing_system7_0/FCLK_RESET2_N] [get_bd_pins vbb_system_reset_0/ext_reset_n]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins bge_unit/axi_resetn] [get_bd_pins fmc_imageon_iic_0/s_axi_aresetn] [get_bd_pins mog_woi_det/s_axi_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M04_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M05_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M06_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn] [get_bd_pins video_overlay_unit/axi_resetn] [get_bd_pins ycbcr2mem_unit/axi_resetn]
  connect_bd_net -net rst_processing_system7_0_150M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon_1/ARESETN] [get_bd_pins axi_mem_intercon_2/ARESETN] [get_bd_pins rst_processing_system7_0_150M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_150M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon_1/M00_ARESETN] [get_bd_pins axi_mem_intercon_1/S00_ARESETN] [get_bd_pins axi_mem_intercon_1/S01_ARESETN] [get_bd_pins axi_mem_intercon_2/M00_ARESETN] [get_bd_pins axi_mem_intercon_2/S00_ARESETN] [get_bd_pins axi_mem_intercon_2/S01_ARESETN] [get_bd_pins rst_processing_system7_0_150M/peripheral_aresetn]
  connect_bd_net -net sel_1 [get_bd_ports morph_sel] [get_bd_pins morph_pass_sel/sel]
  connect_bd_net -net smth_sel_1 [get_bd_ports smth_sel] [get_bd_pins smth_pass_sel/sel]
  connect_bd_net -net spdif_1 [get_bd_pins Morphology_0/spdif_out] [get_bd_pins morph_pass_sel/spdif_after]
  connect_bd_net -net spdif_in_1 [get_bd_pins hdmi_sync_signals_passing/spdif_in] [get_bd_pins smth_pass_sel/spdif_smth_sel]
  connect_bd_net -net swap_dout [get_bd_pins fmc_imageon_hdmi_input_0/video_data] [get_bd_pins pipeline_registers_1/pipe_in]
  connect_bd_net -net vbb_system_reset_0_system_reset [get_bd_pins Morphology_0/rst] [get_bd_pins bge_unit/system_reset] [get_bd_pins color_video_pass/rst] [get_bd_pins image_smoothing_0/reset] [get_bd_pins mog_woi_det/rst] [get_bd_pins vbb_system_reset_0/system_reset] [get_bd_pins video_overlay_unit/system_reset] [get_bd_pins ycbcr2mem_unit/rst]
  connect_bd_net -net vbb_system_reset_0_system_reset_n [get_bd_pins bge_unit/system_reset_n] [get_bd_pins color_video_pass/reset_n] [get_bd_pins four_signal_registering/reset_n] [get_bd_pins four_signal_registering1/reset_n] [get_bd_pins four_signal_registering2/reset_n] [get_bd_pins hdmi_sync_signals_passing/reset_n] [get_bd_pins pipeline_registers_1/reset_n] [get_bd_pins pipeline_registers_2/reset_n] [get_bd_pins pipeline_registers_3/reset_n] [get_bd_pins vbb_system_reset_0/system_reset_n] [get_bd_pins video_overlay_unit/system_reset_n] [get_bd_pins ycbcr2mem_unit/system_resetn]
  connect_bd_net -net vblank_in_1 [get_bd_pins hdmi_sync_signals_passing/vblank_in] [get_bd_pins smth_pass_sel/vblank_smth_sel]
  connect_bd_net -net video_overlay_0_video_data_out [get_bd_pins fmc_imageon_hdmi_output_0/VID_IO_IN_data] [get_bd_pins video_overlay_unit/video_data_out]
  connect_bd_net -net video_overlay_unit_mm2s_introut [get_bd_pins concat_interrupt/In0] [get_bd_pins video_overlay_unit/mm2s_introut]
  connect_bd_net -net video_overlay_unit_s2mm_introut [get_bd_pins concat_interrupt/In1] [get_bd_pins video_overlay_unit/s2mm_introut]
  connect_bd_net -net window_enable_1 [get_bd_pins bge_unit/window_enable] [get_bd_pins smth_pass_sel/windown_en_smth_sel]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins concat_interrupt/dout] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins vbb_system_reset_0/ext_reset] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins video_overlay_unit/grayscale_pixel_in_orig] [get_bd_pins ycbcr_to_grayscale/Dout]
  connect_bd_net -net ycbcr2gray_Dout [get_bd_pins bge_unit/grayscale_pixel_in] [get_bd_pins ycbcr2gray/Dout]
  connect_bd_net -net ycbcr_orig_rebuild_dout [get_bd_pins color_video_pass/ycbcr_out] [get_bd_pins video_overlay_unit/ycbcr_data_in_orig] [get_bd_pins ycbcr2mem_unit/ycbcr_data] [get_bd_pins ycbcr_to_grayscale/Din]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs bge_unit/MixtureOfGaussians_0/S_AXI/S_AXI_reg] SEG_MixtureOfGaussians_0_S_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs video_overlay_unit/vovrly_vdma/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs video_overlay_unit/vovrlay_woi_det/S_AXI/S_AXI_reg] SEG_axi_window_of_interest_detection_0_S_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41600000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs fmc_imageon_iic_0/S_AXI/Reg] SEG_fmc_imageon_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43010000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs bge_unit/mog_vdma/S_AXI_LITE/Reg] SEG_mog_vdma_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs mog_woi_det/S_AXI/S_AXI_reg] SEG_mog_woi_det_S_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43020000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs ycbcr2mem_unit/ycbcr_vdma/S_AXI_LITE/Reg] SEG_ycbcr_vdma_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces bge_unit/mog_vdma/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces bge_unit/mog_vdma/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces video_overlay_unit/vovrly_vdma/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces video_overlay_unit/vovrly_vdma/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces ycbcr2mem_unit/ycbcr_vdma/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces ycbcr2mem_unit/ycbcr_vdma/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


