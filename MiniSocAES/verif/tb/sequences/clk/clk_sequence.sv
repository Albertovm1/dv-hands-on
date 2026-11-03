`ifndef CLK_SEQUENCE_SV
`define CLK_SEQUENCE_SV

class clk_sequence extends uvm_sequence #(clk_seq_item);

    `uvm_object_utils(clk_sequence)

    function new(string name = "clk_sequence");
        super.new(name);
    endfunction

    task body();

        clk_seq_item req;

        req = clk_seq_item::type_id::create("req");

        start_item(req);

        req.clk_period = 500ps;

        finish_item(req);

    endtask

endclass

`endif