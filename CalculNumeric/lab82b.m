a=0;
b=1;
n = 20
epislon=10^(-4);
a=retmat();

for i=1:n
   RepeatedTrap(a,b,i);
end

function RepeatedTrap = RepeatedTrap(a,b,n)
    f=@(x) 2./(1+x.^2);
    k = 1:1:n-1;
    h = (b-a)/n;
    xk = a + k*h;

    RepeatedTrap = (b-a)/ (2*n) * (f(a)+f(b)+ 2 * sum(f(xk)));
end
