
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
    # SPI VIP
    # ==========================================

    wvAddSignal -win $_nWave2 "/minisoc_top_tb/spi_vif/spi_sclk"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/spi_vif/spi_cs_n"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/spi_vif/spi_mosi"
    wvAddSignal -win $_nWave2 "/minisoc_top_tb/spi_vif/spi_miso"

    # ==========================================
    # DUT INPUTS
    # ==========================================

    wvZoomAll -win $_nWave2
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2800983.831283 -snap {("G1" 2)}
wvZoomIn -win $_nWave2
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetCursor -win $_nWave2 1336.729167 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1376.703125 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1416.677083 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1448.656250 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1608.552083 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1667.180556 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1715.149306 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 4349.593056 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 4306.527778 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 4457.256250 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 4893.292187 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 4764.096354 -snap {("G1" 3)}
debExit
