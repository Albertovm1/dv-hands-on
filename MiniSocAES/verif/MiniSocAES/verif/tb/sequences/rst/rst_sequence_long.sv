`ifndef RST_SEQUENCE_LONG_SV
`define RST_SEQUENCE_LONG_SV

class rst_sequence_long extends rst_sequence_base;

    `uvm_object_utils(rst_sequence_long)

    function new(string name = "rst_sequence_long");
        super.new(name);
    endfunction

    virtual task body();

        `uvm_info("RST_LONG", "Starting long reset sequence", UVM_MEDIUM)

        apply_reset(1us);

        `uvm_info("RST_LONG", "Long reset sequence completed", UVM_MEDIUM)

    endtask

endclass

`endif