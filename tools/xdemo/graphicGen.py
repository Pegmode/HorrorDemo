from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_COLORS1 = ((248,239,121),(177,169,74),(103,100,42),(41,26,15))#BGB yellow pallete, higher = darker
GB_SCREENSIZE = (160,144)
GB_MIDDLE_VIEWPORT = GB_SCREENSIZE[0]//2

PLANE_HEIGHT = 80#8*10

WIDTH = GB_SCREENSIZE[0] +  34
HEIGHT = GB_SCREENSIZE[1]

PLANEMIN = 80
PLANEMAX = PLANEMIN + 8* 7 #7 tiles blank space

BG_SIZE = (WIDTH , HEIGHT)

def paste_raster(mapImage: Image, canvasImage: Image, canvasY: int, rasterX: int):
    '''
    pastes a raster (horizontal line) from an Image(raster) onto another Image (canvas)
    at a given position. Always pastes to left side of screen
    '''
    raster = mapImage.crop((rasterX, canvasY, mapImage.width+rasterX, canvasY+1))
    canvasImage.paste(raster, (0, canvasY, mapImage.width, canvasY+1))
    return canvasImage


def main():
    #Generate base image
    checkerboardWidths = []
    im = Image.new("RGB", BG_SIZE, GB_COLORS1[3])
    pixelColor = GB_COLORS1[0]
    currentRowDistance = 8# The distance in between checker segments for the current row
    startX = GB_SCREENSIZE[0]//2
    rowDistanceSkip = 3 #every n rows do not increase distance

    for i in range(PLANEMIN, PLANEMAX):
        currentX = startX
        checkerboardWidths.append(currentRowDistance)#use later
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

    #generate   
    frames = []
    frameLen = 4
    maxMovement = 0
    offsets = [0] * (PLANEMAX - PLANEMIN)
    for i in range(frameLen):
        canvas = Image.new("RGB", GB_SCREENSIZE, GB_COLORS1[3])
        draw = ImageDraw.Draw(canvas)
        #draw.text((0, 10), "DO YOU DIE AS IT IS HERE,\n THE EXIT IS NOT FOUND")
        for j, y in enumerate(range(PLANEMIN,PLANEMAX)):
            pasteX = offsets[j]
            pasteX = math.ceil((checkerboardWidths[j] / frameLen) * i)
            paste_raster(im, canvas, y, pasteX)
            offsets[j] += j + 1
            if pasteX > maxMovement:
                maxMovement = pasteX
            
        frames.append(canvas)
  
    frames[0].save("test.gif",save_all=True, format = "GIF",append_images=frames[1:],duration=60,loop=0)
    print(maxMovement)




main()