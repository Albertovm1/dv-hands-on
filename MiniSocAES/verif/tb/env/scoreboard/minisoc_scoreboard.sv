`ifndef MINISOC_SCOREBOARD_SV
`define MINISOC_SCOREBOARD_SV

class minisoc_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(minisoc_scoreboard)

    uvm_analysis_imp #(clk_mon_item, minisoc_scoreboard)clk_monitor_export;

    time expected_period = 500ps;

    int unsigned pass_count;
    int unsigned fail_count;
    int unsigned total_count;

    function new(string name = "minisoc_scoreboard",uvm_component parent = null);
        super.new(name, parent);

        clk_monitor_export = new("clk_monitor_export", this);

        pass_count = 0;
        fail_count = 0;

    endfunction

    //scoreboard CLK
    function void write(clk_mon_item item);

        if (item.measured_period == expected_period) begin
            pass_count++;
            `uvm_info("SCOREBOARD",$sformatf("PASS: Periodo correto: %0t",item.measured_period),UVM_HIGH)
        end
        else begin
            fail_count++;
            `uvm_error("SCOREBOARD",$sformatf("FAIL: Periodo esperado: %0t | Periodo medido: %0t",expected_period,item.measured_period))
        end
    endfunction

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);

        total_count = pass_count + fail_count;

        `uvm_info("MINISOC_SCOREBOARD","============== SCOREBOARD ==============",UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("Total checks: %0d", total_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("PASS: %0d", pass_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("FAIL: %0d", fail_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD","========================================",UVM_NONE)

    endfunction

endclass

`endif