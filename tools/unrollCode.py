UNROLL_ITERATIONS = 0xFF
outtext = ''
outpath = "unrolled.asm"

for i in range(UNROLL_ITERATIONS//4):
    code = f'''
            ld e, [hl]
            inc l
            ld [de], a
            ld e, [hl]
            inc l
            ld [de], a
            ld e, [hl]
            inc l
            ld [de], a
            inc a'''
    outtext += code

f = open(outpath, "w")
f.write(outtext)
f.close()
