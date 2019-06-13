function table = divdiff(points, values, df)
% table = divdiff(X, Y)
%
% Input:
%	X = [ x0 x1 .. xn ] - object vector
%	Y = [ y0 y1 .. yn ] - image vector
%
% Output:
%   table - table of divided differences
    
    N = length(points);
    table = zeros(2*N, 2*N + 1);
    table(:, 1) = repelem(points, 2);
    table(:, 2) = repelem(values, 2);
    
    for i = 1 : 2 : 2*N
        table(i, 3) = df((i + 1)/2);
    end
    
    for i = 2 : 2 : 2*N - 1
        table(i, 3) = (table(i+1 , 2) - table(i, 2)) / (table(i+1, 1) - table(i, 1));
    end
    
    for j = 4 : 2 * N + 1
        for i = 1 : 2 * N - j + 2
            table(i, j) = (table(i+1 , j-1) - table(i, j-1)) / (table(i+j-2, 1) - table(i, 1));
        end
    end
end