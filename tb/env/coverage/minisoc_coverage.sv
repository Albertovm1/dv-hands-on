`ifndef MINISOC_COVERAGE_SV
`define MINISOC_COVERAGE_SV

`uvm_analysis_imp_decl(_clk_cov)
`uvm_analysis_imp_decl(_rst_cov)

class minisoc_coverage extends uvm_component;

    `uvm_component_utils(minisoc_coverage)

    uvm_analysis_imp_clk_cov #(clk_mon_item, minisoc_coverage) clk_analysis_export;
    uvm_analysis_imp_rst_cov #(rst_seq_item, minisoc_coverage) rst_analysis_export;

    time measured_period;
    time high_time;
    time low_time;

    rst_seq_item::rst_cmd_e rst_cmd;
    

    covergroup clk_cov;

        period_cov: coverpoint measured_period {
            bins period_500ps = {500};
        }

        duty_cycle_cov: coverpoint high_time {
            bins duty_50 = {250};
        }

    endgroup

    covergroup rst_cov;

        reset_cmd_cov: coverpoint rst_cmd {

            bins reset_asserted = {
                rst_seq_item::ASSERT_RESET
            };

            bins reset_deasserted = {
                rst_seq_item::DEASSERT_RESET
            };

            bins assert_to_deassert = (
                rst_seq_item::ASSERT_RESET =>
                rst_seq_item::DEASSERT_RESET
            );

            bins deassert_to_assert = (
                rst_seq_item::DEASSERT_RESET =>
                rst_seq_item::ASSERT_RESET
            );
        }

    endgroup

    function new(string name = "minisoc_coverage",uvm_component parent = null);
        super.new(name, parent);
        clk_analysis_export = new("clk_analysis_export", this);
        rst_analysis_export = new("rst_analysis_export", this);
        clk_cov = new();
        rst_cov = new();
    endfunction

    function void write_clk_cov(clk_mon_item item);

        measured_period = item.measured_period;
        high_time       = item.high_time;
        low_time        = item.low_time;

        clk_cov.sample();

    endfunction

    function void write_rst_cov(rst_seq_item item);

        rst_cmd = item.rst_cmd;

        rst_cov.sample();

    endfunction

    function void report_phase(uvm_phase phase);

        super.report_phase(phase);

        `uvm_info("MINISOC_COVERAGE", $sformatf("Clock Coverage: %0.2f%%", clk_cov.get_coverage()), UVM_NONE)

        `uvm_info("MINISOC_COVERAGE",$sformatf("Reset Coverage: %0.2f%%",rst_cov.get_coverage()), UVM_NONE)
    endfunction

endclass 

`endif