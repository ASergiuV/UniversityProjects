function N = newton(x, y, X)
  A = newt(x, y);
  A = A(1,2:end);
  n=length(A);
  sum=0;
  prod=1;
  x
  A
  for i = 2:n
    prod = prod *(X - x(i-1));
    sum = sum + prod * A(1,i-1);
  end
  sum
  N = sum;
end