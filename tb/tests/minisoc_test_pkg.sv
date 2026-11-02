`ifndef MINISOC_TEST_PKG_SV
`define MINISOC_TEST_PKG_SV

package minisoc_test_pkg;

    import uvm_pkg::*;
    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    import minisoc_env_pkg::*;

    `include "uvm_macros.svh"
    `include "minisoc_smoke_test.sv"

endpackage : minisoc_test_pkg

`endif
