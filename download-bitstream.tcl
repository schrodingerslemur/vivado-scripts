# download-bitstream.tcl
if {![info exists BITFILE]} {
    puts "ERROR: BITFILE not provided"
    exit 1
}

open_hw
connect_hw_server
open_hw_target

current_hw_device [lindex [get_hw_devices] 0]
refresh_hw_device -update_hw_probes false $current_hw_device

set_property PROGRAM.FILE $BITFILE $current_hw_device
program_hw_devices $current_hw_device
