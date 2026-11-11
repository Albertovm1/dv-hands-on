`ifndef RST_DRIVER_SV
`define RST_DRIVER_SV

class rst_driver extends uvm_driver #(rst_seq_item);

    `uvm_component_utils(rst_driver)

    virtual rst_if.driver vif;

    function new(string name = "rst_driver",uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual rst_if.driver)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CFGERR", "Reset interface not configured")
        end
    endfunction
    
    virtual task do_assert_reset(time duration);

        vif.rst_n <= 1'b0;

        `uvm_info("RST_DRV", "Reset asserted", UVM_MEDIUM)

        if (duration > 0)
            #(duration*1ns);
    endtask

    virtual task do_deassert_reset(time duration);

        vif.rst_n <= 1'b1;

        `uvm_info("RST_DRV", "Reset deasserted", UVM_MEDIUM)

        if (duration > 0)
            #(duration*1ns);
    endtask
    
    virtual task run_phase(uvm_phase phase);

        vif.rst_n <= 1'b1;

        forever begin
            seq_item_port.get_next_item(req);

            case (req.rst_cmd)
                rst_seq_item::ASSERT_RESET:
                    do_assert_reset(req.duration);

                rst_seq_item::DEASSERT_RESET:
                    do_deassert_reset(req.duration);
                
                default:
                    `uvm_error("RST_DRV", "Invalid reset command")
            endcase

            seq_item_port.item_done();
        end
    endtask

endclass
`endif
