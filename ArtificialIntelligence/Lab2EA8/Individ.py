class Individ:
    def __init__(self, d): # binary array: d[i] = 1 means the ith element belongs to D1 else the ith element belongs to D2
        self.__d = d

    def get_perm(self):
        return self.__d

    def __len__(self):
        return len(self.__d)

    def __str__(self):
        return str(self.__d)