from UI.UI import *
from Domain.Configuration import *
"""
	Abrudean
"""

def main():
    ui = UI()
    ui.run()


def readFile():
    with open("board") as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    content = [x.replace(' ','') for x in content]
    n = int(content[0])
    matrix = [[0] * n for i in range(n)]
    content.pop(0)
    for x in content:
        matrix[int(x[0])][int(x[1])]=int(x[2])
    return matrix

main()