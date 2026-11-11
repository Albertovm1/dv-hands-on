`ifndef MINISOC_ENV_SV
`define MINISOC_ENV_SV

class minisoc_env extends uvm_env;

    `uvm_component_utils(minisoc_env)

    clk_agent m_clk_agent;
    rst_agent m_rst_agent;

    minisoc_scoreboard scoreboard;
    minisoc_coverage coverage;

    function new(string name = "minisoc_env",uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_clk_agent = clk_agent::type_id::create("clk_agent", this);
        m_rst_agent = rst_agent::type_id::create("rst_agent", this);

        scoreboard = minisoc_scoreboard::type_id::create("scoreboard", this);
        coverage = minisoc_coverage::type_id::create("coverage", this);

    endfunction

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        m_clk_agent.monitor.analysis_port.connect(scoreboard.clk_monitor_export);
        m_clk_agent.monitor.analysis_port.connect(coverage.clk_analysis_export);

        m_rst_agent.monitor.analysis_port.connect(scoreboard.rst_monitor_export);
        m_rst_agent.monitor.analysis_port.connect(coverage.rst_analysis_export);


    endfunction

endclass

`endif
