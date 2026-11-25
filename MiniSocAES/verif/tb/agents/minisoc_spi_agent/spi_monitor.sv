`ifndef SPI_MONITOR_SV
`define SPI_MONITOR_SV

class spi_monitor extends uvm_monitor;

    `uvm_component_utils(spi_monitor)

    virtual spi_if.monitor vif;

    uvm_analysis_port #(spi_seq_item) analysis_port;

    function new(string name = "spi_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual spi_if.monitor)::get(this, "", "vif", vif))
            `uvm_fatal("SPI_MONITOR", "Virtual interface not found!")

        analysis_port = new("analysis_port", this);
    endfunction

    task run_phase(uvm_phase phase);

        spi_seq_item item;

        logic [39:0] rx_frame;
        logic [39:0] tx_frame;

        bit read_pending;
        logic [5:0] pending_addr;

        read_pending = 0;
        pending_addr = '0;

        forever begin

            // Espera o inicio de uma transacao SPI
            wait (vif.spi_cs_n == 0);

            rx_frame = '0;
            tx_frame = '0;

            // Captura os 40 bits do frame
            for (int i = 39; i >= 0; i--) begin

                @(posedge vif.spi_sclk);

                rx_frame[i] = vif.spi_mosi;
                tx_frame[i] = vif.spi_miso;

            end

            // READ REQUEST
            if (rx_frame[39] == 1'b1) begin

                read_pending = 1;
                pending_addr = rx_frame[38:33];

            end

            // NOP: recebe o resultado da leitura
            else if (rx_frame[38:33] == 6'h3F) begin

                if (read_pending) begin

                    item = spi_seq_item::type_id::create("item");

                    item.op    = spi_seq_item::SPI_READ;
                    item.addr  = pending_addr;
                    item.wdata = '0;
                    item.rdata = tx_frame[31:0];

                    analysis_port.write(item);

                    read_pending = 0;

                end

            end

            // WRITE
            else begin

                item = spi_seq_item::type_id::create("item");

                item.op    = spi_seq_item::SPI_WRITE;
                item.addr  = rx_frame[38:33];
                item.wdata = rx_frame[31:0];
                item.rdata = '0;

                analysis_port.write(item);

            end

            // Espera o fim do frame
            @(posedge vif.spi_cs_n);

        end

    endtask

endclass
`endif