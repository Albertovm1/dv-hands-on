`ifndef CLK_DRIVER_SV
`define CLK_DRIVER_SV

class clk_driver extends uvm_driver #(clk_seq_item);

    `uvm_component_utils(clk_driver)

    virtual clk_if.driver vif;
    clk_config cfg;

    function new(string name = "clk_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db #(virtual clk_if.driver)::get(this, "", "vif", vif))
    `uvm_fatal("CLK_DRIVER", "Virtual interface not found!")

        if (!uvm_config_db #(clk_config)::get(this, "", "cfg", cfg))
            `uvm_fatal("CLK_DRIVER", "Clock configuration not found!")

    endfunction

    task clk_always_on();

        forever begin
            #(cfg.clk_period / 2);
            vif.clk = ~vif.clk;
        end

    endtask

    task process_clock_requests();

        forever begin
            seq_item_port.get_next_item(req);

            if (req.clk_period == 0)
                `uvm_fatal("CLK_DRIVER", "Clock period must be greater than zero")

            cfg.clk_period = req.clk_period;
            seq_item_port.item_done();
        end

    endtask

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        vif.clk = 0;

        fork
            clk_always_on();
            process_clock_requests();
        join
        
    endtask

endclass

`endif
