clear;
A = [6 2 1 -1;
2 4 1 0;
1 1 4 -1;
-1 0 -1 3 ];
b = [8;7;5;1];
L = zeros(size(A));
[L,U] = LUdecompCrout(A);

[lines,~]=size(L);
z = zeros(1, lines);
    for i = 1 : lines
        z(i) = (b(i) - (sum(L(i, 1:i) .* z(1:i)))) / L(i,i);
    end

[lines,~]=size(U);
x = zeros(1, lines);
    for i = lines : -1 : 1
        x(i) = (z(i) - (sum(U(i, i:end) .* x(i:end)))) / U(i,i);
    end
x
A * x'