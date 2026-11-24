`ifndef MEM_DRIVER_SV
`define MEM_DRIVER_SV

class mem_driver extends uvm_driver #(mem_seq_item);

    `uvm_component_utils(mem_driver)

    virtual mem_if.driver vif;

    function new(string name = "mem_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual mem_if.driver)::get(this, "", "vif", vif))
            `uvm_fatal("MEM_DRIVER", "Virtual interface not found!")
    endfunction

    task run_phase(uvm_phase phase);

        mem_seq_item req;

        time half_period;

        vif.mem_clk     = 0;
        vif.mem_i_data  = 0;
        vif.mem_i_wr_en = 0;
        vif.mem_i_addr  = 0;

        forever begin

            seq_item_port.get_next_item(req);

            half_period = req.mem_clk_period / 2;

            vif.mem_i_addr = req.addr;

            if (req.op == mem_seq_item::MEM_WRITE)begin
                vif.mem_i_wr_en = req.op;
                vif.mem_i_data = req.wdata;

                #(half_period);
                vif.mem_clk = 1;

                #(half_period);
                vif.mem_clk = 0;

            end

            else if (req.op == mem_seq_item::MEM_READ)begin
                vif.mem_i_wr_en = req.op;

                #(half_period);
                vif.mem_clk = 1;

                #(half_period);
                vif.mem_clk = 0;


            end

            else begin
                `uvm_fatal("MEM_DRIVER", "Invalid memory operation")
            end

            seq_item_port.item_done();

        end
    endtask

endclass
`endif