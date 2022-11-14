UNROLL_ITERATIONS = 0xFF
outtext = ''
outpath = "unrolled.asm"

for i in range(UNROLL_ITERATIONS):
    code = f'''
        ld a, [hl]
        ld [virtualScreen + {i}], a
        inc l'''
    outtext += code

f = open(outpath, "w")
f.write(outtext)
f.close()
