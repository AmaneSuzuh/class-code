set  power_cg_auto_identify   			    "true"
set  power_cg_reconfig_stages           	"true"
set  compile_clock_gating_through_hierarchy "true"
set  power_cg_derive_related_clock  		"true"


##set  latch_gating_cells [get_lib_cells  slow/TLATNTSCAX*]

#set_clock_gating_style  -minimum_bitwidth 4        \
#  			-positive_edge_logic   slow/TLATNTSCAX2 \
#           -negative_edge_logic   slow/TLATNTSCAX2  

set_clock_gating_check -setup $clk_gate_setup -hold $clk_gate_hold

insert_clock_gating > ./log/insert_clock_gating.log
propagate_constraints -gate_clock
report_clock_gating > ./rpt/report_clock_gating.rpt

