
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 100743.335503 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 111659.796007 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 135987.907986 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 144409.177517 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 100431.436632 -snap {("G1" 2)}
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 110.100302 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 135.987908 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 346.207747 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 184.332233 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 101.679032 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 110.760429 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 135.619696 -snap {("G1" 2)}
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 99.183841 -snap {("G1" 2)}
wvSetWindowTimeUnit -win $_nWave2 10.000000 ns
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetCursor -win $_nWave2 109.788403 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 137.547402 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 102.926628 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 110.412201 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 135.052211 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 101.055234 -snap {("G1" 2)}
debExit
