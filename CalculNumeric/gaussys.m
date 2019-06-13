function results = gaussys(A, B)
    [sizeY, sizeX] = size(B);
    if sizeY == 1 && sizeX > 1
        B = rot90(B, -1);
    end

    n = length(A);
    for i = 1 : n - 1
        [~, pivot] = max(abs(A(i:end, i)));
        pivot = pivot + i - 1;
        
        if(pivot ~= i)
            A = swapRows(A, i, pivot);
            B = swapRows(B, i, pivot);
        end
        
        m = A(i+1:end, i);
        m = m ./ A(i,i);
        
        A(i+1:end, i:end) = A(i+1:end, i:end) - (m *  A(i,i:end));
        B(i+1:end, 1) = B(i+1:end, 1) - (m * B(i, 1));
    end
    
    results = zeros(1, n);
    for i = n : -1 : 1
        results(i) = (B(i) - (sum(A(i, i:end) .* results(i:end)))) / A(i,i);
    end
end

function A = swapRows(A, row1, row2)
    A([row2, row1], :) = A([row1, row2], :);
end