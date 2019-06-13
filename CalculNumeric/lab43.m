f = @(x) exp(sin(x));

points = linspace(0, 6, 13);
values = arrayfun(f, points);

x = linspace(0, 6, 500);
y = newtonInter(points, values, x);

fplot(f, 'k');
hold on
plot(points, values, '*b');
plot(x, y, '.r');
legend('$e^{sin(x)}$', 'Given points', 'Newton interpolation', 'Interpreter','latex');
hold off