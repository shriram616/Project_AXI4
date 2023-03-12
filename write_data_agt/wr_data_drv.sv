`include "uvm_macros.svh"
import uvm_pkg::*;

class wr_data_drv extends uvm_driver#(wr_trans);
`uvm_component_utils(wr_data_drv)

top_config cfg;
virtual axi_intf intf;

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(top_config)::get(this,"","cfg",cfg))
			`uvm_error("wr_driver","config not set");
		//get config
		//if(!uvm_config_db#(virtual intf)::get(this,"","inf",inf))
			//`uvm_error("wr_driver","config not set");
	endfunction
	
	function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
			this.intf = cfg.intf;
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
		seq_item_port.get_next_item(req);
		req.print();
		send_to_dut(req);
		seq_item_port.item_done(req);
		end
	endtask

	task send_to_dut(wr_trans trans);
		//repeat(3);
		@(posedge intf.aclk)
		wr_rst();
		intf.S_AXI_WDATA<=trans.S_AXI_WDATA;
		intf.S_AXI_WSTRB<=trans.S_AXI_WSTRB;
		intf.S_AXI_WVALID<=trans.S_AXI_WVALID;
		intf.S_AXI_WREADY<=trans.S_AXI_WREADY;
		intf.S_AXI_WLAST<=trans.S_AXI_WLAST;
		
		
	endtask
	task wr_rst();
		#20;
		intf.S_AXI_WDATA=0;
		intf.S_AXI_WSTRB=0;
		intf.S_AXI_WVALID=0;
		intf.S_AXI_WREADY=0;
		intf.S_AXI_WLAST=0;
	endtask
endclass