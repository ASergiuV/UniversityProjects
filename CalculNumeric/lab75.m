a=0;
b=pi;
f = @(x) 1./(4+sin(20*x));
n = 10; %30 e corect

k = 1:1:n;
k2 = 1:1:n-1;

h = (b-a)/n;

xk = a + k*h;
xk2 = a + k2*h;
xkminus1 = a + (k-1)*h;

rez = ((b-a)./(6*n)) * (f(a)+f(b)+ 4 .* sum(f((xkminus1+xk)./2))+ 2 .* sum(f(xk2)));

rez2 = rez