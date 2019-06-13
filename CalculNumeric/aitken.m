function result = aitken(points, values, precission, x)
    M = length(points);
    
    %sort the arrays <points> and <values>
    [~, sortIdx] = sort(points - x);
    points = points(sortIdx);
    values = values(sortIdx);
    
    table = zeros(M, M);
    table(:, 1) = values;
    %compute f(1,1) separately for the algorithm to work. No do-while :(
    table(2, 2) = aitkenCompute(x, points(2), points(1), table(2, 1), table(1, 1));
    
    i = 2;
    noSolution = false;
    while abs( table(i, i) - table(i-1, i-1) ) > precission
        % if we reached row M + 1 and still haven't obtained the desired
        % precission, we have to stop prematurely
        if i == M
            noSolution = true;
            break;
        end
        
        % if we haven't obtained the desired precission yet,
        % we have to compute the next row, so increment <i>
        i = i + 1;
        
        % before we can obtain f(i,i), we have to obtain all the f(i,j)
        % on the same row first
        for j = 1 : i - 1
            table(i, j + 1) = aitkenCompute( x, points(i), points(j), table(i, j), table(j, j) );
        end
    end
    
    if noSolution
        fprintf("Too few points for desired precission\n");
    end
    
    % final result is f(i,i)
    result = table( i , i );
end