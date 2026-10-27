BLOCKNAME = minisoc_top

#
# RTL
#
RTL_DIR   ?= ../../frontend/rtl
DUT_FILES := $(RTL_DIR)/minisoc_aes/minisoc_aes_key_exp.sv \
             $(RTL_DIR)/minisoc_aes/minisoc_aes_dp.sv      \
             $(RTL_DIR)/minisoc_aes/minisoc_aes_top.sv     \
             $(RTL_DIR)/minisoc_mem/minisoc_memory.sv      \
             $(RTL_DIR)/minisoc_pll/minisoc_pll_mock.sv    \
             $(RTL_DIR)/minisoc_spi/minisoc_spi.sv         \
             $(RTL_DIR)/minisoc_top.sv

#
# Verification
#
TB_TOP_FILE = top_tb.sv
SVA_FILE    = top_assertions.sv

INC_DIRS    = +incdir+agents/clock_agent \
              +incdir+agents/rst_agent   \
              +incdir+agents/spi_agent   \
              +incdir+agents/mem_agent   \
              +incdir+tests

# uvm
UVM_VERSION  = uvm-1.2
UVM_SEED     = random
UVM_TESTNAME = smoke_test

#
# VCS Setup/Config
#
SIM            = vcs
OUT_DIR        = build/$(SIM)
LOG_DIR        = $(OUT_DIR)/logs
SIMV_EXE       = $(OUT_DIR)/$(BLOCKNAME)_sim
SRC_BUNDLE     = $(DUT_FILES) $(SVA_FILE) $(TB_TOP_FILE)

VCS_FLAGS_BASE = -sverilog -full64 -l $(LOG_DIR)/vcs_comp.log -kdb -debug_access+all $(INC_DIRS) -timescale=1ns/1ps
VCS_UVM_FLAGS  = -ntb_opts $(UVM_VERSION)
VCS_SEED_FLAG  = +ntb_random_seed=$(UVM_SEED)

.PHONY: all vcs_compil vcs_run vcs_all vcs_fall vcs_help vcs_clean verdi_gui

all: vcs_all

# compiling
vcs_compil:
	@echo "[VCS] Compiling $(BLOCKNAME)..."
	@mkdir -p $(OUT_DIR)
	@mkdir -p $(LOG_DIR)
	$(SIM) $(VCS_FLAGS_BASE) $(VCS_UVM_FLAGS) $(SRC_BUNDLE) -o $(SIMV_EXE)

# run
vcs_run:
	@echo "[VCS] Running $(UVM_TESTNAME)..."
	./$(SIMV_EXE) $(VCS_SEED_FLAG) +UVM_TESTNAME=$(UVM_TESTNAME) -l $(LOG_DIR)/vcs_run.log

# all
vcs_all: vcs_compil vcs_run

# full all
vcs_fall: vcs_clean vcs_compil vcs_run

# help
vcs_help:
	vcs -help > vcs_help.txt

# clean artifacts
vcs_clean:
	rm -rf build/ $(BLOCKNAME).daidir *.key $(SIMV_EXE) csrc vc_hdrs.h vcs_help.txt dump.fsdb

#
# Verdi Setup/Config
#
verdi_gui:
	@echo "[VCS] Launching Verdi"
	verdi -play $(BLOCKNAME).cmd &