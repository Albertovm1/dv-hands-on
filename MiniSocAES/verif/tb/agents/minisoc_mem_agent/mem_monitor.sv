`ifndef MEM_MONITOR_SV
`define MEM_MONITOR_SV

class mem_monitor extends uvm_monitor;

    `uvm_component_utils(mem_monitor)

    virtual mem_if.monitor vif;

    uvm_analysis_port #(mem_seq_item) analysis_port;

    function new(string name = "mem_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual mem_if.monitor)::get(this, "", "vif", vif))
            `uvm_fatal("MEM_MONITOR", "Virtual interface not found!")

        analysis_port = new("analysis_port", this);
    endfunction

    task run_phase(uvm_phase phase);

        mem_seq_item item;

        forever begin
            
            @(posedge vif.mem_clk);

            item = mem_seq_item::type_id::create("item");

            if (vif.mem_i_wr_en == 1) begin

                item.op    = mem_seq_item::MEM_WRITE;
                item.addr  = vif.mem_i_addr;
                item.wdata = vif.mem_i_data;
                
            end

            else if (vif.mem_i_wr_en == 0) begin

                item.op    = mem_seq_item::MEM_READ;
                item.addr  = vif.mem_i_addr;

                @(negedge vif.mem_clk);

                item.rdata = vif.mem_o_data;

            end

            else begin
                `uvm_fatal("MEM_MONITOR", "Unknown value on mem_i_wr_en")
            end

            analysis_port.write(item);

        end
    endtask

endclass
`endif