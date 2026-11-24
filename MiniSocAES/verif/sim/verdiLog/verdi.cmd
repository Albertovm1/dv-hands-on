
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvExpandBus -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 29
wvScrollDown -win $_nWave2 6
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
srcHBSelect "minisoc_top_tb.mem_vif" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "minisoc_top_tb.dut.u_memory" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1/u_memory" 0)}
wvAddSubGroup -win $_nWave2 -holdpost {u_memory}
wvAddSignal -win $_nWave2 "/minisoc_top_tb/dut/u_memory/clk" \
           "/minisoc_top_tb/dut/u_memory/i_sel_aes" \
           "/minisoc_top_tb/dut/u_memory/i_user_data\[31:0\]" \
           "/minisoc_top_tb/dut/u_memory/i_user_wr_en" \
           "/minisoc_top_tb/dut/u_memory/i_user_addr\[9:0\]" \
           "/minisoc_top_tb/dut/u_memory/o_user_data\[31:0\]" \
           "/minisoc_top_tb/dut/u_memory/i_aes_data\[31:0\]" \
           "/minisoc_top_tb/dut/u_memory/i_aes_wr_en" \
           "/minisoc_top_tb/dut/u_memory/i_aes_addr\[9:0\]" \
           "/minisoc_top_tb/dut/u_memory/o_aes_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G1/u_memory" 0)}
wvSetPosition -win $_nWave2 {("G1/u_memory" 10)}
wvScrollDown -win $_nWave2 3
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
