#generate a Carpet texture
#By Pegmode
from PIL import Image, ImageDraw, ImagePalette, ImageFont, ImageColor
import numpy as np
import math

OUTPATH = "online_carpet.jpg"
RESOLUTION = (128,64)#don't go higher than 64 for 
CHECKER_HEIGHT = 3#how many pixels deep is every tile on the image?
VERT_DIVISION_FACTOR = 3#how many vertial lines are there between the middle and the ends
#colors
C_BLACK = 0
C_WHITE = 0xFFFFFF

if RESOLUTION[0] < 2 * RESOLUTION[1]:
    raise Exception("Bad height to width ratio. Width must be at most double the height")

def generate_wireframe():
    im = Image.new("RGB", RESOLUTION)
    draw = ImageDraw.Draw(im, "RGB")
    #midline
    linePts = [(im.width//2, 0) ,(im.width//2, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    #side lines
    linePts = [(im.height, 0) ,(0, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    linePts = [(im.width-im.height, 0) ,(im.width, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    #verticals
    vert_bottom_spacing = (im.width//2)//(VERT_DIVISION_FACTOR+1)
    vert_top_spacing = ((im.width//2) - im.height)//(VERT_DIVISION_FACTOR+1)
    #Left verticals
    vert_x_top = vert_top_spacing + im.height
    vert_x_bottom = vert_bottom_spacing
    for i in range(VERT_DIVISION_FACTOR):
        linePts = [(vert_x_top, 0),( vert_x_bottom, im.height-1)] 
        draw.line(linePts, fill=C_WHITE, width=1)
        vert_x_top += vert_top_spacing
        vert_x_bottom += vert_bottom_spacing
    #right verticals
    vert_x_top = (im.width//2) + vert_top_spacing
    vert_x_bottom = (im.width//2) + vert_bottom_spacing
    for i in range(VERT_DIVISION_FACTOR):
        linePts = [(vert_x_top, 0),( vert_x_bottom, im.height-1)] 
        draw.line(linePts, fill=C_WHITE, width=1)
        vert_x_top += vert_top_spacing
        vert_x_bottom += vert_bottom_spacing
    #horizontal
    y = im.height - VERT_DIVISION_FACTOR #start y pos, starts at bottom(high #)
    x = VERT_DIVISION_FACTOR
    while y >= 0:
        linePts = [(x, y) , (im.width-x, y)]
        draw.line(linePts, fill=C_WHITE, width=1)
        y += -VERT_DIVISION_FACTOR
        x += VERT_DIVISION_FACTOR

def main():
    im = Image.new("RGB", RESOLUTION)
    draw = ImageDraw.Draw(im, "RGB")
    #midline
    linePts = [(im.width//2, 0) ,(im.width//2, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    #side lines
    linePts = [(im.height, 0) ,(0, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    linePts = [(im.width-im.height, 0) ,(im.width, im.height-1)]
    draw.line(linePts, fill=C_WHITE, width=1)
    #verticals
    vert_bottom_spacing = (im.width//2)//(VERT_DIVISION_FACTOR+1)
    vert_top_spacing = ((im.width//2) - im.height)//(VERT_DIVISION_FACTOR+1)
    #Left verticals
    vert_x_top = vert_top_spacing + im.height
    vert_x_bottom = vert_bottom_spacing
    for i in range(VERT_DIVISION_FACTOR):
        linePts = [(vert_x_top, 0),( vert_x_bottom, im.height-1)] 
        draw.line(linePts, fill=C_WHITE, width=1)
        vert_x_top += vert_top_spacing
        vert_x_bottom += vert_bottom_spacing
    #right verticals
    vert_x_top = (im.width//2) + vert_top_spacing
    vert_x_bottom = (im.width//2) + vert_bottom_spacing
    for i in range(VERT_DIVISION_FACTOR):
        linePts = [(vert_x_top, 0),( vert_x_bottom, im.height-1)] 
        draw.line(linePts, fill=C_WHITE, width=1)
        vert_x_top += vert_top_spacing
        vert_x_bottom += vert_bottom_spacing
    #horizontal
    y = im.height - VERT_DIVISION_FACTOR #start y pos, starts at bottom(high #)
    x = VERT_DIVISION_FACTOR
    while y >= 0:
        linePts = [(x, y) , (im.width-x, y)]
        draw.line(linePts, fill=C_WHITE, width=1)
        y += -VERT_DIVISION_FACTOR
        x += VERT_DIVISION_FACTOR


    # y = im.height - VERT_DIVISION_FACTOR #start y pos, starts at bottom(high #)
    # x = VERT_DIVISION_FACTOR
    # checker_width = (im.width//2)//(VERT_DIVISION_FACTOR+1)
    # print(f"X: {y}\nY: {x}")
    # while y>=0:
    #     linePts[(x, y),(x+checker_width, y)]
    #     y += - 2 * VERT_DIVISION_FACTOR
    #     x += VERT_DIVISION_FACTOR
    #     checker_width

    im.show()
    im.save("test.png")

main()