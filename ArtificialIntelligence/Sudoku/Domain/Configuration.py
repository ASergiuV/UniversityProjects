import math
import copy
class Configuration:
    def __init__(self, board):
        self.__size=len(board)
        self.__board=board[:]

    def getSize(self):
        return self.__size

    def getValues(self):
        return self.__board[:]

    def rowValidation(self,row,number):
        for i in range(0,self.__size):
            if self.__board[row][i] == number:
                return False
        return True

    def boxValidation(self,row,col,number):
        size = int(math.sqrt(self.__size))
        col_start = int(col - col % size)
        row_start = int(row - row % size)
        for i in range(size):
            for j in range(size):
                if (self.__board[i + row_start][j + col_start] == number):
                    return False
        return True

    def columnValidation(self,col,number):
        for i in range(0,self.__size):
            if self.__board[i][col]==number:
                return False
        return True

    def validator(self,row,col,number):
        return self.rowValidation(row,number) and self.columnValidation(col,number) and self.boxValidation(row,col,number)

    def nextConfig(self,i,j):
        nextC = []
        for num in range(1,self.__size+1):
            if self.validator(i,j,num):
                aux=copy.deepcopy(self.__board)
                aux[i][j]=num
                nextC.append(Configuration(aux))
        return nextC

    def isDone(self):
        for i in range(self.__size):
            for j in range(self.__size):
                if self.__board[i][j]==0:
                    return False
        return True

    def __str__(self):
        return str(self.__board)