`include "uvm_macros.svh"
import uvm_pkg::*;

module top();

parameter integer C_S_AXI_ADDR_WIDTH            = 32;
parameter integer C_S_AXI_DATA_WIDTH            = 32;

logic ACLK,ARESETN;

/*
// Slave Interface Write Address Ports
   logic [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR;
   logic [3-1:0]                  S_AXI_AWPROT;
   logic                          S_AXI_AWVALID;
   logic                          S_AXI_AWREADY;

   // Slave Interface Write Data Ports
   logic [C_S_AXI_DATA_WIDTH-1:0]   S_AXI_WDATA;
   logic [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB;
   logic                          S_AXI_WVALID;
   logic                          S_AXI_WREADY;

   // Slave Interface Write Response Ports
   logic [2-1:0]                 S_AXI_BRESP;
   logic                         S_AXI_BVALID;
   logic                         S_AXI_BREADY;

   // Slave Interface Read Address Ports
   logic [C_S_AXI_ADDR_WIDTH-1:0]   S_AXI_ARADDR;
   logic [3-1:0]                  S_AXI_ARPROT;
   logic                          S_AXI_ARVALID;
   logic                          S_AXI_ARREADY;

   // Slave Interface Read Data Ports
   logic [C_S_AXI_DATA_WIDTH-1:0]  S_AXI_RDATA;
   logic [2-1:0]                 S_AXI_RRESP;
   logic                         S_AXI_RVALID;
   logic                         S_AXI_RREADY;
*/

axi_intf intf(ACLK,ARESETN);

//#(32'h0000_ffff,32'h0000_0000)

axi_lite_slave#(32'h0000_ffff,32'h0000_0000) dut(
 ACLK,
 ARESETN,

   // Slave Interface Write Address Ports
							intf.S_AXI_AWADDR,
							intf.S_AXI_AWPROT,
                            intf.S_AXI_AWVALID,
                            intf.S_AXI_AWREADY,

   // Slave Interface Write Data Ports
							intf.S_AXI_WDATA,
							intf.S_AXI_WSTRB,
                           intf.S_AXI_WVALID,
                           intf.S_AXI_WREADY,

   // Slave Interface Write Response Ports
							intf.S_AXI_BRESP,
							intf.S_AXI_BVALID,
							intf.S_AXI_BREADY,

   // Slave Interface Read Address Ports
							intf.S_AXI_ARADDR,
							intf.S_AXI_ARPROT,
                            intf.S_AXI_ARVALID,
                            intf.S_AXI_ARREADY,

   // Slave Interface Read Data Ports
							intf.S_AXI_RDATA,
							intf.S_AXI_RRESP,
							intf.S_AXI_RVALID,
                            intf.S_AXI_RREADY
);

initial begin 
	uvm_config_db#(virtual axi_intf)::set(null,"*","intf",intf);
end 

always begin
	#5 ACLK = 1'b0;
	#5 ACLK = 1'b1;
end

initial begin
#20 ARESETN = 1'b0;
	#5 ARESETN = 1'b1;
end

initial begin

	run_test("base_test");

end 

endmodule
