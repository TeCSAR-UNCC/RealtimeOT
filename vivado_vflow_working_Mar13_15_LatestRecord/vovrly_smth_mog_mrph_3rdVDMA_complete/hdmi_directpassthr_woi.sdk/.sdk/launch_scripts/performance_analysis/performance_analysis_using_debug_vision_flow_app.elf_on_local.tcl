connect -url tcp:127.0.0.1:3121
source /home/LAB/cbui1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/hdmi_directpassthr_woi_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248799419"} -index 0
loadhw -hw /home/LAB/cbui1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/hdmi_directpassthr_woi_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248799419"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248799419"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248799419"} -index 0
dow /home/LAB/cbui1/Documents/Vision_Project_WORKING_SET/vivado_vflow_working_Mar13_15_LatestRecord/vovrly_smth_mog_mrph_3rdVDMA_complete/hdmi_directpassthr_woi.sdk/vision_flow_app/Debug/vision_flow_app.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248799419"} -index 0
con
