`ifndef RST_SEQUENCE_MULTIPLE_SV
`define RST_SEQUENCE_MULTIPLE_SV

class rst_sequence_multiple extends rst_sequence_base;

    `uvm_object_utils(rst_sequence_multiple)

    function new(string name = "rst_sequence_multiple");
        super.new(name);
    endfunction

    virtual task body();

        `uvm_info("RST_MULTIPLE", "Starting multiple reset sequence", UVM_MEDIUM)

        // First reset: short
        apply_reset(10ns);

        // Second reset: medium
        apply_reset(100ns);

        // Third reset: long
        apply_reset(1us);

        `uvm_info("RST_MULTIPLE", "Multiple reset sequence completed", UVM_MEDIUM)

    endtask

endclass

`endif