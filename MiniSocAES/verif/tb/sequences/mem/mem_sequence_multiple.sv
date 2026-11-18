`ifndef MEM_SEQUENCE_MULTIPLE_SV
`define MEM_SEQUENCE_MULTIPLE_SV

class mem_sequence_multiple extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_multiple)

    function new(string name = "mem_sequence_multiple");
        super.new(name);
    endfunction

    task body();

        mem_seq_item req;

        bit [9:0] test_addr [4] = '{10, 20, 30, 40};

        bit [31:0] test_data [4] = '{
            32'h12345678,
            32'hABCDEF01,
            32'h87654321,
            32'h55555555
        };

        req = mem_seq_item::type_id::create("req");

        foreach (test_addr[i]) begin

            start_item(req);

            req.op              = mem_seq_item::MEM_WRITE;
            req.addr            = test_addr[i];
            req.wdata           = test_data[i];
            req.mem_clk_period  = 10ns;

            finish_item(req);

        end

        foreach (test_addr[i]) begin

            start_item(req);

            req.op              = mem_seq_item::MEM_READ;
            req.addr            = test_addr[i];
            req.wdata           = '0;
            req.mem_clk_period  = 10ns;

            finish_item(req);

        end

    endtask

endclass

`endif
