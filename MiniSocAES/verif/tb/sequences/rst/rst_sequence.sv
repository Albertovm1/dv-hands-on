`ifndef RST_SEQUENCE_SV
`define RST_SEQUENCE_SV

class rst_sequence extends uvm_sequence #(rst_seq_item);

    `uvm_object_utils(rst_sequence)

    function new(string name = "rst_sequence");
        super.new(name);
    endfunction 


    virtual task body();

        rst_seq_item tr;

        // ------------------------------------------------
        // 1. RESET INICIAL - DURACAO MEDIA
        // Objetivo: inicializar o sistema
        // ------------------------------------------------

        tr = rst_seq_item::type_id::create("rst_initial");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::ASSERT_RESET;
        tr.duration = 100ns;
        finish_item(tr);

        tr = rst_seq_item::type_id::create("rst_initial_release");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::DEASSERT_RESET;
        tr.duration = 10ns;
        finish_item(tr);


        // ------------------------------------------------
        // 2. RESET CURTO
        // Objetivo: exercitar short_reset
        // ------------------------------------------------

        tr = rst_seq_item::type_id::create("rst_short");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::ASSERT_RESET;
        tr.duration = 25ns;
        finish_item(tr);

        tr = rst_seq_item::type_id::create("rst_short_release");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::DEASSERT_RESET;
        tr.duration = 10ns;
        finish_item(tr);


        // ------------------------------------------------
        // 3. RESET LONGO
        // Objetivo: exercitar long_reset
        // ------------------------------------------------

        tr = rst_seq_item::type_id::create("rst_long");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::ASSERT_RESET;
        tr.duration = 200ns;
        finish_item(tr);

        tr = rst_seq_item::type_id::create("rst_long_release");

        start_item(tr);
        tr.rst_cmd = rst_seq_item::DEASSERT_RESET;
        tr.duration = 10ns;
        finish_item(tr);

    endtask

endclass

`endif
