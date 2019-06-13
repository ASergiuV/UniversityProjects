r = 110;
p = 75;

n = 20;

a= 0;
b=2*pi;

k = 1:1:n-1;

h = (b-a)/n;

f = @(x) sqrt(1 - (p/r)^2 * sin(x));

xk = a + k*h;

rez = (b-a)/ (2*n) * (f(a)+f(b)+ 2 * sum(f(xk)));

rez2 = ((60*r)/(r^2-p^2))*rez