clear;

points = [1, 1.5, 2, 3, 4];
values = [0, 0.17609, 0.30103, 0.47712, 0.60206];

desired_points = newtonInter(points, values, [2.5, 3.25]);
fprintf('log(2.5) = %f\nlog(3.25) = %f\n', desired_points(1), desired_points(2));

%%%%%%%%%%%%

f = @(x) log10(x);

i = 10 : 35;
yi = arrayfun(@(x)(x/10), i);
errors = arrayfun(...
    @(x) abs( f(x) - newtonInter(points, values, x) ),...
    yi);

% The above is equivalent to:
%
% errors = zeros(1, length(i));
% for j = 1 : length(i)
%     error(j) = f(yi(j)) - newtonInter(points, values, yi(j));
% end

maxError = max(errors);
fprintf('Maximum error is %f\n', maxError);