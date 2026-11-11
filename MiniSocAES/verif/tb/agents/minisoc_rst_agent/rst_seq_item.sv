`ifndef RST_SEQ_ITEM_SV
`define RST_SEQ_ITEM_SV

class rst_seq_item extends uvm_sequence_item;
    
    typedef enum {
        ASSERT_RESET,
        DEASSERT_RESET
    } rst_cmd_e;

    rand rst_cmd_e rst_cmd;
    rand time duration;

    `uvm_object_utils(rst_seq_item)

    function new(string name = rst_seq_item::get_type_name());
        super.new(name);
    endfunction
    
endclass
`endif