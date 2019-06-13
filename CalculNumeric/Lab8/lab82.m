clear;
f = @(x) 2 ./ (1 + x.^2);

[romb2, step] = romberg(f, 0, 1, .0001);
romb5 = rombergAitk(f, 0, 1, .0001);
real_res = integral(f, 0, 1);

fprintf("Correct result: %f\nThe approximation using iterative romberg is %f (error = %f) found at step %d\nThe approximation using Aitken Romberg formula is %f (error = %f)\n",...
    real_res,...
    romb2, real_res-romb2, step,...
    romb5, real_res-romb5);