writeToVirtualScreenUnrolled:
; write from sine LUT to table for drawing carpet later
;warning: sine LUT MUST be 8 bit aligned
; hl = starting address for the first frame in the sine LUT
        ld a, [hl]
        ld [virtualScreen + 0], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 1], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 2], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 3], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 4], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 5], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 6], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 7], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 8], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 9], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 10], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 11], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 12], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 13], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 14], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 15], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 16], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 17], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 18], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 19], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 20], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 21], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 22], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 23], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 24], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 25], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 26], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 27], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 28], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 29], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 30], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 31], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 32], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 33], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 34], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 35], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 36], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 37], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 38], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 39], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 40], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 41], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 42], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 43], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 44], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 45], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 46], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 47], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 48], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 49], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 50], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 51], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 52], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 53], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 54], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 55], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 56], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 57], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 58], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 59], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 60], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 61], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 62], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 63], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 64], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 65], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 66], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 67], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 68], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 69], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 70], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 71], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 72], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 73], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 74], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 75], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 76], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 77], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 78], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 79], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 80], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 81], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 82], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 83], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 84], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 85], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 86], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 87], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 88], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 89], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 90], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 91], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 92], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 93], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 94], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 95], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 96], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 97], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 98], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 99], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 100], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 101], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 102], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 103], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 104], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 105], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 106], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 107], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 108], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 109], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 110], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 111], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 112], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 113], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 114], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 115], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 116], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 117], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 118], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 119], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 120], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 121], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 122], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 123], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 124], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 125], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 126], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 127], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 128], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 129], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 130], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 131], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 132], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 133], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 134], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 135], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 136], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 137], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 138], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 139], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 140], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 141], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 142], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 143], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 144], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 145], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 146], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 147], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 148], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 149], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 150], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 151], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 152], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 153], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 154], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 155], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 156], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 157], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 158], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 159], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 160], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 161], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 162], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 163], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 164], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 165], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 166], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 167], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 168], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 169], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 170], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 171], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 172], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 173], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 174], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 175], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 176], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 177], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 178], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 179], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 180], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 181], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 182], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 183], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 184], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 185], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 186], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 187], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 188], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 189], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 190], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 191], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 192], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 193], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 194], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 195], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 196], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 197], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 198], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 199], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 200], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 201], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 202], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 203], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 204], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 205], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 206], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 207], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 208], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 209], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 210], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 211], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 212], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 213], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 214], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 215], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 216], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 217], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 218], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 219], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 220], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 221], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 222], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 223], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 224], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 225], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 226], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 227], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 228], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 229], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 230], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 231], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 232], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 233], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 234], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 235], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 236], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 237], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 238], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 239], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 240], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 241], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 242], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 243], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 244], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 245], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 246], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 247], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 248], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 249], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 250], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 251], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 252], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 253], a
        inc l
        ld a, [hl]
        ld [virtualScreen + 254], a
        inc l
        ret