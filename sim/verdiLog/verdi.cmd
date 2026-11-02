debImport "-dbdir" "build/vcs/minisoc_top_sim.daidir"
wvOpenFile dump.fsdb

wvAddSignal -win $_nWave2 "/minisoc_top_tb/clk_vif/clk"
wvAddSignal -win $_nWave2 "/minisoc_top_tb/rst_n"

wvZoomAll -win $_nWave2debExit
