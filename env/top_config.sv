`include "uvm_macros.svh"
import uvm_pkg::*;

class top_config extends uvm_object;
`uvm_object_utils(top_config)

virtual axi_intf intf;

function new(string name = "");
	super.new(name);
endfunction



endclass