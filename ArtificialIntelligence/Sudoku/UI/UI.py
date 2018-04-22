from Domain.Problem import *
from Controller.Controller import *
from time import time
class UI:

    def __init__(self):
        self.__iniC = Configuration(self.readFile())
        self.__p = Problem(self.__iniC)
        self.__contr = Controller(self.__p)

    def readFile(self):
        with open("board") as f:
            content = f.readlines()
        content = [x.strip() for x in content]
        content = [x.replace(' ', '') for x in content]
        n = int(content[0])
        matrix = [[0] * n for i in range(n)]
        content.pop(0)
        for x in content:
            matrix[int(x[0])][int(x[1])] = int(x[2])
        for x in matrix:
            print(x)
        return matrix

    def printMainMenu(self):
        s = ''
        s += "0 - exit \n"
        s += "2 - find a path with BFS \n"
        s += "3 - find a path with BestFS\n"
        print(s)


    def findPathBFS(self):
        startClock = time()
        matrix = self.__contr.BFS(self.__p.getRoot())
        for row in matrix.getValues():
            print(row)
        print('execution time = ', time() - startClock, " seconds")

    def findPathBestFS(self):
        startClock = time()
        print(str(self.__contr.BestFS(self.__p.getRoot())))
        print('execution time = ', time() - startClock, " seconds")

    def run(self):
        runM = True
        self.printMainMenu()
        while runM:
            try:
                command = int(input(">>"))
                if command == 0:
                    runM = False
                elif command == 1:
                    pass
                elif command == 2:
                    self.findPathBFS()
                elif command == 3:

                    self.findPathBestFS()
            except:
                print('invalid command')
