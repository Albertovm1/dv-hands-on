verdiWindowResize -win $_vdCoverage_1 "0" "29" "1536" "707"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
verdiSetFont  -font  {DejaVu Sans}  -size  12
verdiSetFont -font "DejaVu Sans" -size "12"
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_open_cov  -hier ./build/vcs/minisoc_top_sim.vdb -testdir {} -test {./build/vcs/minisoc_top_sim/test} -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
verdiSetActWin -dock widgetDock_<CovDetail>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::spi_cov
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::rst_cov
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::mem_cov
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::clk_cov
verdiSetActWin -dock widgetDock_Message
gui_list_collapse -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::clk_cov
verdiSetActWin -dock widgetDock_<Summary>
gui_list_collapse -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::mem_cov
gui_list_collapse -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::spi_cov
gui_list_collapse -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::rst_cov
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /minisoc_coverage_pkg::minisoc_coverage::mem_cov   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::mem_cov
gui_list_expand -id CoverageTable.1   /minisoc_coverage_pkg::minisoc_coverage::mem_cov
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::mem_cov  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /minisoc_coverage_pkg::minisoc_coverage::mem_cov  /minisoc_coverage_pkg::minisoc_coverage::spi_cov   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::spi_cov
gui_list_expand -id CoverageTable.1   /minisoc_coverage_pkg::minisoc_coverage::spi_cov
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::spi_cov  -column {Group} 
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /minisoc_coverage_pkg::minisoc_coverage::spi_cov  minisoc_coverage_pkg::minisoc_coverage::mem_cov.write_data_cov   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} minisoc_coverage_pkg::minisoc_coverage::mem_cov.write_data_cov  -column {Group} 
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} -descending  {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} {Name}
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} -descending  {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} { }
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -show 
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -show 
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Covered  -on   -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Covered} -value {true}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Total  -on   -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Total} -value {true}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Uncovered  -on   -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Uncovered} -value {true}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Excluded  -on   -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Excluded} -value {true}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Uncovered  -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Uncovered} -value {false}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Total  -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Total} -value {false}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Excluded  -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Excluded} -value {false}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -col  Covered  -show 
gui_set_pref_value -category {ColumnCfg} -key {covtblInstancesList_Covered} -value {false}
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList
gui_search_widget 
gui_search_widget 
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblTestSummaryList { ./build/vcs/minisoc_top_sim/test   }
gui_list_action -id  CoverageTable.1 -list {covtblTestSummaryList} ./build/vcs/minisoc_top_sim/test  -column {Test Name/Test Location} 
gui_list_select -id CoverageTable.1 -list covtblTestSummaryList { ./build/vcs/minisoc_top_sim/test   }
gui_list_select -id CoverageTable.1 -list covtblTestSummaryList { ./build/vcs/minisoc_top_sim/test   }
gui_list_action -id  CoverageTable.1 -list {covtblTestSummaryList} ./build/vcs/minisoc_top_sim/test  -column {Test Name/Test Location} 
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiSetActWin -dock widgetDock_<ExclMgr>
verdiDockWidgetSetCurTab -dock widgetDock_Message
verdiSetActWin -dock widgetDock_Message
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { minisoc_coverage_pkg::minisoc_coverage::mem_cov.write_data_cov  /minisoc_coverage_pkg::minisoc_coverage::clk_cov   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::clk_cov
gui_list_expand -id CoverageTable.1   /minisoc_coverage_pkg::minisoc_coverage::clk_cov
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /minisoc_coverage_pkg::minisoc_coverage::clk_cov  -column {Group} 
verdiDockWidgetSetCurTab -dock widgetDock_<HvpDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<CovDetail>
verdiSetActWin -dock widgetDock_<CovDetail>
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
verdiWindowPreviousLayout -win $_vdCoverage_1
verdiSetActWin -dock widgetDock_Message
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblStatGroupList { {Cover Point}   }
gui_list_action -id  CoverageTable.1 -list {covtblStatGroupList} {Cover Point}  -column {Category} 
gui_list_select -id CoverageTable.1 -list covtblStatGroupList { {Cover Point}  {Cover Point Bins}   }
gui_list_action -id  CoverageTable.1 -list {covtblStatGroupList} {Cover Point Bins}  -column {Category} 
vdCovExit -noprompt
