#generate the unrolled loop
OUTFILE = "carpetLoop.asm"
LOOP_CODE = '''ld a, [hl] 
ld c, a 
ld a, {}
ld [bc], a 
inc l \n'''

outstring = ""
for i in range(256//4):
    for j in range(4):
        outstring += LOOP_CODE.format(i)

f = open(OUTFILE, "w")
f.write(outstring)
f.close()