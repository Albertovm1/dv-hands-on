`ifndef MEM_AGENT_PKG_SV
`define MEM_AGENT_PKG_SV

package mem_agent_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "mem_seq_item.sv"
    `include "mem_sequencer.sv"
    `include "mem_driver.sv"
    `include "mem_monitor.sv"
    `include "mem_agent.sv"
    
    `include "mem_sequence_basic.sv"
    `include "mem_sequence_boundary.sv"
    `include "mem_sequence_data_patterns.sv"
    `include "mem_sequence_multiple.sv"
    `include "mem_sequence_overwrite.sv"
    `include "mem_sequence_random.sv"
    
endpackage
`endif