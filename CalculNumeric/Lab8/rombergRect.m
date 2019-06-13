function result = rombergRect(f, a, b, err)
    x1 = (a+b) / 2;
    x2 = a + ((b-a) / 6);
    x3 = b - ((b-a) / 6);
    
    h = (b - a) / 3;
    h1 = (b - a) / 6;
    
    D0 = (b-a) * f(x1);
    D1 = 1/3 * D0 + (b - a) / 3 * (f(x2) + f(x3));
    k = 2;
    while abs(D1 - D0) > err
        D0 = D1;
        
        h = h/3;
        h1 = h1/3;
        h2 = 4*h1;
        h3 = 2*h1;
        
        m = 3^(k-1);
        x = computeXs(a,m,h1,h2,h3);
        D1 = D0/3 + h * sum(f(x));
        
        k = k + 1;
    end
    result = D1;
end

function x = computeXs(a, m, h1, h2, h3)
    x = zeros(1, 2*m);
    x(1) = a + h1;
    for i = 1 : m-1
        x(2*i) = x(2*i-1) + h2;
        x(2*i+1) = x(2*i) + h3;
    end
    x(2*m) = x(2*m-1) + h2;
end