clear;
clc;

f = @(x) exp(-x.^2);
res = rect(f, 1, 1.5);
realres = integral(f, 1, 1.5);
fprintf("Correct result is %f\nIntegral result is: %f [error = %f (%.2f%% missing)]\n", realres, res, realres - res, (realres-res)*100);

x = linspace(1, 1.5, 100);
y = f(x);

fplot(f, 'k');
hold on
plot(x,y, '.r');
area([1, 1.5],[f(1.25), f(1.25)]);
% area(x,y, 'FaceColor', [1,0,0]);
% area([1, 1.25],[f(1.25), f(1.25)], 'FaceColor', [0,1,0]);
% area([1.25, 1.5],[f(1.5), f(1.5)], 'FaceColor', [0,0,1]);
% plot([1, 1, 1.25, 1.25, 1], [0, f(1), f(1.25), 0, 0], 'r');
% plot([1.25, 1.25, 1.5, 1.5, 1.25], [0, f(1.25), f(1.5), 0, 0], 'b');
% plot([1, 1, 1.5, 1.5, 1], [0, f(1), f(1.5), 0, 0], 'g');
hold off