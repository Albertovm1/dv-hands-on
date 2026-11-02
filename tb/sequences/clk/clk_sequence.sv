`ifndef CLK_SEQUENCE_SV
`define CLK_SEQUENCE_SV

class clk_sequence extends uvm_sequence #(clk_seq_item);

    `uvm_object_utils(clk_sequence)

    // Interface virtual para observar o clock
    virtual clk_if.monitor vif;

    function new(string name = "clk_sequence");
        super.new(name);
    endfunction

    task body();

        realtime last_edge;
        realtime current_edge;
        realtime measured_period;
        realtime total_period;
        realtime average_period;

        real frequency_ghz;

        int num_cycles = 1;

        total_period = 0;

        // Recuperar a interface virtual
        if (!uvm_config_db#(virtual clk_if.monitor)::get(
                m_sequencer, "", "vif", vif)) begin

            `uvm_fatal("CLK_SEQ",
                "Interface virtual nao encontrada!")

        end

        // Aguardar a primeira borda de subida
        @(posedge vif.clk);
        last_edge = $realtime;

        for (int i = 0; i < num_cycles; i++) begin

            @(posedge vif.clk);

            current_edge = $realtime;

            measured_period = current_edge - last_edge;

            total_period += measured_period;

            // TESTE 1: Verificar periodo
            if (measured_period != 500ps) begin

                `uvm_error("CLK_PERIOD_CHECK",
                    $sformatf(
                        "Periodo incorreto! Esperado: 500ps | Medido: %0t",
                        measured_period
                    ))

            end
            else begin

                `uvm_info("CLK_PERIOD_CHECK",
                    $sformatf(
                        "Periodo correto: %0t",
                        measured_period
                    ),
                    UVM_MEDIUM)

            end

            last_edge = current_edge;

        end

        // Calcular periodo medio
        average_period = total_period / num_cycles;

        // Calcular frequencia em GHz
        frequency_ghz = 1.0 / (average_period / 1ns);

        // TESTE 2: Verificar frequencia
        if (frequency_ghz < 1.999 || frequency_ghz > 2.001) begin

            `uvm_error("CLK_FREQ_CHECK",
                $sformatf(
                    "Frequencia incorreta! Esperado: 2 GHz | Medido: %0.3f GHz",
                    frequency_ghz
                ))

        end
        else begin

            `uvm_info("CLK_FREQ_CHECK",$sformatf("Frequencia correta: %0.3f GHz",frequency_ghz),UVM_MEDIUM)

        end

        `uvm_info("CLK_SEQ",
            $sformatf("Verificacao concluida: %0d ciclos | Periodo medio: %0t | Frequencia: %0.3f GHz",num_cycles,average_period,frequency_ghz),UVM_LOW)

    endtask

endclass

`endif
