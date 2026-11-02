`ifndef RST_CHECKER_SV
`define RST_CHECKER_SV

class rst_checker extends uvm_component;

    `uvm_component_utils(rst_checker)

    uvm_analysis_imp #(rst_seq_item, rst_checker) analysis_imp;

    bit reset_state;
    bit first_event;

    // Counters
    int total_events;
    int assert_count;
    int deassert_count;
    int failed_checks;


    function new(string name = "rst_checker",uvm_component parent = null);
        super.new(name, parent);

        analysis_imp = new("analysis_imp", this);

        reset_state = 0;
        first_event = 1;

        total_events  = 0;
        assert_count  = 0;
        deassert_count = 0;
        failed_checks = 0;
    endfunction


    function void write(rst_seq_item item);
        total_events++;

        if (item == null) begin
            failed_checks++;
            `uvm_error("RST_CHECKER", "Received null reset item!")
            return;

        end

        case (item.rst_cmd)
            rst_seq_item::ASSERT_RESET: begin
                if (!first_event && reset_state == 1'b1) begin
                    failed_checks++;
                    `uvm_error("RST_CHECKER", "Invalid ASSERT_RESET: reset already asserted")
                end
                else begin
                    assert_count++;
                    `uvm_info("RST_CHECKER", "Reset asserted", UVM_MEDIUM)
                end

                reset_state = 1'b1;
                first_event = 0;

            end

            rst_seq_item::DEASSERT_RESET: begin
                if (!first_event && reset_state == 1'b0) begin
                    failed_checks++;
                    `uvm_error("RST_CHECKER","Invalid DEASSERT_RESET: reset already deasserted")
                end
                else begin
                    deassert_count++;
                    `uvm_info("RST_CHECKER","Reset deasserted", UVM_MEDIUM)
                end

                reset_state = 1'b0;
                first_event = 0;

            end


            default: begin
                failed_checks++;
                `uvm_error("RST_CHECKER","Unknown reset command")
            end

        endcase

    endfunction

endclass
`endif