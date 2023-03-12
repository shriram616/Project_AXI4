
`include "uvm_macros.svh"
import uvm_pkg::*;
//=======================================
//
//WRITE SEQUENCES
//
//=======================================
class wr_data_seq1 extends uvm_sequence#(wr_trans);
`uvm_object_utils(wr_data_seq1)

function new(string name="");
	super.new(name);
endfunction

task body();
	req = wr_trans::type_id::create("req");
	repeat(4) begin
	start_item(req);
		assert(req.randomize()with{S_AXI_AWADDR==0;S_AXI_WLAST==0;});
	finish_item(req);
	
	start_item(req);
		assert(req.randomize()with{S_AXI_AWADDR==0;S_AXI_WLAST==1;});
	finish_item(req);
	
	start_item(req);
		assert(req.randomize()with{S_AXI_AWADDR==0;S_AXI_WLAST==0;S_AXI_WDATA==0;});
	finish_item(req);
	end
endtask

endclass

class wr_addr_seq1 extends uvm_sequence#(wr_trans);
`uvm_object_utils(wr_addr_seq1)

function new(string name="");
	super.new(name);
endfunction

task body();
int addr=$random;

	req = wr_trans::type_id::create("req");
	
	start_item(req);
		assert(req.randomize()with{S_AXI_WDATA==0;S_AXI_AWVALID==1;S_AXI_AWADDR==32'hffff_ffff;});
	finish_item(req);	
	/*
	repeat(2)begin
	start_item(req);
		assert(req.randomize()with{S_AXI_WDATA==0;S_AXI_AWVALID==1;S_AXI_AWADDR==addr+'d4;});
		addr=req.S_AXI_AWADDR;
	finish_item(req);
	end
	
	start_item(req);
		assert(req.randomize()with{S_AXI_WDATA==0;S_AXI_AWVALID==0;S_AXI_AWADDR==0;});
	finish_item(req);
	*/
	addr = 0;
endtask
endclass

class wr_rsp_seq1 extends uvm_sequence#(wr_trans);
`uvm_object_utils(wr_rsp_seq1)

function new(string name="");
	super.new(name);
endfunction

task body();
	req = wr_trans::type_id::create("req");
	
	start_item(req);
		assert(req.randomize()with{S_AXI_WDATA==0;S_AXI_AWADDR==0;});
	finish_item(req);
	
endtask

endclass
