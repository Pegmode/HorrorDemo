
FontImageH1_tile_data_size EQU $0420*2
FontImageH1_tile_count EQU $42*2


SECTION "vhsData", ROM0, ALIGN[8];needed for translation l index

vhsTranslationTable:
    ;CURRENT ORDER A-B, 0-1, a-b
    ;start @ base - 0x20, add offset to start value
    ;entries are tile index in vram
    ;   " "  !   "   #   $   %   &   '   (   )   *   +   '   -   .   /
    db 00, 01*2, 02*2, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 03*2, 04*2, 00
    ;      0     1     2    3     4     5     6     7     8     9    :   ;   <   =   >    ?
    db 05*2, 06*2, 07*2, 08*2, 09*2, 10*2, 11*2, 12*2, 13*2, 14*2, 00, 00, 00, 00, 00, 15*2
    ;    @     A     B     C     D   E     F     G     H     I     J     K     L     M     N     O
    db 00, 16*2, 17*2, 18*2, 19*2, 20*2, 21*2, 22*2, 23*2, 24*2, 25*2, 26*2, 27*2, 28*2, 29*2, 30*2
    ;      P     Q     R     S     T     U     V     W     X     Y    Z
    db 31*2, 32*2, 33*2, 34*2, 35*2, 36*2, 37*2, 38*2, 39*2, 40*2, 41*2
    ;  [   \   ]   ^   _   `
    db 00, 00, 00, 00, 00, 00
    ;    a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p
    db 42*2, 43*2, 44*2, 45*2, 46*2, 47*2, 48*2, 49*2, 50*2, 51*2, 52*2, 53*2, 54*2, 55*2, 56*2, 57*2
    ;   q   r    s   t   u   v   w   x   y   z
    db 58*2, 59*2, 60*2, 61*2, 62*2, 63*2, 64*2, 65*2, 66*2, 67*2 

vhsFontTiles:
    ;h1
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$60,$00,$60,$00,$60,$00,$60
    DB $00,$60,$00,$60,$00,$60,$00,$60,$60,$00,$00,$00,$00,$60,$00,$60
    DB $00,$00,$00,$00,$00,$00,$00,$00,$72,$37,$72,$37,$45,$32,$22,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$80,$7C,$FC,$7C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$28,$10,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$CA,$87
    DB $D6,$8F,$CE,$9B,$D2,$BB,$E2,$F3,$82,$E3,$A6,$C3,$45,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$30,$18,$10,$38,$30,$78,$50,$38
    DB $30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$50,$3C,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C2,$42,$82
    DB $06,$02,$44,$3E,$FC,$7C,$E0,$C0,$C0,$80,$C0,$80,$80,$FE,$FE,$FE
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$42,$83
    DB $06,$03,$25,$1E,$25,$1E,$02,$07,$42,$83,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$04,$0C,$1C,$0C,$3C,$1C,$64,$3C
    DB $B4,$6C,$44,$EC,$C4,$8C,$FE,$FF,$05,$FE,$04,$0C,$04,$0C,$04,$0C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$81,$FE,$C0,$80,$80,$FC
    DB $FC,$FE,$02,$07,$02,$03,$02,$03,$42,$83,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C1,$82
    DB $C0,$80,$80,$FC,$FC,$FE,$C2,$87,$C2,$83,$A6,$C3,$45,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$02,$FF,$02,$03,$06,$03
    DB $0B,$06,$16,$0C,$3C,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C2,$83
    DB $86,$C3,$45,$FE,$FC,$7E,$E2,$C7,$C2,$83,$A6,$C3,$45,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$7C,$3C,$F8,$46,$C7,$82,$C3,$82
    DB $C3,$82,$FF,$42,$7F,$3E,$03,$02,$83,$02,$C7,$82,$F8,$46,$7C,$3C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$42,$83
    DB $06,$03,$09,$06,$1C,$0C,$3C,$18,$28,$10,$00,$00,$28,$10,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$30,$18,$1C,$38,$24,$7C,$49,$E6
    DB $A6,$C3,$C2,$83,$C2,$83,$FE,$FF,$82,$FF,$C2,$83,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$84,$FE,$C6,$83,$C2,$83
    DB $C6,$83,$85,$FE,$FC,$FE,$C2,$87,$C2,$83,$C6,$83,$85,$FE,$FC,$FC
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C1,$82
    DB $C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$A6,$C3,$47,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$84,$FE,$C6,$83,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C6,$83,$85,$FE,$FC,$FC
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$81,$FE,$C0,$80,$C0,$80
    DB $C0,$80,$80,$FC,$FC,$FC,$C0,$80,$C0,$80,$C0,$80,$81,$FE,$FE,$FF
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$81,$FE,$C0,$80,$C0,$80
    DB $C0,$80,$80,$FC,$FC,$FC,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C1,$82
    DB $C0,$80,$D1,$8E,$DE,$8F,$C2,$83,$C2,$83,$A6,$C3,$45,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $C2,$83,$82,$FF,$FE,$FF,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$50,$3C,$30,$18,$30,$18
    DB $30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$50,$3C,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3E,$1F,$25,$1E,$04,$0C,$04,$0C
    DB $04,$0C,$04,$0C,$04,$0C,$04,$0C,$44,$8C,$B4,$CC,$CC,$78,$30,$78
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C3,$86,$C6,$8C,$D8,$8C
    DB $F4,$98,$A8,$F0,$E0,$F0,$D0,$B8,$C8,$9C,$D6,$8C,$CB,$86,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C0,$80,$C0,$80,$C0,$80,$C0,$80
    DB $C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$81,$FE,$FE,$FF
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$E2,$C7,$F6,$EF
    DB $BA,$FF,$D6,$BB,$F2,$9B,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$A6,$C3,$45,$FE,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$84,$FE,$C6,$83,$C2,$83
    DB $C6,$83,$85,$FE,$FC,$FC,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80
    DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$F6,$9B,$CA,$9F,$B7,$CE,$47,$FE,$32,$7B
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$84,$FE,$C6,$83,$C2,$83
    DB $C6,$83,$85,$FE,$FC,$FC,$D0,$B8,$C8,$9C,$D6,$8C,$CB,$86,$C2,$83

        DB $00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$C4,$7E,$A6,$C3,$C1,$82
    DB $A0,$C0,$40,$FC,$45,$3E,$06,$03,$42,$83,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$11,$FE,$30,$18,$30,$18
    DB $30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$49,$E6,$A6,$7C,$78,$3C,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $C2,$83,$EA,$93,$F2,$9B,$F2,$9B,$F2,$9B,$92,$FF,$FC,$7E,$24,$6C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$61,$C6
    DB $B6,$6C,$78,$3C,$1C,$38,$BE,$7C,$4D,$E6,$A6,$C3,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $A6,$C3,$C8,$66,$2C,$7C,$1C,$38,$30,$18,$30,$18,$30,$18,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF,$02,$FF,$02,$03,$0B,$06
    DB $16,$0C,$08,$1C,$10,$38,$20,$70,$40,$E0,$A0,$C0,$81,$FE,$FE,$FF
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$45,$3E
    DB $06,$03,$46,$3B,$FE,$7F,$A2,$C7,$C2,$83,$A2,$C7,$46,$FF,$3E,$7B
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C0,$80,$C0,$80,$C0,$80,$D8,$BC
    DB $F4,$FE,$FA,$E7,$E2,$C3,$E2,$C3,$C6,$E3,$F9,$E6,$D4,$BC,$FC,$98
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BE,$7C
    DB $47,$FE,$A6,$C3,$C0,$80,$C0,$80,$C1,$82,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$02,$03,$02,$03,$02,$03,$76,$3B
    DB $EA,$7F,$D6,$EF,$C2,$87,$C2,$87,$AA,$C7,$56,$EF,$2E,$7B,$12,$3B
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BE,$7C
    DB $47,$FE,$A6,$C3,$FE,$FF,$80,$FE,$C0,$80,$E2,$C7,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$1C,$0E,$30,$1E,$30,$18,$FC,$7E
    DB $90,$7E,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$7C,$7B,$C6
    DB $86,$C3,$A6,$C3,$FE,$7F,$86,$7B,$02,$03,$A2,$47,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C0,$80,$C0,$80,$C0,$80,$D8,$BC
    DB $B6,$FC,$FB,$E6,$E2,$C3,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$18,$28,$10,$00,$00
    DB $48,$30,$30,$78,$30,$18,$30,$18,$30,$18,$34,$18,$08,$1C,$04,$0C
    DB $00,$00,$00,$00,$00,$00,$08,$04,$04,$0C,$00,$00,$00,$00,$3C,$1C
    DB $24,$1C,$04,$0C,$04,$0C,$04,$0C,$04,$0C,$14,$0C,$48,$3C,$30,$78
    DB $00,$00,$00,$00,$00,$00,$00,$00,$C0,$80,$C0,$80,$C0,$80,$C6,$83
    DB $CB,$86,$D6,$8C,$FC,$98,$D0,$B8,$E8,$FC,$D6,$EC,$8B,$C6,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BC,$FE
    DB $D7,$FE,$F2,$9B,$F2,$9B,$F2,$9B,$F2,$9B,$F2,$9B,$F2,$9B,$F2,$9B
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BC,$FE
    DB $C7,$FE,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BE,$7C
    DB $C6,$FF,$A6,$C3,$C2,$83,$C2,$83,$C2,$83,$A6,$C3,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$DC,$BC,$E5,$FE
    DB $C6,$E3,$E2,$C3,$E2,$C3,$C2,$E7,$FC,$FE,$C0,$BC,$C0,$80,$C0,$80
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3E,$7B,$46,$FF
    DB $AA,$C7,$C2,$87,$C2,$87,$EE,$C7,$FE,$7F,$4A,$37,$02,$03,$02,$03
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE,$9C
    DB $B7,$FE,$F6,$E3,$E3,$C0,$C0,$80,$C0,$80,$C0,$80,$C0,$80,$C0,$80
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BE,$7C
    DB $47,$FE,$E6,$C3,$F0,$78,$0E,$3C,$5B,$86,$A2,$C7,$C4,$7E,$3C,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$30,$18,$30,$18,$30,$18,$3C,$7C
    DB $50,$3C,$30,$18,$30,$18,$30,$18,$30,$18,$34,$18,$18,$0C,$04,$0C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$C2,$83,$A6,$C3,$47,$FE,$BE,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C2,$83
    DB $C2,$83,$C2,$83,$C2,$83,$C2,$83,$CA,$E7,$E4,$7E,$78,$3C,$30,$18
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C2,$83
    DB $C2,$83,$C2,$83,$F2,$9B,$F2,$9B,$F2,$9B,$B6,$DB,$57,$FE,$24,$6C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$A6,$C3
    DB $4B,$E6,$BE,$7C,$1C,$38,$30,$18,$78,$3C,$B6,$6C,$6B,$C6,$C2,$83
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C2,$83,$C6,$83
    DB $C2,$87,$CA,$87,$FE,$CF,$FE,$7B,$4A,$33,$06,$03,$45,$3E,$3E,$7C
    DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE,$FF
    DB $06,$FF,$0B,$06,$1C,$0C,$3C,$18,$68,$30,$B0,$60,$61,$FE,$FE,$FF