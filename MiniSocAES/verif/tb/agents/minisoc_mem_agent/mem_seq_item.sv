`ifndef MEM_SEQ_ITEM_SV
`define MEM_SEQ_ITEM_SV

class mem_seq_item extends uvm_sequence_item;

    typedef enum logic {
        MEM_READ  = 1'b0,
        MEM_WRITE = 1'b1
    } mem_op_e;

    // Transaction fields
    rand mem_op_e        op; // operação
    rand bit      [9:0]  addr; // endereço
    rand bit      [31:0] wdata; // dados de escrita
    bit           [31:0] rdata; // dados de leitura
    
    rand time mem_clk_period;

    // Clock da interface externa de memória até 200MHz
    constraint c_mem_clk_period {
        mem_clk_period inside {[5000:20000]};
    }

    `uvm_object_utils(mem_seq_item)

    function new(string name = "mem_seq_item");
        super.new(name);
    endfunction

endclass

`endif
