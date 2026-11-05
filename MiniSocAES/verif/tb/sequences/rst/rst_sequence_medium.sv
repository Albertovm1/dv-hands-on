`ifndef RST_SEQUENCE_MEDIUM_SV
`define RST_SEQUENCE_MEDIUM_SV

class rst_sequence_medium extends rst_sequence_base;

    `uvm_object_utils(rst_sequence_medium)

    function new(string name = "rst_sequence_medium");
        super.new(name);
    endfunction

    virtual task body();

        `uvm_info("RST_MEDIUM", "Starting medium reset sequence", UVM_MEDIUM)

        apply_reset(100ns);

        `uvm_info("RST_MEDIUM", "Medium reset sequence completed", UVM_MEDIUM)

    endtask

endclass

`endif