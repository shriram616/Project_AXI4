`include "uvm_macros.svh"
import uvm_pkg::*;

class base_test extends uvm_test;

`uvm_component_utils(base_test)

//env 
env env1;

//top_config
top_config cfg;

//wr_seqs
wr_data_seq1 seq1;
wr_addr_seq1 seq2;
wr_rsp_seq1  seq3; 

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);

		super.build_phase(phase);
		env1 = env::type_id::create("env1",this);
		
		//top_config
		cfg = top_config::type_id::create("cfg");
		if(!uvm_config_db#(virtual axi_intf)::get(this,"","intf",cfg.intf))
			`uvm_fatal("BASE_TEST","interface is not set");
			
		uvm_config_db#(top_config)::set(this,"*","cfg",cfg);	
		
		//seqs
		`uvm_info("WR_TEST1","Creating seq1 object",UVM_LOW);
		seq1=wr_data_seq1::type_id::create("seq1");
		seq2=wr_addr_seq1::type_id::create("seq2");
		seq3=wr_rsp_seq1::type_id::create("seq3"); 
		
	endfunction

	task run_phase(uvm_phase phase);

    phase.raise_objection(this);
	#40;
    $display("testcase is running :: starting the sequence");
	//repeat(30)
	`uvm_info("WR_TEST1","this is start of seq1",UVM_LOW);
		fork
			seq1.start(env1.wr_agt1.seqr1);
			seq2.start(env1.wr_agt2.seqr1);
			seq3.start(env1.wr_agt3.seqr1);
		join
		$display("**##########*********disp1*********##############****");
		
		
		`uvm_info("WR_TEST1","this is end of seq1",UVM_LOW);
	#900;
    phase.drop_objection(this);

	endtask

endclass

class wr_test1 extends base_test;
`uvm_component_utils(wr_test1)

//wr_seqs
wr_data_seq1 seq1;

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("WR_TEST1","Creating seq1 object",UVM_LOW);
		seq1=wr_data_seq1::type_id::create("seq1");
	endfunction
	
	task run_phase(uvm_phase phase);
		//super.run_phase(phase);
		phase.raise_objection(this);
		//#300;
		`uvm_info("WR_TEST1","this is start of seq1",UVM_LOW);
		//seq1.start(env1.wr_agt1.seqr1);
		`uvm_info("WR_TEST1","this is end of seq1",UVM_LOW);
		phase.drop_objection(this);
	endtask
	
endclass