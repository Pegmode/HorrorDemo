SECTION "variables",wram0
NewJoyData:          ds 1
OldJoyData:          ds 1
;random seed
Seed:                ds 3

;per screen vars
union
    ;intro screen
    V_intro_dripCounter:    ds 1    
    V_intro_dripCounter2:    ds 1    
    V_intro_dripCounter3:    ds 1  
endu

currentSin: ds 1;move to union
virtualScreen: ds $FF
SECTION "Interrupt Vectors", wram0
    VBLANK_LOAD_VECTOR: ds 5
    STAT_LOAD_VECTOR: ds 5

;per screen hram
SECTION "HVariables",hram[$FF81];may need to change base
union


endu


