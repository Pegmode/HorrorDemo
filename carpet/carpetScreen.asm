SECTION "carpet screen", ROMX
carpetScreenInit:
    di
    ld a, IEF_VBLANK
    ld [rIE], a
    ld hl, carpetVBlankVector
    ld bc, VBLANK_LOAD_VECTOR
    ld d, SIZEOF("carpet VBlank Vector")
    call MemCopy
    call WaitVBlank
    xor a
    ldh [rLCDC], a

    ld hl, checkerboardVPt_tile_data
    ld bc, $8000
    ld de, $01B0
    call MemCopyLong

    ld hl, checkerboardVPt_map_data
    ld bc, $9800
    ld de, $0400
    call MemCopyLong

    ld a, $FC
    ld [rBGP], a;load intro pallet

    ld a, LCDCF_ON| LCDCF_WIN9800 | LCDCF_BG8000 | LCDCF_BG9800 | LCDCF_BGON  | LCDCF_OBJON | LCDCF_OBJ8
    ldh [rLCDC], a
    xor a
    ld [currentSinStart], a
    ei
    ret


generateCarpet1Frame:;generate the offests for a single frame of carpet
    ld bc, $c100;raster buffer
    ld hl, carpetSin1LUT
    ld a, [currentSinStart]
    add a, l
    ld l, a
    ;unroll loop 256 times
    include "carpet/carpetWriteLoop.asm"
    inc l
    ld a, l
    ld [currentSinStart], a
    ld b,b
    ret

inc "sineLUT0.asm"




;interrupts
;============================================
;vectors
carpetVBlankVector:
    LOAD "carpet VBlank Vector", WRAM0
    jp carpetVBlank
    endl

carpetVBlank: 
    call generateCarpet1Frame
    reti
    
include "graphics/carpet/checkerboardVPt.asm"
SECTION "carpetSin1LUT", ROMX, ALIGN[8]
carpetSin1LUT:
    incbin "carpet/carpetSin1.bin"

