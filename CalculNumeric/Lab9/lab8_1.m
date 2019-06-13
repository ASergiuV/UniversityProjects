clear;
A = [400 -201
    -800 401];
B = [200; -200];

cdnNr = cond(A);
results = sprintf("%d, ", gaussys(A,B));
fprintf("First results are: %s; conditioning number is %f\n", results, cdnNr);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [400 -200
    -800 401];

cdnNr = cond(A);
results = sprintf("%4.2f, ", gaussys(A,B));
fprintf("Second results are: %s; conditioning number is %f\n", results, cdnNr);