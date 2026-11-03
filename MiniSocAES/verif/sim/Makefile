BLOCKNAME = minisoc_top

#
# RTL
#
RTL_DIR ?= ../../rtl/rtl

DUT_FILES := $(RTL_DIR)/minisoc_aes/minisoc_aes_key_exp.sv \
             $(RTL_DIR)/minisoc_aes/minisoc_aes_dp.sv \
             $(RTL_DIR)/minisoc_aes/minisoc_aes_top.sv \
             $(RTL_DIR)/minisoc_mem/minisoc_memory.sv \
             $(RTL_DIR)/minisoc_pll/minisoc_pll_mock.sv \
             $(RTL_DIR)/minisoc_spi/minisoc_spi.sv \
             $(RTL_DIR)/minisoc_top.sv

#
# Verification
#
TB_DIR = ../tb

TB_TOP_FILE = $(TB_DIR)/minisoc_top_tb.sv
SVA_FILE    = $(TB_DIR)/top_assertions.sv

INC_DIRS = +incdir+$(TB_DIR)/interfaces \
           +incdir+$(TB_DIR)/agents/minisoc_clk_agent \
           +incdir+$(TB_DIR)/agents/minisoc_rst_agent \
           +incdir+$(TB_DIR)/sequences/clk \
           +incdir+$(TB_DIR)/sequences/rst \
           +incdir+$(TB_DIR)/env \
           +incdir+$(TB_DIR)/env/scoreboard \
           +incdir+$(TB_DIR)/env/coverage \
           +incdir+$(TB_DIR)/tests

#
# UVM
#
UVM_VERSION  = uvm-1.2
UVM_SEED     = random
UVM_TESTNAME = minisoc_smoke_test

#
# Testbench source files
#

TB_FILES = \
    $(TB_DIR)/interfaces/clk_if.sv \
    $(TB_DIR)/interfaces/rst_if.sv \
    $(TB_DIR)/agents/minisoc_clk_agent/clk_agent_pkg.sv \
    $(TB_DIR)/agents/minisoc_rst_agent/rst_agent_pkg.sv \
    $(TB_DIR)/env/scoreboard/minisoc_scoreboard_pkg.sv \
    $(TB_DIR)/env/coverage/minisoc_coverage_pkg.sv \
    $(TB_DIR)/env/minisoc_env_pkg.sv \
    $(TB_DIR)/tests/minisoc_test_pkg.sv

#
# VCS Setup / Config
#
SIM       = vcs
OUT_DIR   = build/$(SIM)
LOG_DIR   = $(OUT_DIR)/logs
SIMV_EXE  = $(OUT_DIR)/$(BLOCKNAME)_sim

SRC_BUNDLE = $(DUT_FILES) $(TB_FILES) $(SVA_FILE) $(TB_TOP_FILE)

VCS_FLAGS_BASE = -sverilog -full64 \
                 -l $(LOG_DIR)/vcs_comp.log \
                 -kdb -debug_access+all \
                 $(INC_DIRS) \
                 -timescale=1ns/1ps

VCS_UVM_FLAGS = -ntb_opts $(UVM_VERSION)
VCS_SEED_FLAG = +ntb_random_seed=$(UVM_SEED)

.PHONY: all vcs_compil vcs_run vcs_all vcs_fall vcs_help vcs_clean verdi_gui cov_gui

all: vcs_all

#
# Compilation
#
vcs_compil:
	@echo "[VCS] Compiling $(BLOCKNAME)..."
	@mkdir -p $(OUT_DIR)
	@mkdir -p $(LOG_DIR)
	$(SIM) $(VCS_FLAGS_BASE) $(VCS_UVM_FLAGS) $(SRC_BUNDLE) -o $(SIMV_EXE)

#
# Run
#
vcs_run:
	@echo "[VCS] Running $(UVM_TESTNAME)..."
	./$(SIMV_EXE) $(VCS_SEED_FLAG) +UVM_TESTNAME=$(UVM_TESTNAME) -l $(LOG_DIR)/vcs_run.log

#
# All
#
vcs_all: vcs_compil vcs_run

vcs_fall: vcs_clean vcs_compil vcs_run

#
# Help
#
vcs_help:
	vcs -help > vcs_help.txt

#
# Clean
#
vcs_clean:
	rm -rf build/ $(BLOCKNAME).daidir *.key csrc vc_hdrs.h vcs_help.txt dump.fsdb

#
# Verdi
#
verdi_gui:
	@echo "[VCS] Launching Verdi"
	verdi -play $(TB_DIR)/minisoc_top.cmd &

#
# Coverage GUI
#
cov_gui:
	@echo "[VERDI] Opening Coverage..."
	verdi -cov -covdir ./build/vcs/minisoc_top_sim.vdb &