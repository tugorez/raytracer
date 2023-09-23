import numpy as np
import matplotlib.pyplot as plt

def read_file():
    raw = None
    with open("./image.txt", "r") as f:
        raw = f.read()
    return raw

if __name__ == '__main__':
    image = []
    file = read_file()
    lines = [l for l in file.split('\n') if l != '']
    for line in lines:
        row = []
        colors = [c for c in line.split(',') if c != '']
        for color in colors:
            numbers = [int(n) for n in color.split(';') if n != '']
            row.append(numbers)
        image.append(row)
    image = np.array(image)
    plt.imshow(image.astype("uint8"), vmin = 0, vmax = 255, interpolation = 'None')
    plt.show()
