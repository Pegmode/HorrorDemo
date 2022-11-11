#Code to generate carpet LUT and python test effect renders
from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageTk
import numpy as np
import math
import sys
import pdb
# INPATH = "online_carpet.jpg"
INPATH = "test.png"
OUTPATH = "texture_carpet.gif"
GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_SCREENSIZE = (160,144)
#global
MAP_HEIGHT = 0#boo hoo global
#debug features
DEBUG_MINMAX = True#add min/max lines to final output

class CProgressBar():
    barLength = 30
    def __init__(self, max):
        self.progress = 0
        self.max = max
    def incProgress(self):
        self.progress += 1
        self.showProgress(self.progress)
    def showProgress(self,cProgress):
        percent = 100 * cProgress // self.max
        cBarLen = int(percent // (100 / self.barLength))
        bar = "=" * cBarLen 
        sys.stdout.write(f"\rRendering...: [{bar}]{percent}%")
        sys.stdout.flush()

def paste_raster(mapImage: Image, canvasImage: Image, rasterY: int, canvasY: int):
    '''
    pastes a raster (horizontal line) from an Image(master) onto another Image (canvas)
    at a given position. Always pastes to left side of screen
    '''
    if mapImage.width > canvasImage.width:
        raise Exception("Attempted to copy a raster from a map that is larger than the canvas.")
    raster = mapImage.crop((0, rasterY, mapImage.width, rasterY+1))
    canvasImage.paste(raster, (0, canvasY, mapImage.width, canvasY+1))
    #print(f"Pasting from {rasterY} to {canvasY}")
    return canvasImage

def zDepth2Raster(z: int):
    '''
    convert a Z depth to a raster line in map
    keep this simple calc in a function because different renderings can have hugely different calculations
    '''
    return z//4

    # 0xff//H = 64


def singleRotateList(list):#rotate list by 1 
    return list[1:] + list[:1]


def sineFuncTest(x):#pull LUT sine value based on overflow LUT pointer
    maxY = 100
    minY = 20
    mid = maxY - (maxY-minY)//2
    scale = maxY - mid
    period = 0xFF#the domain of the func. aka the max value of the lookup table
    return math.floor(scale * math.sin((2 * math.pi / period) * x) + mid)

def sineFuncTestOdd(x):#mixed function w/ long dist bg
    maxY2 = 50
    minY2 = 20
    mid2 = maxY2 - (maxY2-minY2)//2
    scale2 = maxY2 - mid2
    period2 = 0xFF//4#the domain of the func. aka the max value of the lookup table
    maxY = 100
    minY = 20
    mid = maxY - (maxY-minY)//2
    scale = maxY - mid
    period = 0xFF#the domain of the func. aka the max value of the lookup table
    return math.floor(scale2 * math.sin((2 * math.pi / period2) * x) + mid2) + math.floor(scale * math.sin((2 * math.pi / period) * x) + mid)


def generateSineTable(func = 0):# generate the sine lookuptable. func determines which sine function is used
    sineFunctions = {
        0: sineFuncTest,
        1: sineFuncTestOdd
    }
    return [sineFunctions[func](i) for i in range(0xFF)]#set position initial states

def main():
    Z_DEPTH = 0xFF
    mapImage = Image.open(INPATH)
    MAP_HEIGHT = mapImage.height
    frames = []
    numberFrames = 0xFF
    pBar = CProgressBar(numberFrames)
    pBar.showProgress(0)
    segmentPos = generateSineTable()
    for i in range(0xFF):#frames
        im = Image.new("RGB", GB_SCREENSIZE)
        for j in range(Z_DEPTH):#Z chunks
            z = zDepth2Raster(j)#depth chunk (need to convert to raster because raster height is small)
            y = segmentPos[j]#y coord on canvas
            paste_raster(mapImage, im, z, y)
        segmentPos = singleRotateList(segmentPos)
        if DEBUG_MINMAX: testMaxMin(im)
        frames.append(im.copy())
        pBar.showProgress(i)
    print("\nRendering Complete!")
    
    frames[0].save(OUTPATH,save_all=True, format = "GIF",append_images=frames[1:],duration=25,loop=0)


    # for i in range(0xFF):#frames
    #     im = Image.new("RGB", GB_SCREENSIZE)
    #     for j in range(Z_DEPTH):#Z chunks
    #         z = zDepth2Raster(j)#depth chunk (need to convert to raster because raster height is small)
    #         y = segmentPos[j]#y coord on canvas
    #         paste_raster(mapImage, im, z, y)

    #     singleRotateList(segmentPos)
    #     frames.append(im)
    # frames[0].save("TextureTest.gif",save_all=True, format = "GIF",append_images=frames[1:],duration=25,loop=0)
            

def debugDrawHorzLine(im, y):#draw a horizontal line on im at y pos
    draw = ImageDraw.Draw(im)
    draw.line((0,y, GB_SCREENSIZE[0],y),fill="red")

def testMaxMin(im):#test and output for max/min y values
    maxY = findColorStart(im)
    minY = findColorStart(im, True)
    if -1 in (maxY, minY):
        raise Exception("Could could Not find a min/max color value (image is completely black?)")
    debugDrawHorzLine(im,minY)
    debugDrawHorzLine(im,maxY)
    draw = ImageDraw.Draw(im)
    draw.text((0,maxY),f"Max:{maxY}",fill="green")
    draw.text((0,minY),f"Max:{minY}",fill="green")




def findColorStart(im,reverse=False):#given an image find the start of the non-black pixels in horizontal strips
    yCoordList = list(range(GB_SCREENSIZE[1]))
    if reverse:
        yCoordList.reverse()
    for i in yCoordList:
        for j in range(GB_SCREENSIZE[0]):
            x=im.getpixel((j,i))
            if im.getpixel((j,i)) != (0,0,0):
                return i
    return -1

def exportLUT(lut = 0):#export the sine function as a gbasm lut
    outPath = f"sineLUT{lut}.bin"
    sineTable = generateSineTable(lut)
    f = open(outPath, "wb")
    f.write(bytearray(sineTable))
    f.close()




def test():
    x = remap(12,)
# test()
exportLUT()
#main()