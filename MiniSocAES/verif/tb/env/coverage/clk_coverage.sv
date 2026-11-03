`ifndef CLK_COVERAGE_SV
`define CLK_COVERAGE_SV

class clk_coverage extends uvm_subscriber #(clk_monitor_item);

    `uvm_component_utils(clk_coverage)

    clk_monitor_item item;

    covergroup clk_cg with function sample(time measured_period);
        option.per_instance = 1;
        cp_clk_period : coverpoint measured_period {
            bins expected_period = {500};
        }

    endgroup

    function new(string name = "clk_coverage",uvm_component parent = null);
        super.new(name, parent);
        clk_cg = new();
    endfunction

    virtual function void write(clk_monitor_item t);
        if (t == null) begin
            `uvm_error("CLK_COV", "Received null monitor item!")
            return;
        end

        clk_cg.sample(t.measured_period);
        `uvm_info("CLK_COV",$sformatf("Clock period sampled: %0t",t.measured_period), UVM_HIGH)

    endfunction

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("CLK_COV",$sformatf("Clock Coverage: %0.2f%%",clk_cg.get_coverage()), UVM_LOW)

    endfunction

endclass
`endif