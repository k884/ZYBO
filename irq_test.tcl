#-----------------------------------------------------------
# Vivado v2015.1 (64-bit)
# SW Build 1215546 on Mon Apr 27 19:07:21 MDT 2015
# IP Build 1209967 on Tue Apr 21 11:39:20 MDT 2015
# Start of session at: Tue Jul  7 17:41:45 2015
# Process ID: 2097
# Log file: /home/k884/vivado.log
# Journal file: /home/k884/vivado.jou
#-----------------------------------------------------------

#!/bin/bash
set version      "2015.1"
set project_name "IRQ_TEST"
set part         "xc7z010clg400-1"
set bd_name      "IRQ_TEST_design"
set project_dir  "IRQ_TEST" 

create_project -force -part $part $project_name $project_dir

create_bd_design $bd_name
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET {src/ZYBO_zynq_def.xml}] [get_bd_cells processing_system7_0]
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
set_property  ip_repo_paths ip_repo [current_project]
update_ip_catalog
create_bd_cell -type ip -vlnv Digilent:user:myLed:1.0 myLed_0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" }  [get_bd_intf_pins myLed_0/S00_AXI]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
create_bd_port -dir O -from 3 -to 0 led
connect_bd_net [get_bd_pins /myLed_0/led] [get_bd_ports led]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
set_property -dict [list CONFIG.NUM_PORTS {5}] [get_bd_cells xlconcat_0]
connect_bd_net [get_bd_pins myLed_0/irq] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]
create_bd_port -dir I BTN0
create_bd_port -dir I BTN1
create_bd_port -dir I BTN2
create_bd_port -dir I BTN3
connect_bd_net [get_bd_ports BTN0] [get_bd_pins xlconcat_0/In1]
set_property location {51 106} [get_bd_ports BTN2]
set_property location {58 108} [get_bd_ports BTN2]
connect_bd_net [get_bd_ports BTN2] [get_bd_pins xlconcat_0/In3]
connect_bd_net [get_bd_ports BTN1] [get_bd_pins xlconcat_0/In2]
set_property location {70 145} [get_bd_ports BTN3]
connect_bd_net [get_bd_ports BTN3] [get_bd_pins xlconcat_0/In4]
regenerate_bd_layout
save_bd_design
add_files -fileset constrs_1 -norecurse src/ZYBO_IRQ.xdc
import_files -fileset constrs_1 src/ZYBO_IRQ.xdc
validate_bd_design
