from Repository.State import *
class Problem:

    def __init__(self, initial):
        self.__initialConfig = initial
        self.__initialState = State()
        self.__initialState.setValues([self.__initialConfig])

    def getNextEmpty(self, currentState):
        currentConfig = currentState.getValues()[-1]
        for i in range(currentConfig.getSize()):
            for j in range(currentConfig.getSize()):
                if currentConfig.getValues()[i][j]==0:
                    return i,j

    def expand(self, currentState):
        myList = []
        currentConfig = currentState.getValues()[-1]
        i,j=self.getNextEmpty(currentState)
        for x in currentConfig.nextConfig(i,j):
             myList.append(currentState + x)

        return myList

    def getRoot(self):
        return self.__initialState

    def expandWithHeuristics(self, currentState):
        myList = []
        currentConfig = currentState.getValues()[-1]
        i,j=self.getNextEmpty(currentState)
    def heuristics(self, state, finalC):
        l = finalC.getSize()
        count = 2 * l
        for i in range(l):
            if state.getValues()[-1].getValues()[i] != finalC.getValues()[i]:
                count = count - 1
        return count
