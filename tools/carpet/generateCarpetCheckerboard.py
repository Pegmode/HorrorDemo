#generate a Carpet texture
#By Pegmode
from textwrap import fill
from turtle import width
from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

OUTPATH = "test.png"
RESOLUTION = (128,64)#don't go higher than 64 for 
CHECKER_HEIGHT = 4#how many pixels deep is every tile on the image?
X_DIVISION_FACTOR = 64#how many divisions in the x make up the checkerboard
#colors
C_BLACK = 0
C_WHITE = 0xFFFFFF

if RESOLUTION[0] < 2 * RESOLUTION[1]:
    raise Exception("Bad height to width ratio. Width must be at most double the height")

def generateCheckerboard():
    WIDTH = RESOLUTION[0]
    HEIGHT = RESOLUTION[1]
    im = Image.new("RGB", RESOLUTION, "black")
    px = im.load()
    fillColor = ImageColor.getrgb("white")
    for y in range(HEIGHT):#flat checkerboard
        for x in range(WIDTH):
            if (x // X_DIVISION_FACTOR) % 2 ==  (y // CHECKER_HEIGHT % 2):
                px[x,y] = fillColor

    #im.resize((WIDTH//2,HEIGHT)).show()
            
    final_im = Image.new("RGB", RESOLUTION, "black")
    for y in reversed(range(HEIGHT)):
        raster_segment = im.crop((0, y, WIDTH, y+1))
        stretched_segment = raster_segment.resize((y + 1 ,1))
        final_im.paste(stretched_segment, (WIDTH // 2 , y, stretched_segment.width + (WIDTH // 2), y+1))
    final_im = final_im.transpose(Image.FLIP_LEFT_RIGHT)
    im = im.transpose(Image.FLIP_LEFT_RIGHT)
    for y in reversed(range(HEIGHT)):
        raster_segment = im.crop((0, y, WIDTH, y+1))
        stretched_segment = raster_segment.resize((y + 1 ,1))
        final_im.paste(stretched_segment, (WIDTH // 2 , y, stretched_segment.width + (WIDTH // 2), y+1))

    final_im.show()   
    final_im.save(OUTPATH)   
    # im.show()
    # im.save(OUT)


#fill factor: val = (i // f) % 2


def test():
    h = 27#fake height
    f = 3#fake vert factor
    for i in range(h):
        val = i // f % 2
        print(val)

generateCheckerboard()
#test()