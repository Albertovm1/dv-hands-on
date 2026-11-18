`ifndef MEM_SEQUENCE_OVERWRITE_SV
`define MEM_SEQUENCE_OVERWRITE_SV

class mem_sequence_overwrite extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_overwrite)

    function new(string name = "mem_sequence_overwrite");
        super.new(name);
    endfunction

    task body();

        mem_seq_item req;

        bit [9:0] test_addr = 15;

        req = mem_seq_item::type_id::create("req");

        // First write
        start_item(req);

        req.op             = mem_seq_item::MEM_WRITE;
        req.addr           = test_addr;
        req.wdata          = 32'h11111111;
        req.mem_clk_period = 10ns;

        finish_item(req);

        // First read
        start_item(req);

        req.op             = mem_seq_item::MEM_READ;
        req.addr           = test_addr;
        req.wdata          = '0;
        req.mem_clk_period = 10ns;

        finish_item(req);

        // Overwrite
        start_item(req);

        req.op             = mem_seq_item::MEM_WRITE;
        req.addr           = test_addr;
        req.wdata          = 32'h22222222;
        req.mem_clk_period = 10ns;

        finish_item(req);

        // Second read
        start_item(req);

        req.op             = mem_seq_item::MEM_READ;
        req.addr           = test_addr;
        req.wdata          = '0;
        req.mem_clk_period = 10ns;

        finish_item(req);

    endtask

endclass

`endif
