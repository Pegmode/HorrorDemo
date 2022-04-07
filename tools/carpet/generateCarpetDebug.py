#generate a Carpet texture
#By Pegmode
from textwrap import fill
from turtle import width
from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

OUTPATH = "test.png"
RESOLUTION = (128,64)#don't go higher than 64 for 
CHECKER_HEIGHT = 3#how many pixels deep is every tile on the image?
X_DIVISION_FACTOR = 16#how many divisions in the x make up the checkerboard
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
    for y in reversed(range(HEIGHT)):
        y_iter = HEIGHT - y#ith line from the bottom of the screen
        raster_range = range(y_iter - 1, WIDTH - y_iter)#range of the current raster line
        for x in raster_range:
            if (x // X_DIVISION_FACTOR) % 2 == (y // CHECKER_HEIGHT % 2) :
                px[x,y] = fillColor
            

            #px[x,y] = fillColor
             
    im.show()
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