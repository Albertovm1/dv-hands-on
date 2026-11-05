`ifndef CLK_IF_SV
`define CLK_IF_SV

interface clk_if;

    timeunit 1ps;
    timeprecision 1ps;

    logic clk;
    
    modport driver ( //Sinais que o driver pode gerar
        output clk
    );

    modport monitor ( //Sinais que o monitor pode observar
        input clk
    );

endinterface

`endif