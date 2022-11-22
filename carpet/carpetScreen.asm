SECTION "carpet screen", ROMX
carpetScreenInit:
    di
    ld a, IEF_VBLANK | IEF_STAT
    ld [rIE], a
    ld hl, carpetVBlankVector
    ld bc, VBLANK_LOAD_VECTOR
    ld d, SIZEOF("carpet VBlank Vector")
    call MemCopy
    ld hl, carpetSTAT
    ld bc, STAT_LOAD_VECTOR
    ld d, SIZEOF("carpet STAT Vector")
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
    ld [currentSin], a
;DEBUG REMOVE
call calculateCarpetFrame0
    ei
    ret

calculateCarpetFrame0:
    ld a, [currentSin]
    ld hl, sineLUT0
    add a, l
    ld l, a
    call writeToVirtualScreenUnrolled;unrolled loop
    ld hl, virtualScreen 
    ret

    
    
    


include "carpet/writeToVirtualScreenUnrolled.asm"


;interrupts
;============================================
;vectors
carpetVBlankVector:
    LOAD "carpet VBlank Vector", WRAM0
    jp carpetVBlank
    endl

carpetHBlankVector:
    LOAD "carpet STAT Vector", WRAM0
    jp carpetSTAT
    endl

carpetVBlank: 
    nop
    reti

carpetSTAT:
    nop
    reti

include "graphics/carpet/checkerboardVPt.asm"
SECTION "carpetSin1LUT", ROMX, ALIGN[8]
sineLUT0:
    incbin "carpet/sineLUT0.bin"

SECTION "virtualScreen", WRAM0
sineValues:


