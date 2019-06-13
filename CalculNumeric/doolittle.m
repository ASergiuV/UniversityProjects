function [L, U] = doolittle(A)
%   Function doolittle assumes M is a square matrix where a_kk != 0
%   The aim is to factorize the given matrix into 2 other matrices L and U
%   with the property that L is upwards triangular and U is downwards
    
    [~, n] = size(A);
    % M - array of matrices
    M = zeros(n, n, n-1);
    %obtain all M_k
    for k = 1 : n-1
        t = zeros(n, 1);
        t(k+1:end) = A(k+1:end, k);
        M(:,:,k) = eye(n) - t * unitVector(n, k);
    end
    
    %multiply all M_k
    U = M(:,:,1);
    for i = 2 : n-1
        U = U * M(:,:,i);
    end
    
    %L = U^-1
    L = inv(U);
    
    %U = M1*M2*...*Mn * A
    U = U * A;
end

function result = unitVector(size, k)
    result = zeros(1, size);
    result(k) = 1;
end