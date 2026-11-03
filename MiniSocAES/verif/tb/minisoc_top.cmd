
# ==========================================
# MiniSoC AES - Verdi Waveform
# ==========================================

# Import simulation database
debImport "-dbdir" "build/vcs/minisoc_top_sim.daidir"

# Open FSDB
wvOpenFile dump.fsdb

# ==========================================
# CLOCK VIP
# ==========================================

wvAddSignal -win $_nWave2 "/minisoc_top_tb/clk_vif/clk"

# ==========================================
# RESET VIP
# ==========================================

wvAddSignal -win $_nWave2 "/minisoc_top_tb/rst_vif/rst_n"

# ==========================================
# DUT INPUTS
# ==========================================

wvZoomAll -win $_nWave2
