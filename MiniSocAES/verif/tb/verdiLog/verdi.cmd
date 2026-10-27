debImport "-dbdir" "build/vcs/minisoc_top_sim.daidir"
wvOpenFile dump.fsdb
wvAddSignal -win $_nWave2 "/top_tb/clk"
wvAddSignal -win $_nWave2 "/top_tb/rst_n"
wvZoomAll -win $_nWave2verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiShowWindow -win $_Verdi_1 -switchFS
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetCursor -win $_nWave2 39118.509213 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 28404.522613 -snap {("G1" 1)}
srcActiveTrace "top_tb.clk" -TraceByDConWave -TraceTime 25000 -TraceValue 1 -win \
           $_nTrace1
wvSetCursor -win $_nWave2 22922.948074 -snap {("G1" 1)}
srcActiveTrace "top_tb.clk" -TraceByDConWave -TraceTime 20000 -TraceValue 0 -win \
           $_nTrace1
wvZoomCursorMarker -win $_nWave2
wvZoom -win $_nWave2 0.000000 25000.000000
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 99.832496 -snap {("G1" 2)}
srcHBSelect "top_tb.clk_vif" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 3.852596 -snap {("G1" 1)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 9.045226 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 14.405360 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 18.927973 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 26.130653 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 29.648241 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 37.018425 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 100.670017 -snap {("G1" 2)}
