interface axi_intf#(parameter integer C_S_AXI_ADDR_WIDTH            = 32,
					parameter integer C_S_AXI_DATA_WIDTH            = 32)
					(input logic aclk,aresetn);

// Slave Interface Write Address Ports
   logic [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR;
   logic [3-1:0]                  S_AXI_AWPROT;
   logic                          S_AXI_AWVALID;
   logic                          S_AXI_AWREADY;
   logic [7:0]					  S_AXI_AWLEN;
   logic [2:0]					  S_AXI_AWSIZE;
   logic [1:0]					  S_AXI_AWBURST;
 

   // Slave Interface Write Data Ports
   logic [C_S_AXI_DATA_WIDTH-1:0]   S_AXI_WDATA;
   logic [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB;
   logic                          	S_AXI_WVALID;
   logic                          	S_AXI_WREADY;
   logic							S_AXI_WLAST;
   

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

endinterface