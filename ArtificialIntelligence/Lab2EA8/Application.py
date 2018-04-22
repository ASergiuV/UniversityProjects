import pypi
from copy import deepcopy
from random import randint
from Algorithm import Algorithm
from Individ import Individ
from Population import Population
from Utils import get_population

import matplotlib.pyplot as plot
from numpy import mean

if __name__ == '__main__':
    no_of_iterations = int(input("No. of iterations = "))
    mutation_probability = float(input("mutation probability = "))

    A = [1, 2, 3, 4, 5, 6]
    S = [
        [0, 1],
        [2, 3],
        [4, 5]
    ]
    S2 = [ [0, 1, 2], [3, 4, 5]]

    population = Population(get_population(6))

    algorithm = Algorithm(A, S)
    ft = []
    print("Population:")
    for i in range(no_of_iterations):
        population = algorithm.compute(population, mutation_probability)
        el = max(population.getAll(),key=lambda x: algorithm.fitness(x))
        ft.append(algorithm.fitness(el))
        print("Fitness = " + str(algorithm.fitness(el)))
        print("Elem = " + str(el))
    print("\n")


    population.get_population().sort(key=lambda x: algorithm.fitness(x))

    fitness_optim, individual_optim = algorithm.fitness(population.get(0)), population.get(0)

    print("Optimum fitness = " + str(fitness_optim))
    print("Optimum Individual = " + str(individual_optim))




    plot.plot(ft)
    plot.ylabel("Fitness")
    plot.xlabel("Iteration")
    plot.axis([0, 1000, 0, 1])
    plot.show()

    m = mean(ft)
    s = 0

    for i in ft:
        s += (i - m) ** 2

    std = s / len(ft)

    print("Mean: ", m, ' Standard deviation: ', std)

    
