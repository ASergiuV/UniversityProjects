class Controller:

    def __init__(self, problem):
        self.__problem = problem


    def BFS(self, root):

        q = [root]
        while len(q) > 0:
            currentState = q.pop(0)

            if currentState.getValues()[-1].isDone():
                return currentState.getValues()[-1]

            q = q + self.__problem.expand(currentState)

    def BestFS(self, root):

        q = [root]
        while len(q) > 0:
            currentState = q.pop(0)

            if currentState.getValues()[-1].isDone():
                return currentState.getValues()[-1]

            q = q + self.__problem.expand(currentState)