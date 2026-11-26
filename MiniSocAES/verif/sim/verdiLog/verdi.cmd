
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcHBSelect "minisoc_top_tb.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBDrag -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("u_spi" 0)}
wvRenameGroup -win $_nWave2 {G2} {u_spi}
wvAddSignal -win $_nWave2 "/minisoc_top_tb/dut/u_spi/sclk" \
           "/minisoc_top_tb/dut/u_spi/cs_n" "/minisoc_top_tb/dut/u_spi/mosi" \
           "/minisoc_top_tb/dut/u_spi/miso" \
           "/minisoc_top_tb/dut/u_spi/sys_clk" \
           "/minisoc_top_tb/dut/u_spi/rstn" \
           "/minisoc_top_tb/dut/u_spi/cfg_start" \
           "/minisoc_top_tb/dut/u_spi/cfg_decrypt" \
           "/minisoc_top_tb/dut/u_spi/cfg_mode\[2:0\]" \
           "/minisoc_top_tb/dut/u_spi/cfg_num_blocks\[8:0\]" \
           "/minisoc_top_tb/dut/u_spi/cfg_key\[127:0\]" \
           "/minisoc_top_tb/dut/u_spi/cfg_iv\[127:0\]" \
           "/minisoc_top_tb/dut/u_spi/cfg_counter\[63:0\]" \
           "/minisoc_top_tb/dut/u_spi/aes_busy" \
           "/minisoc_top_tb/dut/u_spi/aes_done" \
           "/minisoc_top_tb/dut/u_spi/aes_error" \
           "/minisoc_top_tb/dut/u_spi/aes_blocks_done\[8:0\]" \
           "/minisoc_top_tb/dut/u_spi/cfg_mem_sel_aes" \
           "/minisoc_top_tb/dut/u_spi/cfg_pll_enable" \
           "/minisoc_top_tb/dut/u_spi/cfg_pll_div_sel\[1:0\]" \
           "/minisoc_top_tb/dut/u_spi/pll_locked" \
           "/minisoc_top_tb/dut/u_spi/leds\[7:0\]"
wvSetPosition -win $_nWave2 {("u_spi" 0)}
wvSetPosition -win $_nWave2 {("u_spi" 22)}
wvSetPosition -win $_nWave2 {("u_spi" 22)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_vcs_msglog"
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3852715.114236 -snap {("u_spi" 11)}
srcActiveTrace "minisoc_top_tb.dut.u_spi.cfg_key\[127:0\]" -TraceByDConWave \
           -TraceTime 500 -TraceValue \
           00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 \
           -win $_nTrace1
wvSetCursor -win $_nWave2 3852715.114236 -snap {("u_spi" 11)}
wvSetCursor -win $_nWave2 4054342.355009 -snap {("u_spi" 11)}
srcActiveTrace "minisoc_top_tb.dut.u_spi.cfg_iv\[127:0\]" -TraceByDConWave \
           -TraceTime 2762000 -TraceValue \
           00000000000000000000000000000000000100100011010001010110011110000000000000000000000000000000000000000000000000000000000000000000 \
           -win $_nTrace1
wvSetCursor -win $_nWave2 4043443.585237 -snap {("u_spi" 12)}
srcActiveTrace "minisoc_top_tb.dut.u_spi.cfg_iv\[127:0\]" -TraceByDConWave \
           -TraceTime 2762000 -TraceValue \
           00000000000000000000000000000000000100100011010001010110011110000000000000000000000000000000000000000000000000000000000000000000 \
           -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
debExit
