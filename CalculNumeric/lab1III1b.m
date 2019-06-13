x=linspace(0,1,100);
f=@(x) 3*exp(5.*x.^2-1).*cos(12.*pi.*x);
plot(x,f(x));