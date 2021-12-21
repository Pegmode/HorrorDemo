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


;per screen hram
SECTION "HVariables",hram[$FF81];may need to change base
union


endu