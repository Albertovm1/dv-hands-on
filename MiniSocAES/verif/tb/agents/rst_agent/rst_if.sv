interface rst_if;
  logic rst_n;

  initial begin
    rst_n = 1;
  end

  task automatic apply_reset(int unsigned duration_ns = 100);
    rst_n = 0;
    # (duration_ns * 1ns);
    rst_n = 1;
  endtask
endinterface : rst_if