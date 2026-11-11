`ifndef MINISOC_COVERAGE_PKG_SV
`define MINISOC_COVERAGE_PKG_SV

package minisoc_coverage_pkg;

    timeunit 1ps;
    timeprecision 1ps;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    `include "minisoc_coverage.sv"

endpackage : minisoc_coverage_pkg

`endif