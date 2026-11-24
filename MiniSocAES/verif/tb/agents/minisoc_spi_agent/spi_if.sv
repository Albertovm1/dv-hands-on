`ifndef SPI_IF_SV
`define SPI_IF_SV

interface spi_if;

    logic  spi_sclk;
    logic  spi_cs_n;
    logic  spi_mosi;
    logic  spi_miso;

    modport driver(

        output spi_sclk,
        output spi_cs_n,
        output spi_mosi,
        input  spi_miso
    );

    modport monitor(

        input spi_sclk,
        input spi_cs_n,
        input spi_mosi,
        input spi_miso
    );

endinterface
`endif