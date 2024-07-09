sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-f" "flist.f" "-2001" "-top" "tb"
srcHBSelect "tb.u_y" -win $_nTrace1
srcHBSelect "tb.u_y" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y" -delim "."
srcHBSelect "tb.u_y" -win $_nTrace1
srcHBSelect "tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb" -delim "."
srcHBSelect "tb" -win $_nTrace1
srcHBSelect "tb.u_y" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y" -delim "."
srcHBSelect "tb.u_y" -win $_nTrace1
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/hz/project/test/sync_shake/tb.fsdb}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb"
wvGetSignalSetScope -win $_nWave2 "/tb/u_y"
srcHBSelect "tb.u_y.u_sync_o" -win $_nTrace1
srcHBSelect "tb.u_y.u_sync_i" -win $_nTrace1
srcHBSelect "tb.u_y.u_sync_o" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y.u_sync_o" -delim "."
srcHBSelect "tb.u_y.u_sync_o" -win $_nTrace1
srcHBSelect "tb.u_y.u_sync_i" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y.u_sync_i" -delim "."
srcHBSelect "tb.u_y.u_sync_i" -win $_nTrace1
wvGetSignalSetScope -win $_nWave2 "/tb/u_y/u_sync_i"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/LOGIC_HIGH} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/BLANK} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/LOGIC_LOW} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetCursor -win $_nWave2 532220.509533 -snap {("G4" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb/u_y"
wvGetSignalSetScope -win $_nWave2 "/tb/u_y/u_sync_i"
wvGetSignalSetScope -win $_nWave2 "/tb/u_y/u_sync_o"
wvGetSignalSetScope -win $_nWave2 "/tb/u_y/u_sync_i"
srcHBSelect "tb.u_y.u_sync_o" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y.u_sync_o" -delim "."
srcHBSelect "tb.u_y.u_sync_o" -win $_nTrace1
srcHBSelect "tb.u_y.u_sync_i" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y.u_sync_i" -delim "."
srcHBSelect "tb.u_y.u_sync_i" -win $_nTrace1
srcHBSelect "tb.u_y" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb.u_y" -delim "."
srcHBSelect "tb.u_y" -win $_nTrace1
wvGetSignalSetScope -win $_nWave2 "/tb/u_y"
srcDeselectAll -win $_nTrace1
srcSelect -signal "din" -line 5 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb/u_y/din\[7:0\]} \
{/tb/u_y/in_ack} \
{/tb/u_y/capin} \
{/tb/u_y/in_vld_lev} \
{/tb/u_y/in_vld_sync_in_rise} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb/u_y/vld_sync} \
{/tb/u_y/out_vld} \
{/tb/u_y/in_vld_clk_o_rise} \
{/tb/u_y/capout} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 70464917.914883 71136273.755640
wvSelectGroup -win $_nWave2 {G3}
srcDeselectAll -win $_nTrace1
srcSelect -signal "dout" -line 12 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectGroup -win $_nWave2 {G4}
wvSaveSignal -win $_nWave2 "/home/hz/project/test/sync_shake/signal.rc"
debExit
