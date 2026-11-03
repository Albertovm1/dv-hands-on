`ifndef CLK_MONITOR_SV
`define CLK_MONITOR_SV

class clk_monitor extends uvm_monitor;

    `uvm_component_utils(clk_monitor)

    virtual clk_if.monitor vif;

    clk_monitor_item item;

    realtime last_rising_edge; //última borda de subida. 
    realtime current_rising_edge; // borda de subida atual.
    int measured_period; // período medido entre as bordas de subida.

    bit first_edge = 1; // Flag para indicar se é a primeira borda de subida.

    uvm_analysis_port #(clk_monitor_item) analysis_port;

    function new(string name = "clk_monitor", uvm_component parent = null);
        super.new(name, parent);
        analysis_port = new("analysis_port", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual clk_if.monitor)::get(this, "", "vif", vif))
            `uvm_fatal("CLK_MONITOR", "Virtual interface not found!")
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        forever begin
            @(posedge vif.clk);
            `uvm_info("CLK_MONITOR", $sformatf("Clock rising edge detected at realtime %0t", $realtime), UVM_HIGH)
            
            current_rising_edge = $realtime;

            if (first_edge) begin
                last_rising_edge = current_rising_edge;
                first_edge = 0;
            end
            else begin
                // Calculate clock period
                measured_period = current_rising_edge - last_rising_edge;
                `uvm_info("CLK_MONITOR", $sformatf("Measured clock period: %0t", measured_period),UVM_HIGH)

                item = clk_monitor_item::type_id::create("item");

                item.last_rising_edge = last_rising_edge;
                item.current_rising_edge = current_rising_edge;
                item.measured_period = measured_period;

                // Publish transaction
                analysis_port.write(item);

                last_rising_edge = current_rising_edge;
            end
        end
    endtask

endclass

`endif