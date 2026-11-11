`ifndef RST_SEQUENCE_SV
`define RST_SEQUENCE_SV

class rst_sequence_base extends uvm_sequence #(rst_seq_item);

    `uvm_object_utils(rst_sequence_base)

    function new(string name = "rst_sequence");
        super.new(name);
    endfunction 


    task apply_reset(time reset_duration);
        
        rst_seq_item item;

        req = rst_seq_item::type_id::create("assert_req");

        start_item(req);
        req.rst_cmd = rst_seq_item::ASSERT_RESET;
        req.duration = reset_duration;
        finish_item(req);

        req = rst_seq_item::type_id::create("deassert_req");

        start_item(req);
        req.rst_cmd = rst_seq_item::DEASSERT_RESET;
        req.duration = 10ns;
        finish_item(req);

    endtask

endclass

`endif
