from PIL import Image, ImageDraw, ImagePalette, ImageFont
import numpy as np
from math import *
#from GBScreen import GBScreen
GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_SCREENSIZE = (160,144)

PROJECTION_MATRIX_S = np.matrix([
    [1,0,0],
    [0,1,0],
    [0,0,0]
])

class GBScreen():
    gbPaletteData1 = [248,239,121,177,169,74,103,100,42,41,26,15]
    gbScreenSize = (160,144)

    def __init__(self,palette=gbPaletteData1):
        #palette setup
        self.palette = ImagePalette.ImagePalette(mode="RGB", palette=palette)
        if not self.isPaletteValid():
            raise ValueError("Incorrect Pallet given")
        #frame setup
        self.renderedFrames = []
        self.createNewFrame()

    def createNewFrame(self):
        if len(self.renderedFrames) > 0:
            self.renderedFrames.append(self.currentFrame)
        self.currentFrame = Image.new("P",self.gbScreenSize)

    def isPaletteValid(self):
        return len(self.palette.palette) == 12

def hex2RGB(value):
    mask = 0xFF
    b = value & mask
    mask = mask << 8
    g = (value & mask) >> 8
    mask = mask << 8
    r = (value & mask) >> 16
    return (r,g,b)

def getRotateZMatrix(angle):
    zMatrix = np.matrix([
        [cos(angle), -sin(angle), 0],
        [sin(angle), cos(angle), 0],
        [0, 0, 1]
    ]) 
    return zMatrix

def getRotateYMatrix(angle):
    yMatrix = np.matrix([
        [cos(angle), 0, sin(angle)],
        [0, 1,  0],
        [-sin(angle),0,cos(angle)]
    ])
    return yMatrix

def getRotateXMatrix(angle):
    xMatrix = np.matrix([
        [1, 0 , 0],
        [0, cos(angle),-sin(angle)],
        [0,sin(angle), cos(angle)]
    ])
    return xMatrix

def setupVertices():
    vertices = []
    vertices.append(np.matrix([-1,-1,1]))
    vertices.append(np.matrix([1,-1,1]))
    vertices.append(np.matrix([1,1,1]))
    vertices.append(np.matrix([-1,1,1]))
    vertices.append(np.matrix([-1,-1,-1]))
    vertices.append(np.matrix([1,-1,-1]))
    vertices.append(np.matrix([1,1,-1]))
    vertices.append(np.matrix([-1,1,-1]))

    # vertices.append([10,10,0])
    # vertices.append([30,10,0])
    # vertices.append([10,10,0])
    # vertices.append([30,30,0])
    return vertices

def setupEdges():
    pass


def drawPt(x,y,draw,color=3,radius=2):
    #draws a circle at point
    boundingBox = [x-radius,y-radius,x+radius,y+radius]
    draw.arc(boundingBox,0,360,color,radius)

def renderCubeSingle():
    scale = 25
    circlePos = [50,50]
    vertices = setupVertices()
    pal = ImagePalette.ImagePalette(mode="RGB",palette = GB_PALETTE1)
    im = Image.new("P", GB_SCREENSIZE)
    im.putpalette(pal)
    d = ImageDraw.Draw(im,"P")
    #render single frame
    for point in vertices:
        projectedPt = np.dot(PROJECTION_MATRIX_S,point.reshape((3,1)))
        x = int(projectedPt[0][0] * scale + circlePos[0])
        y  = int(projectedPt[1][0]* scale + circlePos[1])
        drawPt(x,y,d)
    im.show()

def renderRCube():
    runLength = 1000#how many frames to render
    scale = 15
    circlePos = [75,75]
    rAngle = 0
    rAngle2 = 0
    rAngle3 = 0
    vertices = setupVertices()
    pal = ImagePalette.ImagePalette(mode="RGB",palette = GB_PALETTE1)
    frames = []
    for i in range(runLength):
        rMatrixZ = getRotateZMatrix(rAngle)
        rMatrixY = getRotateYMatrix(rAngle2)
        rMatrixX = getRotateXMatrix(rAngle3)
        
        currentVertices = []
        im = Image.new("P", GB_SCREENSIZE)
        im.putpalette(pal)
        d = ImageDraw.Draw(im,"P")
        d.multiline_text((0,130),"3d go brrr", fill = 3)
        #render single frame
        for point in vertices:
            rotatedPt = np.dot(rMatrixX, point.reshape((3, 1)))
            rotatedPt = np.dot(rMatrixY, rotatedPt)
            rotatedPt = np.dot(rMatrixZ, rotatedPt)

            projectedPt = np.dot(PROJECTION_MATRIX_S, rotatedPt)
            x = int(projectedPt[0][0] * scale + circlePos[0])
            y  = int(projectedPt[1][0]* scale + circlePos[1])
            currentVertices.append((x, y))
            drawPt(x,y,d)
        for i in range(4):
            ct = currentVertices[i]
            nt = currentVertices[(i+1)%4]
            d.line([ct,nt],fill=2,width=1)
            ct = currentVertices[i+4]
            nt = currentVertices[((i+1)%4)+4]
            d.line([ct,nt],fill=2,width=1)
            ct = currentVertices[i]
            nt = currentVertices[i+4]
            d.line([ct,nt],fill=2,width=1)


        frames.append(im)
        rAngle += 0.2
        rAngle2 += 0.1
        rAngle3 += 0.1
    frames[0].save("rotTest.gif",save_all=True,format='GIF',append_images=frames[1:],duration=100,loop=1)
    #im.show()

def test():
    test = GBScreen()
    pal = ImagePalette.ImagePalette(mode="RGB",palette = GB_PALETTE1)
    im = Image.new("P", GB_SCREENSIZE)
    im.putpalette(pal)
    d = ImageDraw.Draw(im,"P")
    d.multiline_text((5,5),"haha you're\nmom gay", fill = 3)
    d.line([(5 ,10),(100,100)], fill=3, width=1)
    drawPt(100,100,d)
    #d.arc([20,20,40,40],0,360,2,10)

    # for i in range(GB_SCREENSIZE[0]):
    #     im.putpixel((i, 30),1)

    im.show()  

def main():
    #renderCubeSingle()
    renderRCube()
main()