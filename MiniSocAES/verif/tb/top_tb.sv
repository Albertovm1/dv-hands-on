`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "refmod/aes_lib.svh"
`include "agents/clock_agent/clk_if.sv"
`include "agents/rst_agent/rst_if.sv"
`include "tests/smoke_test.sv"

module top_tb;

  // 1. Instância dos VIPs de Clock e Reset
  clk_if clk_vif();
  rst_if rst_vif();

  wire clk   = clk_vif.clk;
  wire rst_n = rst_vif.rst_n;

  // Sinais passivos das interfaces externas
  logic        spi_sclk = 0;
  logic        spi_cs_n = 1;
  logic        spi_mosi = 0;
  wire         spi_miso;

  logic        mem_clk = 0;
  logic [31:0] mem_i_data = '0;
  logic        mem_i_wr_en = 0;
  logic [9:0]  mem_i_addr = '0;
  wire  [31:0] mem_o_data;

  always #10ns mem_clk = ~mem_clk;

  // 2. Instância do Hardware (minisoc_top)
  minisoc_top dut (
    .clk          (clk),
    .rst_n        (rst_n),
    .spi_sclk     (spi_sclk),
    .spi_cs_n     (spi_cs_n),
    .spi_mosi     (spi_mosi),
    .spi_miso     (spi_miso),
    .mem_clk      (mem_clk),
    .mem_i_data   (mem_i_data),
    .mem_i_wr_en  (mem_i_wr_en),
    .mem_i_addr   (mem_i_addr),
    .mem_o_data   (mem_o_data)
  );

  // Mapeamento dos sinais internos para SVA
  wire mem_sel_aes  = dut.spi_cfg_mem_sel_aes;
  wire busy         = dut.aes_busy_sys;
  wire pll_enable   = dut.spi_cfg_pll_enable;
  wire pll_locked   = dut.pll_locked;
  wire status_done  = dut.aes_done_sys;
  wire status_error = dut.aes_error_sys;

  // 3. Conexão do Módulo de Asserções SVA
  top_assertions sva_inst (
    .clk          (clk),
    .rst_n        (rst_n),
    .mem_sel_aes  (mem_sel_aes),
    .busy         (busy),
    .pll_enable   (pll_enable),
    .pll_locked   (pll_locked),
    .status_done  (status_done),
    .status_error (status_error)
  );

  // 4. Configuração UVM e Execução
  initial begin
    $dumpfile("sim_build/wave.vcd");
    $dumpvars(0, top_tb);

    // Disponibiliza as interfaces físicas para o ambiente UVM
    uvm_config_db#(virtual clk_if)::set(null, "*", "clk_vif", clk_vif);
    uvm_config_db#(virtual rst_if)::set(null, "*", "rst_vif", rst_vif);

    // Inicia o teste UVM especificado
    run_test("smoke_test");
  end

  initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars(0, top_tb);
  end

endmodule : top_tb
