function result = hermite(points, values, df, x)
    M = length(x);
    N = length(points) - 1;
    
    result = repmat(values(1), 1, M);
    table = divdiff(points, values, df);
    
    for i = 1 : M
        product = 1;
        for j = 1 : 2*N+1
            product = product .* (x(i) - table(j, 1));
            result(i) = result(i) + (product .* table(1, 2 + j));
        end
    end
end