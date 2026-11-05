`ifndef CLK_MON_ITEM_SV
`define CLK_MON_ITEM_SV

class clk_mon_item extends uvm_sequence_item;

    `uvm_object_utils(clk_mon_item)

    time measured_period;
    time high_time;
    time low_time;

    int unsigned rising_edge_count;

    function new(string name = "clk_mon_item");
        super.new(name);
    endfunction

endclass

`endif