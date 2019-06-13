A = [10 7 8 7
    7 5 6 5
    8 6 10 9
    7 5 9 10];

B1 = [32; 23; 33; 31];

results1 = gaussys(A,B1);
printResults = sprintf("%d, ", results1);
cdnNr = cond(A);
fprintf("Results of the system are: %s\nThe conditioning number is: %f\n\n", printResults, cdnNr);

B2 = [32.1; 22.9; 33.1; 30.9];
results2 = gaussys(A,B2);
printResults = sprintf("%2.2f, ", results2);
fprintf("Results of the second system are: %s\n\n", printResults);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inErr = norm(B1-B2) / norm(B1);
outErr = norm(results1 - results2) / norm(results1);
Err = outErr / inErr;

fprintf("Input relative error: %f\nOutput relative error: %f\nError: %f\n",...
    inErr, outErr, Err);