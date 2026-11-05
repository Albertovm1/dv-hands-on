`ifndef CLK_MONITOR_SV
`define CLK_MONITOR_SV

class clk_monitor extends uvm_monitor;

    `uvm_component_utils(clk_monitor)

    virtual clk_if.monitor vif;

    uvm_analysis_port #(clk_mon_item) analysis_port;

    clk_mon_item item;

    time last_rising_edge;
    time current_rising_edge;
    time last_falling_edge;
    time current_falling_edge;
    time measured_period;
    time high_time;
    time low_time;

    int unsigned rising_edge_count;

    function new(string name = "clk_monitor",uvm_component parent = null);
        super.new(name, parent);

        analysis_port = new("analysis_port", this);

        last_rising_edge = 0;
        current_rising_edge = 0;

        last_falling_edge = 0;
        current_falling_edge = 0;

        measured_period = 0;
        rising_edge_count = 0;

        high_time = 0;
        low_time = 0;

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if (!uvm_config_db#(virtual clk_if.monitor)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CLK_MONITOR", "Virtual interface nao encontrada!")
        end

    endfunction

    task run_phase(uvm_phase phase);

        super.run_phase(phase);

        forever begin

            @(posedge vif.clk);

            current_rising_edge = $time;
            rising_edge_count++;

            if (rising_edge_count > 1) begin

                measured_period = current_rising_edge - last_rising_edge;

                low_time = current_rising_edge - last_falling_edge;

                item = clk_mon_item::type_id::create("item");

                item.measured_period = measured_period;
                item.high_time = high_time;
                item.low_time = low_time;
                item.rising_edge_count = rising_edge_count;

                analysis_port.write(item);

                `uvm_info("CLK_MONITOR",
                    $sformatf(
                        "Borda: %0d | Periodo: %0t | HIGH: %0t | LOW: %0t",
                        rising_edge_count,
                        measured_period,
                        high_time,
                        low_time
                    ),
                    UVM_HIGH
                )

            end

            last_rising_edge = current_rising_edge;

            @(negedge vif.clk);

            current_falling_edge = $time;
            high_time = current_falling_edge - last_rising_edge;
            last_falling_edge = current_falling_edge;

        end

    endtask

endclass

`endif