from PIL import Image, ImageDraw, ImagePalette, ImageFont

GB_PALETTE1 = [248,239,121,177,169,74,103,100,42,41,26,15]
GB_SCREENSIZE = (160,144)

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


