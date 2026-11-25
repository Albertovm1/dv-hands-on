
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
