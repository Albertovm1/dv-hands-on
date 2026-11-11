`timescale 1ns/1ps

module minisoc_top_tb;

    import uvm_pkg::*;

    import clk_agent_pkg::*;
    import rst_agent_pkg::*;

    import minisoc_scoreboard_pkg::*;
    import minisoc_env_pkg::*;

    // Clock Interface
    clk_if clk_vif();

    //Reset Interface
    rst_if rst_vif();

    // Temporary signals for DUT inputs
    logic spi_sclk;
    logic spi_cs_n;
    logic spi_mosi;
    logic mem_clk;
    logic [31:0] mem_i_data;
    logic mem_i_wr_en;
    logic [9:0] mem_i_addr;

    logic spi_miso;
    logic [31:0] mem_o_data;

    // DUT
    minisoc_top dut (
        .clk        (clk_vif.clk),
        .rst_n      (rst_vif.rst_n),

        .spi_sclk   (spi_sclk),
        .spi_cs_n   (spi_cs_n),
        .spi_mosi   (spi_mosi),
        .spi_miso   (spi_miso),

        .mem_clk    (mem_clk),
        .mem_i_data (mem_i_data),
        .mem_i_wr_en(mem_i_wr_en),
        .mem_i_addr (mem_i_addr),
        .mem_o_data (mem_o_data)
    );

    
    initial begin

        // Initial values
        spi_sclk    = 0;
        spi_cs_n    = 1;
        spi_mosi    = 0;
        mem_clk     = 0;
        mem_i_data  = '0;
        mem_i_wr_en = 0;
        mem_i_addr  = '0;

        // Configure Clock Driver Virtual Interface
        uvm_config_db #(virtual clk_if.driver)::set(
            null,
            "uvm_test_top.env.clk_agent.driver",
            "vif",
            clk_vif
        );

        // Configure Clock Monitor Virtual Interface
        uvm_config_db #(virtual clk_if.monitor)::set(
            null,
            "uvm_test_top.env.clk_agent.monitor",
            "vif",
            clk_vif
        );

        // Configure Reset Driver Virtual Interface
        uvm_config_db #(virtual rst_if.driver)::set(
            null,
            "uvm_test_top.env.rst_agent.driver",
            "vif",
            rst_vif
        );

        // Configure Reset Monitor Virtual Interface
        uvm_config_db #(virtual rst_if.monitor)::set(
            null,
            "uvm_test_top.env.rst_agent.monitor",
            "vif",
            rst_vif
        );

        // Start UVM Test
        run_test("minisoc_smoke_test");

    end

    initial begin
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, minisoc_top_tb);
        $fsdbDumpMDA();
    end 

endmodule
