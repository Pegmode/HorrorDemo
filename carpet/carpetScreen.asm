SECTION "carpet screen", ROMX
carpetScreenInit:
    di
    ld a, IEF_VBLANK 
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

    ;WHY DOES THE WEIRD BG WORK BETTER!??!
    ; ld hl, checkerboardVPt_tile_data
    ; ld bc, $8000
    ; ld de, $01B0
    ; call MemCopyLong

    ld hl, checkerboardVPt_tile_data
    ld bc, $8000
    ld d, $B0
    call MemCopy

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
call runCarpet0
    ei
    ret

runCarpet0:
.l1
    call calculateCarpetFrame0
    ld d, 20
    ld c, 99
    call carpetRasterRoutine
    jr .l1
    ret

runCarpet1:
.l1
    call calculateCarpetFrame1
    ld d, 44
    ld c, 91
    call carpetRasterRoutine
    jr .l1
    ret

calculateCarpetFrame0:
    ld a, [currentSin]
    ld hl, sineLUT0
    add a, l
    ld l, a
    call writeToVirtualScreenUnrolled;unrolled loop
    ld a, [currentSin]
    inc a
    ld [currentSin], a
    ret

calculateCarpetFrame1:
    ld a, [currentSin]
    ld hl, sineLUT1
    add a, l
    ld l, a
    call writeToVirtualScreenUnrolled;unrolled loop
    ld a, [currentSin]
    inc a
    ld [currentSin], a
    ret


carpetRasterRoutine:
;for a given horizontal scanline range, draw the carpet with SCY
;d = first line - 1; c = last line
.l1
    ld a, [rLY]
    cp d
    jr nz, .l1
    inc d
.initRaster
    ld hl, virtualScreen
    ld l, d
    ld b, 0
    ld a, b
    ld [rIF], a 
    ld a, %10
    ld [rIE], a
.rasterLoop
    ld a, l
    cp c
    jr z, .exit
    ld a, %00100000
    ld [rSTAT], a
    halt
    ld a, b
    ld [rIF], a
    ld a, %00011000
    ld [rSTAT], a
    halt;must have hblank in IE
    ;screen stuff
    ld a, [hl]
    sub l
    ld [rSCY], a
    inc l
    ld a, b
    ld [rIF], a
    jr nz, .rasterLoop
.exit
    ld a, c
    ld [rSCY], a    
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
    
    reti

include "graphics/carpet/checkerboardVPt.asm"
SECTION "carpetSin1LUT", ROMX, ALIGN[8]
sineLUT0:
     incbin "carpet/sineLUT0.bin"; min 20, max 99
SECTION "carpetSin2LUT", ROMX, ALIGN[8]     
sineLUT1:
    incbin "carpet/sineLUT2.bin"; min 44, max 91

SECTION "virtualScreen", WRAM0
sineValues:


