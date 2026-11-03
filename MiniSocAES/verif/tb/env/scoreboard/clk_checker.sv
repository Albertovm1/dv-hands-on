`ifndef CLK_CHECKER_SV
`define CLK_CHECKER_SV

class clk_checker extends uvm_component;

    `uvm_component_utils(clk_checker)

    uvm_analysis_imp #(clk_monitor_item, clk_checker) analysis_imp;

    time expected_period;

    int total_checks;
    int passed_checks;
    int failed_checks;


    function new(string name = "clk_checker",uvm_component parent = null);
        super.new(name, parent);

        analysis_imp = new("analysis_imp", this);

        expected_period = 500ps;

        total_checks  = 0;
        passed_checks = 0;
        failed_checks = 0;

    endfunction


    function void write(clk_monitor_item item);
        total_checks++;

        if (item == null) begin
            failed_checks++;
            `uvm_error("CLK_CHECKER","Received null monitor item!")
            return;
        end

        if (item.measured_period == expected_period) begin
            passed_checks++;
            `uvm_info("CLK_CHECKER",$sformatf("PASS: Clock period = %0t",item.measured_period), UVM_HIGH)
        end
        else begin
            failed_checks++;
            `uvm_error("CLK_CHECKER",$sformatf("FAIL: Expected = %0t | Measured = %0t",expected_period, item.measured_period))
        end

    endfunction

endclass
`endif