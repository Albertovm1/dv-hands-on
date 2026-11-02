`ifndef RST_IF_SV
`define RST_IF_SV

interface rst_if;

    logic rst_n;
    
    modport driver (
        output rst_n
    );

    modport monitor (
        input rst_n
    );

endinterface

`endif