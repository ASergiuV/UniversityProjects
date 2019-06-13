function results = gaussys(A, B)
    n = length(A);
    for i = 1 : n - 1
        % Find the index of largest pivot on column <i> (begining with row <i>)
        % a.k.a. partial pivot
        [~, pivot] = max(abs(A(i:end, i)));
        pivot = pivot + i - 1;
        
        % Swap row <i> with row <pivot> (both in matrix A and B)
        if(pivot ~= i)
            A = swapRows(A, i, pivot);
            B = swapRows(B, i, pivot);
        end
        
        % Compute <m>s for each row.
        m = A(i+1:end, i);
        m = m ./ A(i,i);
        
        % m is column vector
        % A(i, i:end) is row vector
        % m *  A(i,i:end) is a matrix of the same size as A(i:end, i:end)
        A(i+1:end, i:end) = A(i+1:end, i:end) - (m *  A(i,i:end));
        B(i+1:end, 1) = B(i+1:end, 1) - (m * B(i, 1));
    end
    
    results = zeros(1, n);
    % Start from bottom and compute each Xi
    for i = n : -1 : 1
        results(i) = (B(i) - (sum(A(i, i:end) .* results(i:end)))) / A(i,i);
    end
end

function A = swapRows(A, row1, row2)
    A([row2, row1], :) = A([row1, row2], :);
end