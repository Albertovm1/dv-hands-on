interface clk_if;
  logic clk;

  initial begin
    clk = 0;
    forever #5ns clk = ~clk;
  end
endinterface : clk_if