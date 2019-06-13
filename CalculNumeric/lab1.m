x=linspace(0,1,100);
f=@(x) exp(10.*x.*(x-1)).*sin(12.*pi.*x);
plot(x,f(x));