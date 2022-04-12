ld bc, $c100;raster buffer
ld hl, sinLut

ld a, [sinPointer]
add l, a

;for i in range(256//4)
;for 4 times

ld a, [hl] ;load sin lut val
ld c, a ;lower byte contains line write offset
ld [bc], i ;load current z depth into buffer position
inc l ;






; for z depth
;     y_viewport_map = z//4 = y1
;     y_screen = sinfunction(z) =y2
;     put y1 to y2 