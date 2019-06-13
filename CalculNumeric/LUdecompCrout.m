function [L, U] = LUdecompCrout(A)
% The function decomposes the matrix A into a lower triangular matrix L 
% and an upper triangular matrix U, using Crout's method such that A=LU.
% Input variables:
% A  The matrix of coefficients.
% Output variable:
% L  Lower triangular matrix.
% U  Upper triangular matrix.

[R, C] = size(A);
for i = 1:R
    L(i,1) = A(i,1);
    U(i,i) = 1;
end
for j = 2:C
    U(1,j)= A(1,j)/L(1,1);
end
for i = 2:R
    for j = 2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
    for j = i+1:C
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end