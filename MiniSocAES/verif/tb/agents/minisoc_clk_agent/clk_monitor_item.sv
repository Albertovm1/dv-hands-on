`ifndef CLK_MONITOR_ITEM_SV
`define CLK_MONITOR_ITEM_SV

class clk_monitor_item extends uvm_sequence_item;

    `uvm_object_utils(clk_monitor_item)

    // Observed clock information
    time last_rising_edge;
    time current_rising_edge;
    time measured_period;

    function new(string name = "clk_monitor_item");
        super.new(name);
    endfunction

endclass

`endif