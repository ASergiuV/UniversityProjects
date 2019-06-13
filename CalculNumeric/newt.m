function dsa = newt(x,y)
n = length(x);
m = zeros(n, n);

m(:, 1) = y;


for j = 2:n
    for i = 1:(n-j + 1)
        m(i, j) = (m(i + 1, j - 1) - m(i, j -1))/(x(i+j-1)-x(i));
    end
end
m
dsa = m;

end
