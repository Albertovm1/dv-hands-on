`ifndef CLK_AGENT_PKG_SV
`define CLK_AGENT_PKG_SV

package clk_agent_pkg;

    timeunit 1ps;
    timeprecision 1ps;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "clk_if.sv"
    `include "clk_seq_item.sv"
    `include "clk_mon_item.sv"
    `include "clk_sequencer.sv"
    `include "clk_sequence.sv"
    `include "clk_driver.sv"
    `include "clk_monitor.sv"
    `include "clk_agent.sv"

endpackage

`endif