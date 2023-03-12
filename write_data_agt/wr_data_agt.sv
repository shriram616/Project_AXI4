`include "uvm_macros.svh"
import uvm_pkg::*;


class wr_data_agt extends uvm_agent;
`uvm_component_utils(wr_data_agt)

	wr_data_drv drv;
	uvm_sequencer#(wr_trans) seqr1;
	wr_data_mon mon;
	
	virtual axi_intf intf;

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		

		drv = wr_data_drv::type_id::create("drv",this);
		seqr1 = uvm_sequencer#(wr_trans)::type_id::create("seqr1",this);
		mon = wr_data_mon::type_id::create("mon",this);

	endfunction

	function void connect_phase(uvm_phase phase);
		
		drv.seq_item_port.connect(seqr1.seq_item_export);

	endfunction

endclass
