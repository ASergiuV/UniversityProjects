r1 = pi / 2;
a = 0;
b = 1;
f = @(x) 2 / (1 + x^2);
rez = (b - a ) / 2 * ( f(a) + f(b));
rez
rez2 = (b - a ) / 6 * ( f(a) + f(b) + 4 * f((a+b)/2));
rez2

hold on;
range = 0:0.01:1;
functie = 2 ./ (1 + range.^2);
plot(range,functie, 'r');

x = [0 0 1 1];
y = [0 f(0) f(1) 0];

plot(x,y);
