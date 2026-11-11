`ifndef CLK_DRIVER_SV
`define CLK_DRIVER_SV

class clk_driver extends uvm_driver #(clk_seq_item);

    `uvm_component_utils(clk_driver)

    virtual clk_if.driver vif;

    time clk_period = 500ps;

    function new(string name = "clk_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db #(virtual clk_if.driver)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CLK_DRIVER","Virtual interface not found!")
        end

    endfunction

    task run_phase(uvm_phase phase);
        vif.clk = 0;
        
        forever begin
            seq_item_port.get_next_item(req);
            fork begin
                forever begin
                    #(req.clk_period / 2);
                    vif.clk = 0;
                    #(req.clk_period / 2);
                    vif.clk = 1;
                end
            end
            join_none;
            seq_item_port.item_done();
        end
    endtask
endclass
`endif