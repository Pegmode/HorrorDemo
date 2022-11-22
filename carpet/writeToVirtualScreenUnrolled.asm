writeToVirtualScreenUnrolled:
; write from sine LUT to table for drawing carpet later
;warning: sine LUT MUST be 8 bit aligned
; hl = starting address for the first frame in the sine LUT
;init
        ld de, virtualScreen
        xor a; a = 0
;unrolled
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        ld e, [hl]
        inc l
        ld [de], a
        inc a
        ret

