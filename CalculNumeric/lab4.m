% n = 5;
% x = [1 1.5 2 3 4];
% a = [0 0.17609 0.30103 0.47712 0.60206];
% 
% f = @(x) log10(x);
% 
% i = 10 : 35;
% yi = arrayfun(@(x)(x/10), i);
% errors = arrayfun(@(k) abs(f(k) - newtonInter(x, a, k) ), yi);
% fprintf("E = %f\n", max(errors));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x = [1 2 3 4 5];
% y = [22 23 25 30 28];
% 
% plot(x, y, 'r+');
% hold on;
% points = linspace(1, 6, 100);
% points2 = zeros(1, length(points));
% 
% for i = 1:length(points)
%     points2(i) = newtonInter(x, y, points(i));
% end
% plot(points, points2, 'b');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = @(x) exp(sin(x));
points = linspace(0, 6, 13);
pointsF = linspace(0, 6, 100);

points2 = zeros(1, length(points));

for i = 1:length(points)
    points2(i) = newtonInter(points, f(points), points(i));
end

plot(pointsF, f(pointsF), 'r');
hold on;
plot(points, f(points), 'b+');
hold on;
plot(points, points2, 'g+');
