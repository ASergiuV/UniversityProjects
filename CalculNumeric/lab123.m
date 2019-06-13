f = @(x) (x - 2) ^ 2 - log(x);

bisect(f, 1, 2, 0.0001);

function ret = bisect(f, a, b, error)
  if f(a) * f(b) > 0 
    return
  end
  
  for n = 0:1000
    if abs(a - b) < error
      break
    end
    
    c = (a + b) / 2;
    
    if f(a) * f(c) <= 0
      b = c;
    else
      a = c;
    end
  end
  ret = a
end
