;test bitmap locate

GRIDBASEADDRESS EQU $C000;demonstration purposes, ghost tile ram
VERTICALADDRESSDISTANCE EQU $A; also = tile # width

fillPixel:
;b = x, c = y
;a is destroyed
ld hl, GRIDBASEADDRESS
ld a, b
;a = a/8
sra a
sra a
sra a
add a, l ;ASSUME TOTAL BITMAP TILES <= 128 and L base is $00, total space taken is $FF
ld l, a
;a = tile offset * 8
sla a
sla a
sla a
ld d, a;d
ld a, b; = x
sub 