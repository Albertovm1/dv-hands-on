`ifndef MEM_SEQUENCE_DATA_PATTERNS_SV
`define MEM_SEQUENCE_DATA_PATTERNS_SV

// memória utilizando quatro padrões de dados: todos os bits em 0, todos em 1 e dois padrões alternados. 
//Para cada padrão, realiza uma escrita e depois uma leitura no endereço 15. 
//Assim, verificamos se a memória armazena e recupera corretamente diferentes combinações de bits.

class mem_sequence_data_patterns extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_data_patterns)

    function new(string name = "mem_sequence_data_patterns");
        super.new(name);
    endfunction

    task body();    

        mem_seq_item req;

        bit [9:0] test_addr = 15;

        bit [31:0] test_patterns [4] = '{
            32'h00000000,
            32'hFFFFFFFF,
            32'hAAAAAAAA,
            32'h55555555
        };

        req = mem_seq_item::type_id::create("req");

        foreach (test_patterns[i]) begin

            // Write pattern
            start_item(req);

            req.op             = mem_seq_item::MEM_WRITE;
            req.addr           = test_addr;
            req.wdata          = test_patterns[i];
            req.mem_clk_period = 10ns;

            finish_item(req);

            // Read pattern
            start_item(req);

            req.op             = mem_seq_item::MEM_READ;
            req.addr           = test_addr;
            req.wdata          = '0;
            req.mem_clk_period = 10ns;

            finish_item(req);

        end

    endtask

endclass

`endif
