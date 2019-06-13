function [result, step] = rombergAitk(f, a, b, err)
    table = zeros(20);
    table(1, 1) = trapezium(f, a, b, 1);
    table(2, 1) = trapezium(f, a, b, 2);
    table(2, 2) = (1/4 * table(1,1) - table(2, 1)) / (1/4 - 1);
    
    i = 2;
    while abs(table(i,i) - table(i-1,i-1)) > err
        i = i + 1;
        
        table(i, 1) = trapezium(f, a, b, i);
        pow4 = 1/16; % compute the power iteratively (start with 4^-2)
        for j = 2 : i
            numerator = pow4 * table(i-1,j-1) - table(i, j-1);
            denominator = pow4 - 1;
            table(i, j) = numerator / denominator;
            
            pow4 = pow4 / 4;
        end
    end
    result = table(i, i);
    step = i;
end