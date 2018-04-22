import pypi
from random import randint, random

from Individ import Individ


class Algorithm:

    def __init__(self, A, S):
        self.__A = A
        self.__S = S

    def compute(self, population, mutation_probability):
        i1 = randint(0, len(population) - 1)
        i2 = randint(0, len(population) - 1)

        if i1 != i2:
            new_individ = self.__crossover(population.get(i1), population.get(i2))
            new_individ = self.__mutate(new_individ, mutation_probability)

            f1 = self.fitness(population.get(i1))
            f2 = self.fitness(population.get(i2))
            f = self.fitness(new_individ)

            if f1 > f2 and f1 > f:
                population.set(i1, new_individ)

            if f2 > f1 and f2 > f:
                population.set(i2, new_individ)

        return population

    def fitness(self, individ):

        fitness_coef = 0

        for subset in self.__S:
            sum = 0
            for elem in subset:
                sum += individ.get_perm()[elem]
            fitness_coef += (sum == 0 or sum == len(subset))
        return fitness_coef

    def __crossover(self, individ1, individ2):
        x = randint(0, len(self.__A) - 1)
        y = randint(0, len(self.__A) - 1)
        if x > y:
            x, y = y, x

        new_perm = []

        perm1 = individ1.get_perm()
        perm2 = individ2.get_perm()

        for i in range(len(perm1)):
            if x <= i < y:
                new_perm.append(perm1[i])
            else:
                new_perm.append(perm2[i])

        return Individ(new_perm)

    def __mutate(self, new_individ, mutation_probability):
        if mutation_probability > random():
            index = randint(0, len(new_individ) - 1)
            value = randint(0, 10001) % 2
            new_individ.get_perm()[index] = value

        return new_individ
