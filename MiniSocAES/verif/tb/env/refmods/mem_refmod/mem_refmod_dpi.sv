`ifndef MEM_REFMOD_DPI_SV
`define MEM_REFMOD_DPI_SV

package mem_refmod_dpi_pkg;

    import "DPI-C" function void mem_refmod_init();

    import "DPI-C" function void mem_refmod_write(
        input int unsigned addr,
        input int unsigned data
    );

    import "DPI-C" function int mem_refmod_read(
        input int unsigned addr,
        output int unsigned expected_data
    );

endpackage

`endif