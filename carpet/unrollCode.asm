debugUnroll:
    ;hl = sine lut
    ;init
    ld de, virtualScreen
    xor a; a = 0
    ;====
    ;z = 0
    ;i = 0
    ld e, [hl]; e = destintation on virtual screen
    inc l;next pos in lut
    ld [de], a
    ;i = 1
    ld e, [hl]
    inc l
    ld [de], a
    ;i = 2
    ld e, [hl]
    inc l
    ld [de], a
    ;i = 3  
    ld e, [hl]
    inc l
    ld [de], a
    inc a

