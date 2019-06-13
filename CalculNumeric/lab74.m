n = 10;

a= 1;
b=2;

k = 1:1:n-1;

h = (b-a)/n;

f = @(x) x.*log(x);

xk = a + k*h;

rez = (b-a)/ (2*n) * (f(a)+f(b)+ 2 * sum(f(xk)));

rez2 = rez
% pt n>= 10 avem precizia atinsa