from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_COLORS1 = ((248,239,121),(177,169,74),(103,100,42),(41,26,15))#BGB yellow pallete, higher = darker
GB_SCREENSIZE = (160,144)
GB_MIDDLE_VIEWPORT = GB_SCREENSIZE[0]//2

PLANE_HEIGHT = 80#8*10

WIDTH = GB_SCREENSIZE[0] +  40
HEIGHT = GB_SCREENSIZE[1]

SHOW_DEBUG_GRAPHIC = True

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

def getCheckerboardColor(i, color2 = 3):
    #for a given drawIteration on a line, alternate in between 2 colors, 0 and color2
    num = i % 2
    val = num * color2
    return val

def generateWireframe():
    #Generate base wireframe image
    
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
    if SHOW_DEBUG_GRAPHIC:
        im.show()
        im.save("test.png")
    return checkerboardWidths, im

def generateCheckerBoard():
    #generate base checkerboard image
    checkerboardWidths = []
    im = Image.new("RGB", BG_SIZE, GB_COLORS1[2])
    currentRowDistance = 8# The distance in between checker segments for the current row
    startX = GB_SCREENSIZE[0]//2
    draw = ImageDraw.Draw(im)
    initLineIters = [0,1]
    lineIter = 0
    rowDistanceSkip = 3 #every n rows do not increase distance
    checkerboardIter = 0 #keep track of how tall we are in checkerboard,cant use modulo because the distance varies and iter ends up being a multiple sometimes
    

    for i in range(PLANEMIN, PLANEMAX):
        if checkerboardIter >= rowDistanceSkip:
            rowDistanceSkip += 1
            checkerboardIter = 0
            buffer = initLineIters[0]
            initLineIters[0] = initLineIters[1]
            initLineIters[1] = buffer

        lineIter = initLineIters[0]
        currentX = startX
        checkerboardWidths.append(currentRowDistance)#save for later use
        while currentX < BG_SIZE[0]:
            linePos = (currentX, i, currentX + currentRowDistance, i)
            lineColor = GB_COLORS1[getCheckerboardColor(lineIter)]
            draw.line(linePos, lineColor)
            currentX += currentRowDistance
            lineIter += 1
            
        currentX = startX
        lineIter = initLineIters[1]

        while currentX > 0:
            linePos = (currentX - currentRowDistance, i, currentX, i)
            lineColor = GB_COLORS1[getCheckerboardColor(lineIter)]
            draw.line(linePos, lineColor)
            currentX += -currentRowDistance  
            lineIter += 1
        
        if i % rowDistanceSkip != 0:
            currentRowDistance += 1
        checkerboardIter += 1
    if SHOW_DEBUG_GRAPHIC:
        im.show()
        im.save("test.png")
    return checkerboardWidths, im


def generateAnimation(checkerboardWidths, im):
    #generate   
    frames = []
    frameLen = 4
    maxMovement = 0
    offsets = [0] * (PLANEMAX - PLANEMIN)
    for i in range(frameLen):
        canvas = Image.new("RGB", GB_SCREENSIZE, GB_COLORS1[3])
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
    print(f"Maximum right window movement distance: {maxMovement}")


def swapColor(c1, c2, im):
    data = np.array(im)
    red, green, blue = data[:,:,0], data[:,:,1], data[:,:,2]
    mask = (red == c1[0]) & (green == c1[1]) & (blue == c1[2])
    data[:,:,:3][mask] = c2
    return Image.fromarray(data)

def palSwapAnimate(checkerboardWidths, im):
    #generate animation with palette swap extra frames for full animation
    frames = []
    frameLen = 4
    maxMovement = 0
    offsets = [0] * (PLANEMAX - PLANEMIN)
    backgroundColor = GB_COLORS1[2]#use 3d color for background so that background wont be affected by palette swap
    for i in range(frameLen):
        canvas = Image.new("RGB", GB_SCREENSIZE, backgroundColor)
        for j, y in enumerate(range(PLANEMIN,PLANEMAX)):
            pasteX = offsets[j]
            pasteX = math.ceil((checkerboardWidths[j] / frameLen) * i)
            paste_raster(im, canvas, y, pasteX)
            offsets[j] += j + 1
            if pasteX > maxMovement:
                maxMovement = pasteX
            
        frames.append(canvas)

    swapframes = []
    for originalFrame in frames:
        bufferColor = (0,0,0)
        swappedFrame = swapColor(GB_COLORS1[0],bufferColor, originalFrame)
        swappedFrame = swapColor(GB_COLORS1[3],GB_COLORS1[0], swappedFrame)
        swappedFrame = swapColor(bufferColor,GB_COLORS1[3], swappedFrame)
        swapframes.append(swappedFrame)

    frames.extend(swapframes)
    frames.extend(frames)
    #COLOR FOR TESTING BG
    outframes = []
    for frame in frames:
        swappedFrame = swapColor(backgroundColor,GB_COLORS1[3], frame)
        outframes.append(swappedFrame)
    frames = outframes

    frames = pasteRunner(frames)

    frames[0].save("test.gif",save_all=True, format = "GIF",append_images=frames[1:],duration=60,loop=0)
    print(f"Maximum right window movement distance: {maxMovement}")

def pasteRunner(frames):#only for testing visuals. no affect on final demo
    pos = (50,50)
    f1 = Image.open("f1.png")
    f2 = Image.open("f2.png")
    f3 = Image.open("f3.png")
    runner = [f1,f2,f3]
    output = []
    animFrameWait = 3
    for i, frame in enumerate(frames):
        runnerFrameIdx = (i // animFrameWait) % animFrameWait
        print(runnerFrameIdx)
        runnerFrame = runner[runnerFrameIdx]
        frame = frame.convert("RGBA")
        runnerFrame = runnerFrame.convert("RGBA")
        frame.paste(runnerFrame, pos, runnerFrame)
        output.append(frame)
    return output


def main():
    #checkerboardWidths, im = generateWireframe()
    checkerboardWidths, im = generateCheckerBoard()
    #generateAnimation(checkerboardWidths, im)
    palSwapAnimate(checkerboardWidths, im)



main()