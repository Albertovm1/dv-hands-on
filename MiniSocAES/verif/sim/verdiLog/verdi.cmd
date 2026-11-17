
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
    # MEMORY VIP
    # ==========================================

    wvAddSignal -win $_nWave2 "/minisoc_top_tb/mem_vif/mem_clk"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/mem_vif/mem_i_data"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/mem_vif/mem_i_wr_en"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/mem_vif/mem_i_addr"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/mem_vif/mem_o_data"

    # ==========================================
    # DUT INPUTS
    # ==========================================

    wvZoomAll -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetWindowTimeUnit -win $_nWave2 10.000000 ns
wvZoomAll -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 30.440278 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 30.054514 -snap {("G1" 6)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 23.040625 -snap {("G1" 0)}
