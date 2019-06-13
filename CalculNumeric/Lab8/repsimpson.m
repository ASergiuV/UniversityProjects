function result = repsimpson(f, a, b, n)
    h = (b-a) / n;
    x = a:h:b;
    xp = x(2:end-1);
    xc = x(2:end);
    xc2 = (x(1:end-1)+xc) / 2;


    result = (b-a) / (6*n) *...
      (f(a) + f(b)+...
      4 * sum(f(xc2)) +...
      2 * sum(f(xp)));
end