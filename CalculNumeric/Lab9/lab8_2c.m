clear;
A1 = [10 7 8 7
    7 5 6 5
    8 6 10 9
    7 5 9 10];

A2 = [10 7 8.1 7.2
    7.08 5.04 6 5
    8 5.98 9.89 9
    6.99 4.99 9 9.98];

B = [32; 23; 33; 31];

results1 = gaussys(A1, B);
results2 = gaussys(A2, B);

inErr = norm(A1 - A2) / norm(A1);
outErr = norm(results1 - results2) / norm(results1);
Err = outErr/inErr;

printResults1 = sprintf("%d, ", results1);
printResults2 = sprintf("%3.0f, ", results2);
cdnNr1 = cond(A1);
cdnNr2 = cond(A2);
fprintf("Results for firt matrix: %s (cond = %f)\nResults for second matrix: %s (cond = %f)\nInput relative error: %f\nOutput relative error: %f\nError: %f\n",...
    printResults1, cdnNr1,...
    printResults2, cdnNr2,...
    inErr, outErr, Err);