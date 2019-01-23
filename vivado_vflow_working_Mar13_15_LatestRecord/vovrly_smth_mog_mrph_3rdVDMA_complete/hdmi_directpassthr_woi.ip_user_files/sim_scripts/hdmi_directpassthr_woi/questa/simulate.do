onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib hdmi_directpassthr_woi_opt

do {wave.do}

view wave
view structure
view signals

do {hdmi_directpassthr_woi.udo}

run -all

quit -force
