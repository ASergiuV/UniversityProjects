clear;
clf;

points = [1, 2, 3, 4, 5];
values = [22, 23, 25, 30, 28];

desired_point = newtonInter(points, values, 2.5);

fprintf('Result %f\n', desired_point);

%%%%%%

x = linspace(0, 5, 100);
y = newtonInter(points, values, x);

plot(x,y,'.r');
hold on
plot(points, values, '*b');
legend('Newton Interpolation', 'Given points');
hold off