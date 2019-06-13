function result = trapezium(f, a, b, n)
    h = (b - a) / n;
    
    x = a + h : h : a + (n-1) * h;
    result = (h/2) * (f(a) + f(b) + 2 * sum(f(x)));
end