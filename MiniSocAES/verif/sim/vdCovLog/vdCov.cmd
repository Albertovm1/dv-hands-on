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
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::rst_coverage::rst_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::clk_coverage::clk_cg
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { minisoc_coverage_pkg::clk_coverage::clk_cg.cp_clk_period   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} minisoc_coverage_pkg::clk_coverage::clk_cg.cp_clk_period  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { minisoc_coverage_pkg::clk_coverage::clk_cg.cp_clk_period  /minisoc_coverage_pkg::rst_coverage::rst_cg   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /minisoc_coverage_pkg::rst_coverage::rst_cg  -column {Group} 
gui_list_collapse -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::rst_coverage::rst_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /minisoc_coverage_pkg::rst_coverage::rst_cg
