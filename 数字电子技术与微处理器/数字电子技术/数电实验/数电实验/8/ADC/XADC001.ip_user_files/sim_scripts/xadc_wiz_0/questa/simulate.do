onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xadc_wiz_0_opt

do {wave.do}

view wave
view structure
view signals

do {xadc_wiz_0.udo}

run -all

quit -force
