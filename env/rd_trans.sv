`include "uvm_macros.svh"
import uvm_pkg::*;

class rd_trans#(parameter C_S_AXI_ADDR_WIDTH=32,
						  C_S_AXI_DATA_WIDTH=32) extends uvm_sequence_item;
//`uvm_object_utils(rd_trans)

   // Slave Interface Read Address Ports
   rand logic [C_S_AXI_ADDR_WIDTH-1:0]   S_AXI_ARADDR;
   logic [3-1:0]                  S_AXI_ARPROT;
   logic                          S_AXI_ARVALID;
   logic                          S_AXI_ARREADY;

   // Slave Interface Read Data Ports
   rand logic [C_S_AXI_DATA_WIDTH-1:0]  S_AXI_RDATA;
   logic [2-1:0]                 S_AXI_RRESP;
   logic                         S_AXI_RVALID;
   logic                         S_AXI_RREADY;
   
`uvm_object_utils_begin(rd_trans)
	`uvm_field_int(S_AXI_ARADDR,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_ARPROT,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_ARVALID,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_ARREADY,	UVM_ALL_ON);
	
	`uvm_field_int(S_AXI_RDATA,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_RRESP,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_RVALID,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_RREADY,	UVM_ALL_ON);
`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction

endclass