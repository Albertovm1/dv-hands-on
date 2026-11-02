`ifndef RST_COVERAGE_SV
`define RST_COVERAGE_SV

class rst_coverage extends uvm_subscriber #(rst_seq_item);

    `uvm_component_utils(rst_coverage)

    covergroup rst_cg with function sample(rst_seq_item::rst_cmd_e rst_cmd,time reset_duration);

        option.per_instance = 1;

        cp_reset_event : coverpoint rst_cmd {

            bins reset_asserted = {
                rst_seq_item::ASSERT_RESET
            };

            bins reset_deasserted = {
                rst_seq_item::DEASSERT_RESET
            };

        }

        cp_reset_transition : coverpoint rst_cmd {

            bins assert_then_deassert = (
                rst_seq_item::ASSERT_RESET =>
                rst_seq_item::DEASSERT_RESET
            );

        }

        cp_reset_duration : coverpoint reset_duration
            iff (rst_cmd == rst_seq_item::DEASSERT_RESET) {

            bins short_reset  = {[1:50]};
            bins medium_reset = {[51:100]};
            bins long_reset   = {[101:500]};

        }

    endgroup


    function new(string name = "rst_coverage",uvm_component parent = null);
        super.new(name, parent);
        rst_cg = new();
    endfunction

    virtual function void write(rst_seq_item t);
        if (t == null) begin

            `uvm_error("RST_COV",
                "Received null monitor item!")

            return;

        end

        rst_cg.sample(t.rst_cmd, t.duration);

        `uvm_info("RST_COV",
            $sformatf(
                "Reset event: %s | Duration: %0t",
                t.rst_cmd.name(),
                t.duration
            ), UVM_HIGH)

    endfunction


    function void report_phase(uvm_phase phase);

        super.report_phase(phase);

        `uvm_info("RST_COV",$sformatf("Reset Coverage: %0.2f%%",rst_cg.get_coverage()), UVM_LOW)

    endfunction

endclass

`endif
