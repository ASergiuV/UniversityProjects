f = @(x) x ^ 3 - x ^ 2 - 1;

false_position(f, 1, 2, 0.0001);

function ret = false_position(f, a, b, error)
  if f(a) * f(b) > 0 
    return
  end
  
  for n = 0:1000
    if abs(a - b) < error
      break
    end
    
    c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    
    if f(a) * f(c) <= 0
      b = c;
    else
      a = c;
    end
  end
  ret = a
end
