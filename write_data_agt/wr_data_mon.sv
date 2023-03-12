`include "uvm_macros.svh"
import uvm_pkg::*;


class wr_data_mon extends uvm_monitor;
`uvm_component_utils(wr_data_mon)
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
			intf = cfg.intf;
		endfunction
endclass