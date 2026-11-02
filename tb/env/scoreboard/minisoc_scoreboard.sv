`ifndef MINISOC_SCOREBOARD_SV
`define MINISOC_SCOREBOARD_SV

class minisoc_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(minisoc_scoreboard)

    clk_checker m_clk_checker;
    rst_checker m_rst_checker;


    function new(string name = "minisoc_scoreboard",uvm_component parent = null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_clk_checker = clk_checker::type_id::create("clk_checker", this);

        m_rst_checker = rst_checker::type_id::create("rst_checker", this);

    endfunction

    function void report_phase(uvm_phase phase);

        super.report_phase(phase);

        `uvm_info("MINISOC_SB",
            "========== MINISOC SCOREBOARD REPORT ==========",
            UVM_LOW)

        `uvm_info("MINISOC_SB",
            $sformatf(
                "CLOCK: Total = %0d | Passed = %0d | Failed = %0d",
                m_clk_checker.total_checks,
                m_clk_checker.passed_checks,
                m_clk_checker.failed_checks
            ), UVM_LOW)

        `uvm_info("MINISOC_SB",
            $sformatf(
                "RESET: Events = %0d | Assert = %0d | Deassert = %0d | Failed = %0d",
                m_rst_checker.total_events,
                m_rst_checker.assert_count,
                m_rst_checker.deassert_count,
                m_rst_checker.failed_checks
            ), UVM_LOW)

        `uvm_info("MINISOC_SB",
            "================================================",
            UVM_LOW)

    endfunction

endclass

`endif