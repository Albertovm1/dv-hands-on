`ifndef MEM_SEQUENCE_RANDOM_SV
`define MEM_SEQUENCE_RANDOM_SV

class mem_sequence_random extends uvm_sequence #(mem_seq_item);

    `uvm_object_utils(mem_sequence_random)

    function new(string name = "mem_sequence_random");
        super.new(name);
    endfunction

    task body();

        mem_seq_item req;

        req = mem_seq_item::type_id::create("req");

        repeat (15) begin

            // Randomize a WRITE
            start_item(req);

            if (!req.randomize() with {
                op == mem_seq_item::MEM_WRITE;
            }) begin
                `uvm_fatal("MEM_SEQUENCE_RANDOM",
                    "Failed to randomize memory transaction")
            end

            finish_item(req);

            start_item(req);

            req.op = mem_seq_item::MEM_READ;

            finish_item(req);

        end

    endtask

endclass

`endif