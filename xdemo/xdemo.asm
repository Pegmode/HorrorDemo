
xdemoInit:
    di 
    call WaitVBlank
    xor a
    ldh [rLCDC], a
    ;load xdemo bg
    ld hl, Xdemo_Background_tile_data
    ld bc, $8000
    ld de, $06F0
    call MemCopyLong

    ld hl, Xdemo_Background_map_data
    ld bc, $9800
    ld de, $0400
    call MemCopyLong

    ld a, $FC
    ld [rBGP], a;load intro pallet
    ld a, LCDCF_ON| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BG9800 | LCDCF_BGON  | LCDCF_OBJON | LCDCF_OBJ8
    ldh [rLCDC], a

.l1
    jp tttt



include "graphics/xdemo/XdemoBackgroundGraphics.asm"

tttt:
ld b,b
 jr tttt