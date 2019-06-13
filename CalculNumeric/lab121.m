f = @(x) cos(x) - x;
fd = @(x) -sin(x) - 1;
x = newton(f, fd,  pi/4, 100, 0.0001);

function ret = newton(f, fd, x0, maxIterations, error)
  for n = 1:maxIterations
    x1 = x0 - f(x0) / fd(x0);
    
    if abs(x1 - x0) < error
      break
    end
    
    x0 = x1;
  end
  ret = x0
end


