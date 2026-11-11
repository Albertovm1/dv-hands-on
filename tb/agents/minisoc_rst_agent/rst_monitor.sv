`ifndef RST_MONITOR_SV
`define RST_MONITOR_SV

class rst_monitor extends uvm_monitor;

    `uvm_component_utils(rst_monitor)

    virtual rst_if.monitor vif;

    uvm_analysis_port #(rst_seq_item) analysis_port;

    function new(string name = "rst_monitor",uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual rst_if.monitor)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CFGERR", "Reset interface not configured")
        end

        analysis_port = new("analysis_port", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        
        rst_seq_item item;

        forever begin

            @(vif.rst_n);

            item = rst_seq_item::type_id::create("item");
            
            if (vif.rst_n == 1'b0) begin
                item.rst_cmd = rst_seq_item::ASSERT_RESET;
                `uvm_info("RST_MON","Reset asserted", UVM_MEDIUM)
            end
            else if (vif.rst_n == 1'b1) begin
                item.rst_cmd = rst_seq_item::DEASSERT_RESET;
                `uvm_info("RST_MON","Reset deasserted", UVM_MEDIUM)
            end
            
            analysis_port.write(item);
        end

    endtask

endclass

`endif