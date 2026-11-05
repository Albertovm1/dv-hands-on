`ifndef MINISOC_COVERAGE_SV
`define MINISOC_COVERAGE_SV

class minisoc_coverage extends uvm_component;

    `uvm_component_utils(minisoc_coverage)

    uvm_analysis_imp #(clk_mon_item, minisoc_coverage) analysis_export;

    time measured_period;
    time high_time;
    time low_time;
    

    covergroup clk_cov;

        period_cov: coverpoint measured_period {
            bins period_500ps = {500};
        }

        duty_cycle_cov: coverpoint high_time {
            bins duty_50 = {250};
        }

    endgroup

    function new(string name = "minisoc_coverage",uvm_component parent = null);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
        clk_cov = new();
    endfunction

    function void write(clk_mon_item item);

        measured_period = item.measured_period;
        high_time       = item.high_time;
        low_time        = item.low_time;

        clk_cov.sample();

    endfunction

    function void report_phase(uvm_phase phase);

        super.report_phase(phase);

        `uvm_info("MINISOC_COVERAGE", $sformatf("Clock Coverage: %0.2f%%", clk_cov.get_coverage()), UVM_NONE)

    endfunction

endclass 

`endif