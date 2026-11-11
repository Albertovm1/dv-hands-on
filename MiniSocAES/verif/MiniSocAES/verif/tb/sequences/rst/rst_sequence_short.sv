`ifndef RST_SEQUENCE_SHORT_SV
`define RST_SEQUENCE_SHORT_SV

class rst_sequence_short extends rst_sequence_base;

    `uvm_object_utils(rst_sequence_short)

    function new(string name = "rst_sequence_short");
        super.new(name);
    endfunction

    virtual task body();

        `uvm_info("RST_SHORT", "Starting short reset sequence", UVM_MEDIUM)

        apply_reset(10ns);

        `uvm_info("RST_SHORT", "Short reset sequence completed", UVM_MEDIUM)

    endtask

endclass

`endif
