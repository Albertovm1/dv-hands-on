`ifndef CLK_SEQ_ITEM_SV
`define CLK_SEQ_ITEM_SV

class clk_seq_item extends uvm_sequence_item;
    
    `uvm_object_utils(clk_seq_item)

    time clk_period = 500ps;

    function new(string name = clk_seq_item::get_type_name());
        super.new(name);
    endfunction
    
endclass

`endif