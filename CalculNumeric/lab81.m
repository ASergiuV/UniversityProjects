a= 1;
b=1.5;

f = @(x) exp(-x.^2);

rez = (b-a) * f((a+b)/2)

hold on;
range = 1:0.01:1.5;
functie = exp(-range.^2);
plot(range,functie, 'r');

x = [a a b b];
y = [0 f((a+b)/2) f((a+b)/2) 0];

plot(x,y);


n=500;%500
% repeated rectangle form

x1 = a+(b-a)/(2*n);
x = @(i) x1+(i-1)*((b-a)/n);
i = 2:1:n;

rez2 = ((b-a)/n)*(f(x1)+sum(f(x(i))))
