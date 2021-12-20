#reorder text tiles for better loading/ref
#lazy

FILENAME_IN = "h1.asm"
FILENAME_OUT = "outText.asm"
OFFSET = 0x42//2

def reorder():
    f = open(FILENAME_IN, "r")
    lines = f.readlines()
    f.close()
    outLines = []

    i = 0
    while i < len(lines)/2:
        outLines.append(lines[i])
        outLines.append(lines[i+OFFSET])
        i += 1




    f = open(FILENAME_OUT, "w")
    for line in outLines:
        f.write(line)
    f.close()

reorder()