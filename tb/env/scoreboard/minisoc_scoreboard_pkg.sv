`ifndef MINISOC_SCOREBOARD_PKG_SV
`define MINISOC_SCOREBOARD_PKG_SV

package minisoc_scoreboard_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    `include "clk_checker.sv"
    `include "rst_checker.sv"

    `include "minisoc_scoreboard.sv"

endpackage

`endif