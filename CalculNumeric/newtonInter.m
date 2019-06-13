function result = newtonInter(points, values, x)
    M = length(x); %all the points for which we have to compute
    N = length(points) - 1; %the degree of the polynomial
    
    result = repmat(values(1), 1, M); %initialize array of results with f(x0)
    table = divdiff(points, values); %compute divided differences
    
    for i = 1 : M
        product = 1;
        for j = 1 : N
            product = product .* (x(i) - points(j));
            result(i) = result(i) + (product .* table(1, 2 + j));
        end
    end
end