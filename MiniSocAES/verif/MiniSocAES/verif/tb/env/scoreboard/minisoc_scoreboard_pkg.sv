`ifndef MINISOC_SCOREBOARD_PKG_SV
`define MINISOC_SCOREBOARD_PKG_SV

package minisoc_scoreboard_pkg;

    timeunit 1ps;
    timeprecision 1ps;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    `include "minisoc_scoreboard.sv"

endpackage

`endif