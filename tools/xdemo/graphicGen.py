from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_COLORS1 = ((248,239,121),(177,169,74),(103,100,42),(41,26,15))#BGB yellow pallete, higher = darker
GB_SCREENSIZE = (160,144)
GB_MIDDLE_VIEWPORT = GB_SCREENSIZE[0]//2

PLANE_HEIGHT = 80#8*10

WIDTH = GB_SCREENSIZE[0]
HEIGHT = GB_SCREENSIZE[1]

PLANEMIN = 80
PLANEMAX = PLANEMIN + 8* 7 #7 tiles blank space

BG_SIZE = GB_SCREENSIZE

def main():
    im = Image.new("RGB", BG_SIZE, GB_COLORS1[3])
    pixelColor = GB_COLORS1[0]
    currentRowDistance = 8# The distance in between checker segments for the current row
    startX = GB_SCREENSIZE[0]//2
    rowDistanceSkip = 3 #every n rows do not increase distance

    for i in range(PLANEMIN, PLANEMAX):
        currentX = startX
        while currentX < BG_SIZE[0]:
            pos = (currentX, i)
            im.putpixel(pos, pixelColor)
            currentX += currentRowDistance
        currentX = startX
        while currentX > 0:
            pos = (currentX, i)
            im.putpixel(pos, pixelColor)
            currentX += -currentRowDistance  
        
        if i % rowDistanceSkip != 0:
            currentRowDistance += 1
    
    im.show()

main()