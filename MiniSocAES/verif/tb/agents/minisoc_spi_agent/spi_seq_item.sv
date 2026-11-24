`ifndef SPI_SEQ_ITEM_SV
`define SPI_SEQ_ITEM_SV

class spi_seq_item extends uvm_sequence_item;

    typedef enum {
        SPI_WRITE,
        SPI_READ
    } spi_operation_e;

    rand spi_operation_e op;
    rand logic [5:0]     addr;
    rand logic [31:0]    wdata;
         logic [31:0]    rdata;

    rand time spi_clk_period;

    `uvm_object_utils(spi_seq_item)

    function new(string name = "spi_seq_item");
        super.new(name);
    endfunction

endclass

`endif