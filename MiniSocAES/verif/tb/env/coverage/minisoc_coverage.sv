`ifndef MINISOC_COVERAGE_SV
`define MINISOC_COVERAGE_SV

`uvm_analysis_imp_decl(_clk_cov)
`uvm_analysis_imp_decl(_rst_cov)
`uvm_analysis_imp_decl(_mem_cov)
`uvm_analysis_imp_decl(_spi_cov)

class minisoc_coverage extends uvm_component;

    `uvm_component_utils(minisoc_coverage)

    uvm_analysis_imp_clk_cov #(clk_mon_item, minisoc_coverage) clk_analysis_export;
    uvm_analysis_imp_rst_cov #(rst_seq_item, minisoc_coverage) rst_analysis_export;
    uvm_analysis_imp_mem_cov #(mem_seq_item, minisoc_coverage) mem_analysis_export;
    uvm_analysis_imp_spi_cov #(spi_seq_item, minisoc_coverage) spi_analysis_export;


    time measured_period;
    time high_time;
    time low_time;

    mem_seq_item::mem_op_e mem_op;

    bit [9:0]  mem_addr;
    bit [31:0] mem_wdata;
    bit [31:0] mem_rdata;

    rst_seq_item::rst_cmd_e rst_cmd;
    
    //SPI
    int unsigned spi_op;

    bit [5:0]  spi_addr;
    bit [31:0] spi_wdata;
    bit [31:0] spi_rdata;

    covergroup clk_cov;

        period_cov: coverpoint measured_period {
            bins period_500ps = {500};
        }

        duty_cycle_cov: coverpoint high_time {
            bins duty_50 = {250};
        }

    endgroup

    covergroup rst_cov;

        reset_cmd_cov: coverpoint rst_cmd {

            bins reset_asserted = {
                rst_seq_item::ASSERT_RESET
            };

            bins reset_deasserted = {
                rst_seq_item::DEASSERT_RESET
            };

            bins assert_to_deassert = (
                rst_seq_item::ASSERT_RESET =>
                rst_seq_item::DEASSERT_RESET
            );

            bins deassert_to_assert = (
                rst_seq_item::DEASSERT_RESET =>
                rst_seq_item::ASSERT_RESET
            );
        }
    endgroup

    covergroup mem_cov;

        // Tipo de operação
        operation_cov: coverpoint mem_op {
            bins read  = {mem_seq_item::MEM_READ};
            bins write = {mem_seq_item::MEM_WRITE};
        }

        operation_sequence_cov: coverpoint mem_op {
            bins write_then_read = (
                mem_seq_item::MEM_WRITE =>
                mem_seq_item::MEM_READ
            );
        }

        // Regiões de endereço
        address_cov: coverpoint mem_addr {
            bins low      = {[0:255]};
            bins mid_low  = {[256:511]};
            bins mid_high = {[512:767]};
            bins high     = {[768:1023]};
        }

        // Padrões de dados escritos
        write_data_cov: coverpoint mem_wdata iff (mem_op == mem_seq_item::MEM_WRITE) {
            bins zero       = {32'h00000000};
            bins ones       = {32'hFFFFFFFF};
            bins alternating_aa = {32'hAAAAAAAA};
            bins alternating_55 = {32'h55555555};
        }

        // Padrões de dados lidos
        read_data_cov: coverpoint mem_rdata iff (mem_op == mem_seq_item::MEM_READ) {
            bins zero       = {32'h00000000};
            bins ones       = {32'hFFFFFFFF};
            bins alternating_aa = {32'hAAAAAAAA};
            bins alternating_55 = {32'h55555555};
        }

        // Operação x região de endereço
        operation_address_cross: cross operation_cov, address_cov;

    endgroup

    covergroup spi_cov;

        // Tipo de operação SPI
        operation_cov: coverpoint spi_op {

            bins write = {spi_seq_item::SPI_WRITE};
            bins read  = {spi_seq_item::SPI_READ};

        }

        // Sequência WRITE seguida de READ
        operation_sequence_cov: coverpoint spi_op {

            bins write_then_read = (
                spi_seq_item::SPI_WRITE =>
                spi_seq_item::SPI_READ
            );

        }

        // Regiões de endereço SPI (6 bits)
        address_cov: coverpoint spi_addr {

            bins low  = {[0:15]};
            bins mid  = {[16:31]};
            bins high = {[32:47]};
            bins top  = {[48:63]};

        }

        // Padrões de dados escritos
        write_data_cov: coverpoint spi_wdata
            iff (spi_op == spi_seq_item::SPI_WRITE) {

            bins zero = {32'h00000000};
            bins ones = {32'hFFFFFFFF};
            bins alternating_aa = {32'hAAAAAAAA};
            bins alternating_55 = {32'h55555555};

        }

        // Padrões de dados lidos
        read_data_cov: coverpoint spi_rdata
            iff (spi_op == spi_seq_item::SPI_READ) {

            bins zero = {32'h00000000};
            bins ones = {32'hFFFFFFFF};
            bins alternating_aa = {32'hAAAAAAAA};
            bins alternating_55 = {32'h55555555};

        }

        // Operação x região de endereço
        operation_address_cross: cross operation_cov, address_cov;

    endgroup

    function new(string name = "minisoc_coverage",uvm_component parent = null);
        super.new(name, parent);
        clk_analysis_export = new("clk_analysis_export", this);
        rst_analysis_export = new("rst_analysis_export", this);
        mem_analysis_export = new("mem_analysis_export", this);
        spi_analysis_export = new("spi_analysis_export", this);

        clk_cov = new();
        rst_cov = new();
        mem_cov = new();
        spi_cov = new();

    endfunction

    function void write_clk_cov(clk_mon_item item);

        measured_period = item.measured_period;
        high_time       = item.high_time;
        low_time        = item.low_time;

        clk_cov.sample();

    endfunction

    function void write_rst_cov(rst_seq_item item);

        rst_cmd = item.rst_cmd;

        rst_cov.sample();

    endfunction

    function void write_mem_cov(mem_seq_item item);

        mem_op    = item.op;
        mem_addr  = item.addr;

        if (item.op == mem_seq_item::MEM_WRITE)
            mem_wdata = item.wdata;

        else if (item.op == mem_seq_item::MEM_READ)
            mem_rdata = item.rdata;

        mem_cov.sample();

    endfunction

    function void write_spi_cov(spi_seq_item item);

        spi_op   = item.op;
        spi_addr = item.addr;

        if (item.op == spi_seq_item::SPI_WRITE)
            spi_wdata = item.wdata;

        else if (item.op == spi_seq_item::SPI_READ)
            spi_rdata = item.rdata;

        spi_cov.sample();

    endfunction

    function void report_phase(uvm_phase phase);

        super.report_phase(phase);

        `uvm_info("MINISOC_COVERAGE", $sformatf("Clock Coverage: %0.2f%%", clk_cov.get_coverage()), UVM_NONE)

        `uvm_info("MINISOC_COVERAGE",$sformatf("Reset Coverage: %0.2f%%",rst_cov.get_coverage()), UVM_NONE)
    
        `uvm_info("MINISOC_COVERAGE",$sformatf("Memory Coverage: %0.2f%%",mem_cov.get_coverage()), UVM_NONE)

        `uvm_info("MINISOC_COVERAGE",$sformatf("SPI Coverage: %0.2f%%",spi_cov.get_coverage()), UVM_NONE)

    endfunction

endclass 

`endif