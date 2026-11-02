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

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        vif.clk = 0;
        clk_always_on();
        
    endtask

endclass

`endif
