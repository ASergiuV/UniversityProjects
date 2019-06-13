x = linspace(0,10,21);
f = @(x) (1+cos(pi * x))./(1+x);
point = linspace(0,10,100);
y = zeros(1,length(point));

m=length(point);
for i = 1:m
    y(i) = l(x,f(x),point(i));
end

hold on;
legend();
plot(point, f(point),'Xr')
plot(point,y)
