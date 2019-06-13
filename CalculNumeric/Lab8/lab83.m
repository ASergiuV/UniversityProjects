clear;
clf;

f = @(x) 100 ./ (x .^ 2) .* sin(10 ./ x);

x = linspace(1,3, 200);
y = f(x);

fplot(f, [1,3], 'k');
hold on
area(x,y);
hold off

adaptive_result = adquad(f, 1, 3, .0001);
simpson50_result = repsimpson(f, 1, 3, 50);
simpson100_result = repsimpson(f, 1, 3, 100);
real_result = integral(f, 1, 3);

fprintf("Real result is: %f\nAdaptive quadrature result is: %f (error = %f)\nSimpson's formula for n = 50 is: %f (error = %f)\nSimpson's formula for n = 100 is: %f (error = %f)\n",...
    real_result,...
    adaptive_result, real_result - adaptive_result,...
    simpson50_result, real_result - simpson50_result,...
    simpson100_result, real_result - simpson100_result);