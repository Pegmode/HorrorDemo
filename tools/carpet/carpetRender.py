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
DEBUG_MINMAX = False#add min/max lines to final output

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
    m1 = 20
    M1 = 99
    s = M1/2
    period = 0xFF#the domain of the func. aka the max value of the lookup table
    return math.floor((s/2)* (math.sin((2 * math.pi / period))))

def sineFuncOdd2(x):#from desmos
    m1 = 20
    M1 = 99
    s = M1/2
    p1 = 255
    p2 = 127.5
    h = 68
    v = 3.7
    return math.floor((s/v) * (math.sin(((2 * math.pi / p1) * x)) + math.sin((2 * math.pi / p2) * x)) + h)

def sineFuncOdd3(x):#from desmos
    m1 = 20
    M1 = 99
    s = M1/2
    p1 = 230
    p2 = 134.9
    h = 66
    v = 3.5
    return math.floor((s/v) * (math.sin(((2 * math.pi / p1) * x)) + math.sin((2 * math.pi / p2) * x)) + h)


def generateSineTable(func = 0):# generate the sine lookuptable. func determines which sine function is used
    sineFunctions = {
        0: sineFuncTest,
        1: sineFuncTestOdd,
        2: sineFuncOdd2,
        3: sineFuncOdd3
    }
    return [sineFunctions[func](i) for i in range(0xFF)]#set position initial states

def main(func = 0):
    Z_DEPTH = 0xFF
    mapImage = Image.open(INPATH)
    MAP_HEIGHT = mapImage.height
    frames = []
    numberFrames = 0xFF
    pBar = CProgressBar(numberFrames)
    pBar.showProgress(0)
    segmentPos = generateSineTable(func)
    for i in range(0xFF):#frames
        im = Image.new("RGB", GB_SCREENSIZE)
        for j in range(Z_DEPTH):#Z chunks
            z = zDepth2Raster(j)#depth chunk (need to convert to raster because raster height is small)
            y = segmentPos[j]#y coord on canvas
            paste_raster(mapImage, im, z, y)
        # for z in range(Z_DEPTH//4):#Z chunks
        #     y = segmentPos[z]#y coord on canvas
        #     paste_raster(mapImage, im, z, y)
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
    # for c, v in enumerate(sineTable):
    #     sineTable[c] = zDepth2Raster(v)
    f = open(outPath, "wb")
    f.write(bytearray(sineTable))
    f.close()
    

Z_POSITIONS = [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23, 23, 23, 24, 24, 24, 24, 25, 25, 25, 25, 26, 26, 26, 26, 27, 27, 27, 27, 28, 28, 28, 28, 29, 29, 29, 29, 30, 30, 30, 30, 31, 31, 31, 31, 32, 32, 32, 32, 33, 33, 33, 33, 34, 34, 34, 34, 35, 35, 35, 35, 36, 36, 36, 36, 37, 37, 37, 37, 38, 38, 38, 38, 39, 39, 39, 39, 40, 40, 40, 40, 41, 41, 41, 41, 42, 42, 42, 42, 43, 43, 43, 43, 44, 44, 44, 44, 45, 45, 45, 45, 46, 46, 46, 46, 47, 47, 47, 47, 48, 48, 48, 48, 49, 49, 49, 49, 50, 50, 50, 50, 51, 51, 51, 51, 52, 52, 52, 52, 53, 53, 53, 53, 54, 54, 54, 54, 55, 55, 55, 55, 56, 56, 56, 56, 57, 57, 57, 57, 58, 58, 58, 58, 59, 59, 59, 59, 60, 60, 60, 60, 61, 61, 61, 61, 62, 62, 62, 62, 63, 63, 63]



def test():
    lut = 0
    sineTable = generateSineTable(lut)
    for c, v in enumerate(sineTable):
        sineTable[c] = zDepth2Raster(v)
    outString = "Table:\n"
    for c, v in enumerate(sineTable):
        if c % 16 != 0:
            outString += f"{hex(v)[2:]},"
        else:
            outString += f"{hex(v)[2:]}\n"
    print(outString)

# test()
#exportLUT(2)
main(2)