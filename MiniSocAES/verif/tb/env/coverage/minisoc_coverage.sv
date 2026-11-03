
`ifndef MINISOC_COVERAGE_SV
`define MINISOC_COVERAGE_SV

class minisoc_coverage extends uvm_component;

    `uvm_component_utils(minisoc_coverage)

    clk_coverage clk_cov;
    rst_coverage rst_cov;


    function new(string name = "minisoc_coverage",uvm_component parent = null);
        super.new(name, parent);
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        clk_cov = clk_coverage::type_id::create("clk_cov", this);

        rst_cov = rst_coverage::type_id::create("rst_cov", this);
    endfunction

endclass 

`endif