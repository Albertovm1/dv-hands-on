`ifndef RST_MONITOR_SV
`define RST_MONITOR_SV

class rst_monitor extends uvm_monitor;

    `uvm_component_utils(rst_monitor)

    virtual rst_if.monitor vif;

    uvm_analysis_port #(rst_seq_item) ap;

    time reset_start_time;

    function new(string name = "rst_monitor",uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual rst_if.monitor)::get(
            this, "", "vif", vif
        )) begin
            `uvm_fatal("CFGERR", "Reset interface not configured")
        end
    endfunction


    virtual task run_phase(uvm_phase phase);
        rst_seq_item tr;
        `uvm_info("RST_MON", "Reset monitor started", UVM_MEDIUM)

        forever begin

            @(vif.rst_n);

            tr = rst_seq_item::type_id::create("tr");

            if (vif.rst_n == 1'b0) begin
                tr.rst_cmd = rst_seq_item::ASSERT_RESET;
                reset_start_time = $time;
                tr.duration = 0;
                `uvm_info("RST_MON", "Reset asserted", UVM_MEDIUM)
            end
            else if (vif.rst_n == 1'b1) begin
                tr.rst_cmd = rst_seq_item::DEASSERT_RESET;
                tr.duration = $time - reset_start_time;
                `uvm_info("RST_MON", "Reset deasserted", UVM_MEDIUM)
            end
            else begin
                `uvm_warning("RST_MON", "Unknown reset signal value")
                continue;

            end

            ap.write(tr);

        end

    endtask

endclass

`endif