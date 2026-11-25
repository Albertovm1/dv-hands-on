`ifndef SPI_SEQUENCE_BASIC_SV
`define SPI_SEQUENCE_BASIC_SV

class spi_sequence_basic extends uvm_sequence #(spi_seq_item);

    `uvm_object_utils(spi_sequence_basic)

    function new(string name = "spi_sequence_basic");
        super.new(name);
    endfunction

    task body();

        spi_seq_item req;

        req = spi_seq_item::type_id::create("req_write");

        start_item(req);

        if (!req.randomize() with {
            op == spi_seq_item::SPI_WRITE;
            addr == 6'h05;
            wdata == 32'h12345678;
        })
            `uvm_fatal("SPI_SEQUENCE", "Failed to randomize SPI WRITE")

        req.spi_clk_period = 40ns;

        finish_item(req);

        req = spi_seq_item::type_id::create("req_read");

        start_item(req);

        if (!req.randomize() with {
            op == spi_seq_item::SPI_READ;
            addr == 6'h05;
        })
            `uvm_fatal("SPI_SEQUENCE", "Failed to randomize SPI READ")

        req.spi_clk_period = 40ns;

        finish_item(req);

    endtask

endclass

`endif
