from PIL import Image, ImageDraw, ImagePalette, ImageFont
import numpy as np
import math
GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_SCREENSIZE = (160,144)

def drawHozSegment(y, width, draw, fill = 1, ptWidth = 1):
    midline = GB_SCREENSIZE[0]//2
    linePts = [(midline - (width/2), y), (midline + (width/2), y)]
    draw.line(linePts, fill=fill, width=ptWidth)

def byte2rad(byte):#convert int in 256 range to its corresponding rad value
    return (2*math.pi/0xFF) * byte

def main():
    #setup screen
    # im = Image.new("P", GB_SCREENSIZE)
    # im.putpalette(palette)
    # draw = ImageDraw.Draw(im, "P")
    # #drawing
    # #vertices y coords

    # drawHozSegment(v1, 30, draw, ptWidth=3)
    # drawHozSegment(v2, 30, draw, ptWidth=3)
    # drawHozSegment(v3, 30, draw, ptWidth=3)
    palette = ImagePalette.ImagePalette(mode = "RGB", palette = GB_PALETTE1)
    frames = []
    v1Rot = 20
    v2Rot = 40
    v3Rot = 60
    for i in range(0xFF):
        im = Image.new("P", GB_SCREENSIZE)
        im.putpalette(palette)
        draw = ImageDraw.Draw(im, "P")
        v1Rot = v1Rot+1%0xff
        v2Rot = v2Rot+1%0xff
        v3Rot = v3Rot+1%0xff
        y1 = sineFuncTest(v1Rot)
        y2 = sineFuncTest(v2Rot)
        y3 = sineFuncTest(v3Rot)
        drawHozSegment(y1,20, draw, ptWidth=2)
        drawHozSegment(y2,40, draw, ptWidth=2)
        drawHozSegment(y3,60, draw, ptWidth=2)
        frames.append(im)
    frames[0].save("carpet.gif",save_all=True, format = "GIF",append_images=frames[1:],duration=25,loop=0)

        
def sineFuncTest(x):#pull LUT sine value based on overflow LUT pointer
    maxY = 100
    minY = 20
    mid = maxY - (maxY-minY)//2
    scale = maxY - mid
    period = 0xFF#the domain of the func. aka the max value of the lookup table
    return scale * math.sin((2 * math.pi / period) * x) + mid

def test():
    palette = ImagePalette.ImagePalette(mode = "RGB", palette = GB_PALETTE1)
    im = Image.new("P", GB_SCREENSIZE)
    im.putpalette(palette)
    draw = ImageDraw.Draw(im, "P")

    min = 20
    max = 100

    v1 = min
    v2 = max - (max - min)//2
    v3 = max
    drawHozSegment(v1, 20, draw, ptWidth=3)
    drawHozSegment(v2, 40, draw, ptWidth=3)
    drawHozSegment(v3, 60, draw, ptWidth=3)
    im.show()

        

main()
