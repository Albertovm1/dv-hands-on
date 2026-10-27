debImport "-dbdir" "build/vcs/minisoc_top_sim.daidir"
wvOpenFile dump.fsdb
wvAddSignal -win $_nWave2 "/top_tb/clk"
wvAddSignal -win $_nWave2 "/top_tb/rst_n"
wvZoomAll -win $_nWave2wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 113424.337748 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G1}
wvSetCursor -win $_nWave2 157202.152318 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 37808.112583 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
