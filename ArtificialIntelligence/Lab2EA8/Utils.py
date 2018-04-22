from copy import deepcopy
from random import randint

from Individ import Individ

def get_population(n):
    individs = []

    for k in range(20):
        perm = []
        for t in range(n):
            perm.append(randint(0, 10001) % 2)
        individs.append(Individ(perm))

    return individs