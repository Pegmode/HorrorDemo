;Static screen
;
staticScreenInit:
    di
    ;load new interrupts
    ld hl, staticVblankVector
    ld bc, VBLANK_LOAD_VECTOR
    ld d, SIZEOF("static VBlank Vector")
    call MemCopy

    ld hl, staticLCDVector
    ld bc, STAT_LOAD_VECTOR
    ld de, SIZEOF("static LCD Vector")
    call MemCopyLong

    ;setup VRAM
    call WaitVBlank
    ld a, %01111111
    ld [rLCDC], a

    ;clear vram
    ld hl, $FE00
    ld bc, $FF
    call clearMem

    call LoadNormalPallet
    ;load text tiles
    ld hl, vhsFontTiles
    ld bc, $8000;bank1
    ld de, $0420+ $0440
    call MemCopyLong
    ;OBJ pallet
    ld a, %00000011;inverted
    ld [rOBP0], a
    ;load text
    call loadPlayText
    ;call loadXText1
    ;load random tiles
    ld hl, randTileData
    ld bc, $9000; tile bank 2
    ld d, RAND_TILE_COUNT
    call MemCopy
    ;load random map
    ld hl, randMapData
    ld bc, _SCRN0
    ld de, RAND_MAP_COUNT
    call MemCopyLong
    ld a, STATF_LYC ; ly = lyc
    ld [rSTAT], a
    ld a, 0
    ld [rLYC], a
    ld a, IEF_VBLANK | IEF_LCDC; enable interrupts
    ld [rIE], a
    ld a, %10010001
    ld a, LCDCF_ON | LCDCF_BGON | LCDCF_OBJ16 | LCDCF_BG8800| LCDCF_OBJON
    ld [rLCDC], a
    ei
    ret

loadPlayText:

    ld de, $FE00
    ld hl, xPlayText
    ld b, 20
    ld c, 40
    call vcrTextWriteAll
    ret

loadXText1:
    ;set OBJ flags
    ld d, $80
    call setAllObjFlag
    ;load all  text sprites
    ld de, $FE00
    ld hl, xText
    ld b, 20
    ld c, 40
    call vcrTextWriteAll
    ld hl, xText2
    ld b, 20
    ld c, 60
    call vcrTextWriteAll
    ld hl, xText3
    ld b, 20
    ld c, 80
    call vcrTextWriteAll
    ld hl, xText4
    ld b, 20
    ld c, 100
    call vcrTextWriteAll
    ret

xText:
    db "THE EXIT IS"
    db 0

xText2:
    db "NOT FOUND."
    db 0

xText3:
    db "DO YOU DIE AS"
    db 0
xText4:
    db "IT IS HERE?"
    db 0

xPlayText:
    db "PLAY"
    db 0

;interrupt vectors
staticVblankVector:
    LOAD "static VBlank Vector", WRAM0
    jp staticVBlank
    ENDL

staticLCDVector:
    LOAD "static LCD Vector", WRAM0
    jp staticLCDRoutine
    ENDL

;interrupt routines
staticVBlank:
    call RandomNumber
    ld [rSCY], a
    call RandomNumber
    ld [rSCX], a
    reti


staticLCDRoutine:
    ld a, [rBGP]
    ;cp $E4;norm pallet
    cp %11011111;norm pallet   
    jr nz, .scanlineRendering

.normalRendering
    ;xor a;ld 0
    ld a, %01010101
    ld [rBGP], a
    ld a, [rLYC]
    inc a
    ld [rLYC], a
    reti

.scanlineRendering
    ;ld a, $E4; normal pallet
    ld a, %11011111
    ld [rBGP], a
    ;check for bottom of screen
    ld a, [rLYC]
    cp 153;end of screen
    jr nz, .exit
    xor a
    ld [rLYC], a
    reti
.exit
    reti
