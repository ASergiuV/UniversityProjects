points = 10 : 20 : 200;
values = arrayfun(@sqrt, points);

fprintf("Approximation is: %f\n", aitken(points, values, .001, 115));