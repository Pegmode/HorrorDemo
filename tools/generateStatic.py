import random


#Consts
NUM_TILES = 16
TILE_DATA_SIZE = NUM_TILES * 8 * 2# Each tile has 8 rows and the bitplane is 2 bytes
FILENAME_TILE = "randTilesData.bin"

FILENAME_MAP = "randMapData.bin"
MAP_SIZE = 0x9BFF - 0x9800

def generateTileData():#generate NUM_TILES worth of random tile data
    tiles =  random.randbytes(TILE_DATA_SIZE)
    f = open(FILENAME_TILE, "wb")
    f.write(tiles)
    f.close()

def generateRandomMap():#generate an entire maps worth of random tile assignments in the range given by NUM_TILES
    mapDataList = []
    for i in range(MAP_SIZE + 1):
        mapDataList.append(random.randint(0, NUM_TILES - 1))
    mapDataBytes = bytearray(mapDataList)
    f = open(FILENAME_MAP, "wb")
    f.write(mapDataBytes)
    f.close()


generateTileData()
generateRandomMap()