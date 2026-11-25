`ifndef SPI_REFMOD_DPI_SV
`define SPI_REFMOD_DPI_SV

package spi_refmod_dpi_pkg;

    import "DPI-C" function void spi_ref_init();

    import "DPI-C" function void spi_ref_reset();

    import "DPI-C" function void spi_ref_write(
        input byte unsigned addr,
        input int unsigned data
    );

    import "DPI-C" function int unsigned spi_ref_read(
        input byte unsigned addr
    );

    import "DPI-C" function int unsigned spi_ref_get_expected(
        input byte unsigned addr
    );

endpackage

`endif
