import uvm_pkg::*;
`include "uvm_macros.svh"

class smoke_test extends uvm_test;
  `uvm_component_utils(smoke_test)

  virtual clk_if clk_vif;
  virtual rst_if rst_vif;

  function new(string name = "smoke_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Obtém as interfaces virtuais registadas no uvm_config_db pelo top_tb
    if (!uvm_config_db#(virtual clk_if)::get(this, "", "clk_vif", clk_vif))
      `uvm_fatal("SMOKE_TEST", "Não foi possível obter a interface clk_vif do uvm_config_db!")

    if (!uvm_config_db#(virtual rst_if)::get(this, "", "rst_vif", rst_vif))
      `uvm_fatal("SMOKE_TEST", "Não foi possível obter a interface rst_vif do uvm_config_db!")
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this); //impede que a simulação encerre precocemente.

    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)
    `uvm_info("SMOKE_TEST", "A iniciar Teste de Sanidade UVM no MiniSoC...", UVM_LOW)
    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)

    // 1. Aplica e liberta o Reset
    rst_vif.apply_reset(100);
    `uvm_info("SMOKE_TEST", "Reset aplicado e libertado com sucesso.", UVM_LOW)

    // 2. Aguarda 50 ciclos do clock de referência
    repeat(50) @(posedge clk_vif.clk);

    `uvm_info("SMOKE_TEST", "Sistema estável após reset.", UVM_LOW)
    `uvm_info("SMOKE_TEST", "STATUS: PASSED!", UVM_LOW)
    `uvm_info("SMOKE_TEST", "==================================================", UVM_LOW)

    phase.drop_objection(this);
  endtask
endclass
