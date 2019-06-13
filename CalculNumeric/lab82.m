a=0;
b=1;
f=@(x) 2./(1+x.^2);
epislon=10^(-4);

h=b-a;
qt0 = (h/2)*(f(a)+f(b));
qt1 = (h/4)*(f(a)+2*f(a+h/2)+f(b));
i=2;
j=1:1:(2^(i-1));
lastQ = qt1;
currentQ = (1/2)*lastQ+(h/(2^i))*sum(f(a+((2.*j-1)./(2^i))*h));
while (abs(currentQ-lastQ)>epislon)
    abs(currentQ-lastQ)
    i=i+1
    j=1:1:(2^(i-1));
    lastQ=currentQ;
    currentQ = (1/2)*lastQ+(h/(2^i))*sum(f(a+((2.*j-1)./(2^i))*h));
end
abs(currentQ-lastQ)
currentQ
lastQ



