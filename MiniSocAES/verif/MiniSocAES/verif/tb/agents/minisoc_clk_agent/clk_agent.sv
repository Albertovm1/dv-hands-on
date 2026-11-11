`ifndef CLK_AGENT_SV
`define CLK_AGENT_SV

class clk_agent extends uvm_agent;

    `uvm_component_utils(clk_agent)

    clk_sequencer sequencer;
    clk_driver driver;
    clk_monitor monitor;

    function new(string name = "minisoc_clk_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        monitor = clk_monitor::type_id::create("monitor", this);
        driver = clk_driver::type_id::create("driver", this);
        sequencer = clk_sequencer::type_id::create("sequencer", this);

    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
        `uvm_info("CLK_MONITOR", "Clock Monitor connected!", UVM_LOW)
    endfunction

endclass

`endif
