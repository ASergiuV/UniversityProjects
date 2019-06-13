x = [64 81 100 121 144 169 196];
f = [8 9 10 11 12 13 14];
point = 115;

A=a(x);

n=length(x);
sum1=0;
sum2=0;

for i = 1:n
    sum1 = sum1 + A(i) * f(i) / (point-x(i));
    sum2 = sum2 + A(i) / (point-x(i));
end
fprintf("sqrt(115) = %10.10f\n",sum1/sum2);

function A = a(x)
  ret = [];
  n=length(x);
  for i = 1:n
    diff = x(i) - x;
    prd = prod(diff(1:i-1)) * prod(diff(i+1:end));
    ret = [ret, 1 / prd];
  end
  A = ret;
end

