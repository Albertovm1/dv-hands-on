debImport "-dbdir" "build/vcs/minisoc_top_sim.daidir"
wvOpenFile dump.fsdb
wvAddSignal -win $_nWave2 "/top_tb/clk"
wvAddSignal -win $_nWave2 "/top_tb/rst_n"
wvZoomAll -win $_nWave2