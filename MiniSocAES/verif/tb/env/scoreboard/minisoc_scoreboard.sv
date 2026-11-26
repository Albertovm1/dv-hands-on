`ifndef MINISOC_SCOREBOARD_SV
`define MINISOC_SCOREBOARD_SV

// Use uvm_tlm_analysis_fifo

`uvm_analysis_imp_decl(_clk)
`uvm_analysis_imp_decl(_rst)
`uvm_analysis_imp_decl(_mem)
`uvm_analysis_imp_decl(_spi)

class minisoc_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(minisoc_scoreboard)

    uvm_analysis_imp_clk #(clk_mon_item, minisoc_scoreboard) clk_monitor_export;
    uvm_analysis_imp_rst #(rst_seq_item, minisoc_scoreboard) rst_monitor_export;
    uvm_analysis_imp_mem #(mem_seq_item, minisoc_scoreboard) mem_monitor_export;
    uvm_analysis_imp_spi #(spi_seq_item, minisoc_scoreboard) spi_monitor_export;

    time expected_period = 500ps;

    int unsigned pass_count;
    int unsigned fail_count;
    int unsigned total_count;

     // Reference Model
    logic [31:0] ref_mem [0:1023];
    bit ref_mem_valid [0:1023];

    function new(string name = "minisoc_scoreboard",uvm_component parent = null);
        super.new(name, parent);

        clk_monitor_export = new("clk_monitor_export", this);
        rst_monitor_export = new("rst_monitor_export", this);
        mem_monitor_export = new("mem_monitor_export", this);
        spi_monitor_export = new("spi_monitor_export", this);

        pass_count = 0;
        fail_count = 0;

    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        mem_refmod_init();
        spi_ref_init();
    endfunction

    //scoreboard CLK
    function void write_clk(clk_mon_item item);

        if (item.measured_period == expected_period) begin
            pass_count++;
            `uvm_info("SCOREBOARD",$sformatf("PASS: Periodo correto: %0t",item.measured_period),UVM_HIGH)
        end
        else begin
            fail_count++;
            `uvm_error("SCOREBOARD",$sformatf("FAIL: Periodo esperado: %0t | Periodo medido: %0t",expected_period,item.measured_period))
        end
    endfunction

    //scoreboard RST
    function void write_rst(rst_seq_item item);

        case (item.rst_cmd)

            rst_seq_item::ASSERT_RESET: begin

                `uvm_info("SCOREBOARD",
                    "Reset ASSERTED: rst_n = 0",
                    UVM_MEDIUM)

            end

            rst_seq_item::DEASSERT_RESET: begin

                `uvm_info("SCOREBOARD",
                    "Reset DEASSERTED: rst_n = 1",
                    UVM_MEDIUM)

            end
        endcase
    endfunction

    //scoreboard Memory

    function void write_mem(mem_seq_item item);

        int unsigned expected_data;
        int valid;

        case (item.op)

            mem_seq_item::MEM_WRITE: begin

                mem_refmod_write(item.addr, item.wdata);

                `uvm_info("MEM_SCOREBOARD",
                    $sformatf("WRITE: addr=0x%0h data=0x%0h",
                    item.addr, item.wdata), UVM_MEDIUM)

            end

            mem_seq_item::MEM_READ: begin

                valid = mem_refmod_read(item.addr, expected_data);

                if (!valid) begin

                    fail_count++;

                    `uvm_error("MEM_SCOREBOARD",
                        $sformatf("READ: endereco 0x%0h nao inicializado",
                        item.addr))

                end

                else if (expected_data === item.rdata) begin

                    pass_count++;

                    `uvm_info("MEM_SCOREBOARD",
                        $sformatf("READ PASS: addr=0x%0h expected=0x%0h actual=0x%0h",
                        item.addr, expected_data, item.rdata), UVM_MEDIUM)

                end

                else begin

                    fail_count++;

                    `uvm_error("MEM_SCOREBOARD",
                        $sformatf("READ FAIL: addr=0x%0h expected=0x%0h actual=0x%0h",
                        item.addr, expected_data, item.rdata))

                end

            end

        endcase
    endfunction

    // SPI SCOREBOARD
    function void write_spi(spi_seq_item item);

        int unsigned expected_data;

        case (item.op)

            // SPI WRITE
            spi_seq_item::SPI_WRITE: begin

                spi_ref_write(item.addr, item.wdata);

                `uvm_info("SPI_SCOREBOARD",
                    $sformatf("WRITE: addr=0x%0h data=0x%0h",
                    item.addr, item.wdata), UVM_MEDIUM)

            end

            // SPI READ
            spi_seq_item::SPI_READ: begin

                expected_data = spi_ref_read(item.addr);

                if (expected_data === item.rdata) begin

                    pass_count++;

                    `uvm_info("SPI_SCOREBOARD",
                        $sformatf("READ PASS: addr=0x%0h expected=0x%0h actual=0x%0h",
                        item.addr, expected_data, item.rdata),
                        UVM_MEDIUM)

                end

                else begin

                    fail_count++;

                    `uvm_error("SPI_SCOREBOARD",
                        $sformatf("READ FAIL: addr=0x%0h expected=0x%0h actual=0x%0h",
                        item.addr, expected_data, item.rdata))

                end

            end

            default: begin

                fail_count++;

                `uvm_error("SPI_SCOREBOARD",
                    "Invalid SPI operation received!")

            end

        endcase

    endfunction

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);

        total_count = pass_count + fail_count;

        `uvm_info("MINISOC_SCOREBOARD","============== SCOREBOARD ==============",UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("Total checks: %0d", total_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("PASS: %0d", pass_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD",$sformatf("FAIL: %0d", fail_count),UVM_NONE)

        `uvm_info("MINISOC_SCOREBOARD","========================================",UVM_NONE)

    endfunction

endclass

`endif