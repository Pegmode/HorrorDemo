;intro screen

introScreenInit:
    di
    ld a, IEF_VBLANK
    ld [rIE], a
    ld hl, introVBlankVector
    ld bc, VBLANK_LOAD_VECTOR
    ld d, SIZEOF("intro VBlank Vector")
    call MemCopy
    call WaitVBlank
    ;ld a, LCDCF_OFF| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BGON 
    xor a
    ldh [rLCDC], a
    ld a, $FC
    ld [rBGP], a;load intro pallet
    call loadIntroMap
    call setupSprites

    ld hl, $8089
    call introMessup
    
    ld a, LCDCF_ON| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BG9800 | LCDCF_BGON  | LCDCF_OBJON | LCDCF_OBJ8
    ldh [rLCDC], a
    ei
    ret

setupSprites:
    xor a
    ld [V_intro_dripCounter], a
    ld a, 10
    ld [V_intro_dripCounter2], a
    ld a, 18
    ;ld a, $FF
    ld [V_intro_dripCounter3], a

    xor a
    ;clear sprites
    ld hl, $FE00
    ld d, $FF
    call MemSet 
    ld a, 40
    ld [$FE01], a
    ld a, 8
    ld [$FE00+2], a

    ld a, 72
    ld [$FE01+4], a
    ld a, $11
    ld [$FE00+2+4], a

    ld a, 104
    ld [$FE01+8], a
    ld a, $15
    ld [$FE00+2+8], a
    ret



loadIntroMap:;load standard GB intro map, assuming that the tiles are loaded
    ld hl, introMap.upper
    ld bc, $98A4 + $60; +$20 for next
    ld d, 13
    call MemCopy
    ld hl, introMap.lower
    ld bc, $98A4 + $80; +$20 for next
    ld d, 12
    call MemCopy
    ret

introMessup:
    ;mess up nintendo logo
    ;assume $8010 - $81A0 tiles
    ld hl, MemCopyLong;intentional garbage load
    ld bc, $8010+ 25
    ld de, 65
    call MemCopyLong
    ld bc, $8010+ 25 + 65 + 40
    ld de, 30
    call MemCopyLong
    ld bc, $8010+ 25 + 65 + 40 + 30 + 30
    ld de, 40
    call MemCopyLong

    ld bc, $8010+ 25 + 65 + 40 + 30 + 30 + 40 + 50
    ld de, 60
    call MemCopyLong

    ld hl, evil_Trademark_tile_data
    ld bc, $8190
    ld d, 16
    call MemCopy

    ret


introMap:;len 24
.upper
    db $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $19
.lower
    db $0D, $0E, $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18


evil_Trademark_tile_data:; trademark.... but EVIL 
DB $3C,$3C,$42,$42,$BD,$BD,$95,$95,$95,$95,$A9,$A9,$42,$42,$3C,$3C


;interrupts
;============================================
;vectors
introVBlankVector:
    LOAD "intro VBlank Vector", WRAM0
    jp introVBlank
    endl

    



;routines
introVBlank: ;PLEASE CLEAN UP AFTER VALIDATING THE TABLE
    ld hl, V_intro_dripCounter
    ld bc, $FE00
    call dripSprite
    ld hl, V_intro_dripCounter2
    ld bc, $FE00 + 4
    call dripSprite
    ld hl, V_intro_dripCounter3
    ld bc, $FE00 + 8
    call dripSprite
    reti


;     introVBlank: ;PLEASE CLEAN UP AFTER VALIDATING THE TABLE
;     ld hl, V_intro_dripCounter
;     ld a, [hl]
;     inc [hl]
;     ld hl, dripTable
;     ld d, 0
;     ld e, a
;     add hl, de
;     ld a, [hl]
;     cp 0
;     jr nz, .writeDripSprite 
; .resetDripCounter
;     xor a
;     ld [V_intro_dripCounter], a
;     ld a, [dripTable]
; .writeDripSprite
;     ld [$FE00], a
;     reti

;dripSprite
;Move sprite down screen from LUT, 
;if dripcCounter = $FF => disable effect
;hl = drip counter, bc = spriteAddress y
dripSprite:
    ld a, [hl]
    cp $FF
    jr z, .exit
    inc [hl]
    push hl
    ld hl, dripTable
    ld d, 0
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp 0
    jr nz, .writeDripSprite 
.resetDripCounter
    xor a
    ld [hl], a
    ld a, [dripTable]
.writeDripSprite
    ld [bc], a
.exit
    ret

dripTable:
incbin "dripTable.bin"
