clear;

f = @(x) exp(-x.^2);
rep150 = reprect(f, 1, 1.5, 150);
rep500 = reprect(f, 1, 1.5, 500);
realres = integral(f, 1, 1.5);

fprintf("Using repeated rectangle formula:\nfor n=150 the result is %f\nfor n=500 the result is %f\ncorrect result is %f\n",...
    rep150, rep500, realres);