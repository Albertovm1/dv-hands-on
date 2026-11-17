`ifndef MEM_SEQUENCE_BASIC_SV
`define MEM_SEQUENCE_BASIC_SV

class mem_sequence_basic extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_basic)

    function new(string name = "mem_sequence_basic");
        super.new(name);
    endfunction

    task body();

        mem_seq_item req;

        bit [9:0] test_addr = 15;

        req = mem_seq_item::type_id::create("req");

        start_item(req);

        req.op         = mem_seq_item::MEM_WRITE;
        req.addr       = test_addr;
        req.wdata      = 120;
        mem_clk_period = 10ns;
        
        finish_item(req);

        //-------------------------------------------------

        start_item(req);

        req.op   = mem_seq_item::MEM_READ;
        req.addr = test_addr;

        finish_item(req);

    endtask

endclass
`endif