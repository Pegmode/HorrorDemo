
#logo starts at 0x58
OUT_FILEPATH = "dripTable.bin"
INIT_Y = 0x58
GRAVITY = 0.07

MAXY = 160
    
def generateDrip():
    dripTable = []
    i = 0
    velocity = 0
    y = INIT_Y
    while y < MAXY:
        y += velocity
        dripTable.append(int(y))
        velocity += GRAVITY
    dripTable.append(0)#sentinel
    f = open(OUT_FILEPATH, "wb")
    f.write(bytearray(dripTable))
    f.close()
    print(dripTable)


generateDrip()

# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣤⣤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⢿⣿⣦⠈⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣶⣦⣍⠐⢼⣿⣿⣧⠈⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣷⣄⣿⣿⣿⣦⣴⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣄⣒⣚⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⡽⣿⠟⢃⣿⠟⡉⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠶⢯⣭⣿⢹⡟⢶⣗⠀⢸⠇⢁⣠⠫⠟⣹⣿⣯⡭⠶⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢙⣄⠣⠁⠈⠓⠊⠐⠃⠀⠀⣰⣿⣏⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢉⣽⠀⠀⠀⠀⠀⠀⠀⣿⣯⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⡀⠀⠀⠀⠀⠀⠀⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣷⡀⠀⠀⠀⠀⢠⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠘⢛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⣀⡀⠶⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣠⣀⣀⣿⡿⠃⢢⣠⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠿⣿⡿⣷⡿⠿⣿⢿⡿⠩⢹⣿⡟⠉⠉⠉⢹⣿⢻⠛⠛⠻⢿⣿⣷⣿⣿⠉⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⢶⣿⣦⣿⣷⡇⢁⠚⡇⠐⢀⣿⣷⣤⣤⣤⣿⣧⣀⣠⣇⡰⢀⡿⣿⣿⣷⣾⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣵⡎⠹⣿⣿⣿⣁⣾⢻⣿⢻⣟⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣾⣿⡿⠛⠛⢛⡟⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣞⣰⠞⣩⣿⣻⡇⢠⠃⠸⠉⠙⣿⣿⣿⣿⢈⡁⠤⠁⠌⢉⢙⣿⣐⣧⣤⣾⢇⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡿⢿⢋⡍⢇⠛⣿⣧⣼⣦⣴⣔⣠⣿⣿⣿⣯⣦⣤⣦⣤⣦⣄⣸⡻⢛⠋⠉⠻⠿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠀⣆⣷⣴⣶⠿⣿⡿⣿⢿⣿⣿⣿⣿⣿⢿⡿⢿⣿⢉⠉⣿⣿⣷⣾⣤⣭⡁⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⣾⣿⣿⣿⣿⠐⣉⣌⠇⠐⠁⡄⣿⣿⣿⠈⡠⢾⡇⠠⠠⣼⣽⡟⢣⠄⣹⣿⡖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣉⠁⣿⣷⣿⡟⢿⡵⣾⣶⣦⣿⣿⣿⣴⣷⣾⣷⠖⡴⠿⣿⣿⠷⠚⢛⡻⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣆⣿⣿⣿⣧⠐⡅⢘⠃⣿⣿⣿⣟⠿⡿⣿⣧⣈⠴⢃⠘⣻⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢻⣿⠃⢸⣿⣶⣿⡿⡟⢉⣿⢿⣻⣼⣧⠂⠛⢿⣷⣟⣀⣥⡼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣏⡙⣿⣾⣿⣿⠿⢄⠉⣸⡿⠁⠉⠉⠟⢬⢛⢚⠻⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣦⣅⣙⣿⣧⣮⣬⣽⡟⠀⠀⠀⠀⢶⣶⣮⢧⢠⠙⣰⢹⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⣈⣽⣶⣿⣿⣷⣼⠟⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢥⣏⢿⢯⣿⡟⠀⣿⣿⣿⣶⣄⣠⢈⠲⠟⣛⠏⣍⣏⠬⣄⡺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣾⣿⣃⣧⣿⣿⣿⣿⣿⣧⣒⣴⣦⣾⣶⣾⣶⣿⡇⠀⠀⠀