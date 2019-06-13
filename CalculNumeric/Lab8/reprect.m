function result = reprect(f, a, b, n)
    x1 = a + (b-a)/(2*n);
    pas = (b-a)/n;
    xn = x1 + (n-1) * (b-a)/n;
    
    x = x1 : pas : xn;
    
    result = (b-a)/n * sum(f(x));
end