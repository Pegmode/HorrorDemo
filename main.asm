
include "hardware.asm"
include "consts.asm"
include "vars.asm"
include "macros.asm"

SECTION "vBlank IRQ",ROM0[$40]
vBlankIRQ:
    ;jp vBlankRoutine
    jp VBLANK_LOAD_VECTOR
    reti

SECTION "STAT IRQ",ROM0[$48]
statIRQ:
    jp STAT_LOAD_VECTOR
    ;jp lcdRoutine
    reti

SECTION "Timer IRQ",ROM0[$50]
timerIRQ:


SECTION "MBCDefinition",ROM0[$147]
    dw CART_ROM_MBC5 

SECTION "EntryPoint",ROM0[$100]
jp codeInit

SECTION "code",ROM0[$150]
codeInit:

    ;set randomm seed
    ld a, 4
    ld [Seed], a
    inc a
    ld [Seed+1], a


    ;call staticScreenInit
    ;call introScreenInit
    ;call carpetScreenInit
    call xdemoInit

main:
    halt
    jp main

include "utils.asm"
include "introScreen.asm"
include "staticScreen.asm"
include "xdemo/xdemo.asm"
include "carpet/carpetScreen.asm"
include "graphics/VHS FONT/vhsFontTiles.asm"
randMapData:
incbin "randMapData.bin"
randTileData:
incbin "randTilesData.bin"