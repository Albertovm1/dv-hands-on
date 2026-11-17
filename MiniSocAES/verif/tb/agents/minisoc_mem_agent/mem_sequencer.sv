`ifndef MEM_SEQUENCER_SV
`define MEM_SEQUENCER_SV

class mem_sequencer extends uvm_sequencer #(mem_seq_item);

    `uvm_object_utils(mem_sequencer)

    function new(string name = "mem_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction

endclass
`endif