`ifndef MEM_IF_SV
`define MEM_IF_SV

interface mem_if;

    logic        mem_clk
    logic [31:0] mem_i_data;
    logic        mem_i_wr_en;
    logic [9:0]  mem_i_addr;
    logic [31:0] mem_o_data;

    modport driver (
        input  mem_clk,
        output mem_i_data,
        output mem_i_wr_en,
        output mem_i_addr,
        input  mem_o_data
    );

    modport monitor (
        input mem_clk,
        input mem_i_data,
        input mem_i_wr_en,
        input mem_i_addr,
        input mem_o_data
    );

endinterface
`endif