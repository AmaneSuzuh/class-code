sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-f" "flist.f" "-2001" "-top" "tb"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/hz/project/test/20_sad_cal/sim.fsdb}
wvAddAllSignals -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvShowOneTraceSignals -win $_nWave2 -signal "/tb/wait_cyc\[4:0\]" -chainDriver
wvShowOneTraceSignals -win $_nWave2 -signal "/tb/wait_cyc\[4:0\]" -connectivity
wvShowOneTraceSignals -win $_nWave2 -signal "/tb/wait_cyc\[4:0\]" -valuechange
wvShowOneTraceSignals -win $_nWave2 -signal "/tb/wait_cyc\[4:0\]" -driver
wvShowOneTraceSignals -win $_nWave2 -signal "/tb/wait_cyc\[4:0\]" -load
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wait_cyc" -line 24 -pos 1 -win $_nTrace1
srcSearchString "wait_cyc" -win $_nTrace1 -next -case
srcSearchString "wait_cyc" -win $_nTrace1 -next -case
srcSearchString "wait_cyc" -win $_nTrace1 -next -case
srcSearchString "wait_cyc" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {24 24 10 11 1 1}
srcSearchString "wait_cyc" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {24 24 10 11 1 1}
srcSearchString "wait_cyc" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {24 24 10 11 1 1}
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39669370.500655 42013075.103539
wvZoom -win $_nWave2 40961018.974454 41043954.786089
debExit
