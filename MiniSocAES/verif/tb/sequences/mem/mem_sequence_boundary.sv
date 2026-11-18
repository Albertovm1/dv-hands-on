`ifndef MEM_SEQUENCE_BOUNDARY_SV
`define MEM_SEQUENCE_BOUNDARY_SV

class mem_sequence_boundary extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_boundary)

    function new(string name = "mem_sequence_boundary");
        super.new(name);
    endfunction

    task body();

        mem_seq_item req;

        bit [9:0] test_addr [2] = '{10'd0, 10'd1023};

        bit [31:0] test_data [2] = '{
            32'h12345678,
            32'hABCDEF01
        };

        req = mem_seq_item::type_id::create("req");

        foreach (test_addr[i]) begin

            start_item(req);

            req.op             = mem_seq_item::MEM_WRITE;
            req.addr           = test_addr[i];
            req.wdata          = test_data[i];
            req.mem_clk_period = 10ns;

            finish_item(req);

        end

        foreach (test_addr[i]) begin

            start_item(req);

            req.op             = mem_seq_item::MEM_READ;
            req.addr           = test_addr[i];
            req.wdata          = '0;
            req.mem_clk_period = 10ns;

            finish_item(req);

        end

    endtask

endclass

`endif
