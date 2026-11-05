`ifndef MINISOC_ENV_PKG_SV
`define MINISOC_ENV_PKG_SV

package minisoc_env_pkg;

    timeunit 1ps;
    timeprecision 1ps;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    import minisoc_scoreboard_pkg::*;
    import minisoc_coverage_pkg::*;

    `include "minisoc_env.sv"

endpackage

`endif