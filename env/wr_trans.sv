`include "uvm_macros.svh"
import uvm_pkg::*;


class wr_trans#(parameter C_S_AXI_ADDR_WIDTH=32,
						  C_S_AXI_DATA_WIDTH=32) extends uvm_sequence_item;
//`uvm_object_utils(wr_trans)


// Slave Interface Write Address Ports
	rand   	logic [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR;
			logic [3-1:0]                 S_AXI_AWPROT;
	rand   	logic                         S_AXI_AWVALID;
			logic                         S_AXI_AWREADY;
	rand	logic [7:0]					  S_AXI_AWLEN;
	rand	logic [2:0]					  S_AXI_AWSIZE;
	rand	logic [1:0]					  S_AXI_AWBURST;

   // Slave Interface Write Data Ports
	rand   logic [C_S_AXI_DATA_WIDTH-1:0]   S_AXI_WDATA;
	rand   logic [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB;
		   logic                          	S_AXI_WVALID;
		   logic                          	S_AXI_WREADY;
		   logic							S_AXI_WLAST;

   // Slave Interface Write Response Ports
   logic [2-1:0]                 S_AXI_BRESP;
   logic                         S_AXI_BVALID;
   logic                         S_AXI_BREADY;

`uvm_object_utils_begin(wr_trans)
	`uvm_field_int(S_AXI_AWADDR,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_AWPROT,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_AWVALID,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_AWREADY,	UVM_ALL_ON);
	
	`uvm_field_int(S_AXI_WDATA,		UVM_ALL_ON);
	`uvm_field_int(S_AXI_WSTRB,		UVM_ALL_ON);
	`uvm_field_int(S_AXI_WVALID,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_WREADY,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_WLAST,		UVM_ALL_ON);
	
	`uvm_field_int(S_AXI_BRESP,		UVM_ALL_ON);
	`uvm_field_int(S_AXI_BVALID,	UVM_ALL_ON);
	`uvm_field_int(S_AXI_BREADY,	UVM_ALL_ON);
`uvm_object_utils_end




constraint strb{
		if(|S_AXI_WDATA[31:24])
			S_AXI_WSTRB[3]==1'b1;
		else 
			S_AXI_WSTRB[3]==1'b0;
		if(|S_AXI_WDATA[23:16])
			S_AXI_WSTRB[2]==1'b1;
		else
			S_AXI_WSTRB[2]==1'b0;
		if(|S_AXI_WDATA[15:8])
			S_AXI_WSTRB[1]==1'b1;
		else	
			S_AXI_WSTRB[1]==1'b0;
		if(|S_AXI_WDATA[7:0])
			S_AXI_WSTRB[0]==1'b1;
		else 	
			S_AXI_WSTRB[0]==1'b0;
}
function void post_randomize();
	//logic for write strobe
	/*	if(|S_AXI_WDATA[31:24])
			S_AXI_WSTRB[3]=1'b1;
		if(|S_AXI_WDATA[23:16])
			S_AXI_WSTRB[2]=1'b1;
		if(|S_AXI_WDATA[15:8])
			S_AXI_WSTRB[1]=1'b1;
		if(|S_AXI_WDATA[7:0])
			S_AXI_WSTRB[0]=1'b1;
		*/
		if(|S_AXI_WDATA)
			S_AXI_WVALID=1'b1;
		else 
			S_AXI_WVALID=0;
endfunction

	function new(string name="");
		super.new(name);
	endfunction

endclass