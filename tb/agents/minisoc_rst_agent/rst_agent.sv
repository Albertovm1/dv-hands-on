`ifndef RST_AGENT_SV
`define RST_AGENT_SV

class rst_agent extends uvm_agent;

    `uvm_component_utils(rst_agent)

    rst_sequencer sequencer;
    rst_driver    driver;
    rst_monitor   monitor;


    function new(string name = "rst_agent",uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor = rst_monitor::type_id::create("monitor", this);

        if (get_is_active() == UVM_ACTIVE) begin
            sequencer = rst_sequencer::type_id::create("sequencer", this);
            driver = rst_driver::type_id::create("driver", this);
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if (get_is_active() == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction

endclass

`endif