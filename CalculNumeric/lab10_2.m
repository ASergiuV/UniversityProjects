clear;

A = [6 2 1 -1
	2 4 1 0
	1 1 4 -1
	-1 0 -1 3];

B = [8; 7; 5; 1];

[L, U] = doolittle(A);

% To solve A*x=B <=> L*U*x = B we must first substitute z = U*x
% therefore we have L * z = B <=> z = L^-1 * B (matrix multiplication
% is not commutative)
z = inv(L) * B;

% Now that we know U*x = z, we must solve x = U^-1 * z
x = inv(U) * z;

x