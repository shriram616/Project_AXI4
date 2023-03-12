`include "uvm_macros.svh"
import uvm_pkg::*;

class env extends uvm_env;
`uvm_component_utils(env)

//wr agents
wr_data_agt wr_agt1;
wr_addr_agt wr_agt2;
wr_rsp_agt wr_agt3;

//rd agents
rd_addr_agt rd_agt1;
rd_data_agt rd_agt2;



function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	wr_agt1 = wr_data_agt::type_id::create("wr_agt1",this);
	wr_agt2 = wr_addr_agt::type_id::create("wr_agt2",this);
	wr_agt3 = wr_rsp_agt::type_id::create("wr_agt3",this);
	rd_agt1 = rd_addr_agt ::type_id::create("rd_agt1",this);
	rd_agt2 = rd_data_agt ::type_id::create("rd_agt2",this);
	
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
	endfunction

endclass