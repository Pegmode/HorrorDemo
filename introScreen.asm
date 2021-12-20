;intro screen

introScreenInit:
    call WaitVBlank
    ;ld a, LCDCF_OFF| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BGON 
    xor a
    ldh [rLCDC], a
    ld a, $FC
    ld [rBGP], a;load intro pallet

    call loadIntroMap

    ld hl, $8089
    call introMessup
    
    ld a, LCDCF_ON| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BG9800 | LCDCF_BGON 
    ldh [rLCDC], a
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