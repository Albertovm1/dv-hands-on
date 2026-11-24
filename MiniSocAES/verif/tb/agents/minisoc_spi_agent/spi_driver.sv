`ifndef SPI_DRIVER_SV
`define SPI_DRIVER_SV

class spi_driver extends uvm_driver #(spi_seq_item);

    `uvm_component_utils(spi_driver)

    virtual spi_if.driver vif;

    function new(string name = "spi_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual spi_if.driver)::get(this, "", "vif", vif))
            `uvm_fatal("SPI_DRIVER", "Virtual interface not found!")
    endfunction

    task run_phase(uvm_phase phase);

        spi_seq_item req;
        
        time half_period;
        
        logic [39:0] frame;
        // frame = {RWb,ADDR,RSV,DATA};

        // RWb = 0 = WRITE; 1 = READ request.
        // ADDR = Endereço de 6 bits do registrador SPI.
        // RSV = Reservado; deve ser enviado como 0.
        // DATA = Payload de 32 bits para escrita; ignorado durante o READ request.


        vif.spi_sclk = 0;
        vif.spi_cs_n = 1;
        vif.spi_mosi = 0;

        forever begin
            
            seq_item_port.get_next_item(req);

            half_period = req.spi_clk_period / 2;

            if (req.op == spi_seq_item::SPI_WRITE)begin

                frame = {0, req.addr,0,req.wdata};

                vif.spi_cs_n = 0;

                for (int i = 39; i >= 0; i--) begin
                    
                    vif.spi_mosi = frame[i];

                    #(half_period);

                    vif.spi_sclk = 1;
                    #(half_period);

                    vif.spi_sclk = 0;

                end

                vif.spi_cs_n = 1;
            
            end

            else if (req.op == spi_seq_item::SPI_READ)begin

                frame = {1, req.addr,0,0};

                vif.spi_cs_n = 1;

                for (int i = 39; i >= 0; i--) begin
                    
                    vif.spi_mosi = frame[i];

                    #(half_period);

                    vif.spi_sclk = 1;
                    #(half_period);

                    vif.spi_sclk = 0;

                end
            end

            else begin
                `uvm_fatal("SPI_DRIVER", "Invalid SPI operation")
            end

            seq_item_port.item_done();


        end
    endtask

endclass
`endif