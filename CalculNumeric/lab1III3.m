x=linspace(0,2*pi,100);
f1=@(x) cos(x);
f2=@(x) sin(x);
f3=@(x) cos(2*x);

hold on
plot(x,f1(x));
plot(x,f2(x));
plot(x,f3(x));
hold off