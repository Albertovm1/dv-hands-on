module top_assertions (
  input logic clk,
  input logic rst_n,
  input logic mem_sel_aes,
  input logic busy,
  input logic pll_enable,
  input logic pll_locked,
  input logic status_done,
  input logic status_error
);

  default clocking cb @(posedge clk); endclocking
  default disable iff (!rst_n);

  // A-01: Estado inicial pós-reset (utiliza implicação não-sobreposta |=>)
  property p_reset_init;
    !rst_n |=> (!busy && !status_error && !mem_sel_aes);
  endproperty
  assert_a01: assert property (p_reset_init) 
    else $error("[SVA FAIL - A01] Estado inválido pós-reset!");

  // A-03: Exclusão mútua na RAM quando o AES está ativo (implicação sobreposta |->)
  property p_mem_mutex;
    busy |-> mem_sel_aes;
  endproperty
  assert_a03: assert property (p_mem_mutex) 
    else $error("[SVA FAIL - A03] Memória não selecionada para o AES durante processamento!");

  // A-05: Coerência do estado da PLL
  property p_pll_gating;
    !pll_enable |-> !pll_locked;
  endproperty
  assert_a05: assert property (p_pll_gating) 
    else $error("[SVA FAIL - A05] PLL desativada reportou estado LOCKED!");

  // A-06: Flag DONE mantida
  property p_done_sticky;
    status_done && busy |=> status_done;
  endproperty
  assert_a06: assert property (p_done_sticky) 
    else $error("[SVA FAIL - A06] Flag DONE perdeu o seu valor retido!");

endmodule : top_assertions
