clear;

f = @(x) exp(-x.^2);

real_result = integral(f, 1, 1.5);
romberg_res = rombergRect(f, 1, 1.5, .0001);

fprintf("Correct result is: %f\nUsing Romberg algorithm for rectangle formula we obtain %f (error = %f)\n",...
    real_result,...
    romberg_res, real_result - romberg_res);