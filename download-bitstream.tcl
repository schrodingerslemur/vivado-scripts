# Open the hardware manager
open_hw_manager

# Auto-connect to the local hardware server and target
connect_hw_server
open_hw_target

# Get the first hardware device found (adjust if you have multiple devices)
set hw_device [lindex [get_hw_devices] 0]

# Specify bitstream file
set_property PROGRAM.FILE {<path/to/<project_name>.bit} $hw_device

# Program the hardware device with the generated bitstream file
program_hw_devices $hw_device


