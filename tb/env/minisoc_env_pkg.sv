`ifndef MINISOC_ENV_PKG_SV
`define MINISOC_ENV_PKG_SV

package minisoc_env_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    `include "clk_checker.sv"
    `include "rst_checker.sv"
    import minisoc_scoreboard_pkg::*;
    import minisoc_coverage_pkg::*;

    `include "minisoc_env.sv"

endpackage

`endif