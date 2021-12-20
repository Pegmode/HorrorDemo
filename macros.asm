M_IntroMessupMacro: MACRO;
        ;hl = 
        REPT 50    
            call RandomNumber
            ;or [hl]
            ld [hl], a
            add hl, bc
        ENDR
    ENDM