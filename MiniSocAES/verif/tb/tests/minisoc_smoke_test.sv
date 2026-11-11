`ifndef MINISOC_SMOKE_TEST_SV
`define MINISOC_SMOKE_TEST_SV

class minisoc_smoke_test extends uvm_test;

    `uvm_component_utils(minisoc_smoke_test)

    minisoc_env env;

    clk_sequence seq;
    rst_sequence_short rst_seq;

    function new(string name = "minisoc_smoke_test",
                 uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        `uvm_info("SMOKE_TEST",
            "Building MiniSoC environment", UVM_LOW)

        env = minisoc_env::type_id::create("env", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);

        if (env == null)
            `uvm_fatal("SMOKE_TEST", "Environment was not created!")

        if (env.m_clk_agent == null)
            `uvm_fatal("SMOKE_TEST", "Clock Agent was not created!")

        if (env.m_clk_agent.sequencer == null)
            `uvm_fatal("SMOKE_TEST", "Clock Sequencer was not created!")

        if (env.m_rst_agent == null)
            `uvm_fatal("SMOKE_TEST", "Reset Agent was not created!")

        if (env.m_rst_agent.sequencer == null)
            `uvm_fatal("SMOKE_TEST", "Reset Sequencer was not created!")

        `uvm_info("SMOKE_TEST",
            "Environment, Clock Agent and Reset Agent created successfully",
            UVM_LOW)
    endfunction

    task run_phase(uvm_phase phase);

        phase.raise_objection(this);

        `uvm_info("SMOKE_TEST",
            "Starting MiniSoC smoke test", UVM_LOW)

        seq = clk_sequence::type_id::create("seq");
        seq.start(env.m_clk_agent.sequencer);

        rst_seq = rst_sequence_short::type_id::create("rst_seq");
        rst_seq.start(env.m_rst_agent.sequencer);

        phase.drop_objection(this);

    endtask

endclass

`endif
