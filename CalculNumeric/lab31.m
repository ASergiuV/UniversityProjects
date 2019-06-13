x = [1930 1940 1950 1960 1970 1980];
f = [123203 131669 150697 179323 203212 226505];
point = [1955 1995];

A=a(x);

n=length(x);
sum1=0;
sum2=0;

for i = 1:n
    sum1 = sum1 + A(i) * f(i) / (point(2)-x(i));
    sum2 = sum2 + A(i) / (point(2)-x(i));
end
fprintf("pop 1995 = %10.2f\n",sum1/sum2);

sum1=0;
sum2=0;

for i = 1:n
    sum1 = sum1 + A(i) * f(i) / (point(1)-x(i));
    sum2 = sum2 + A(i) / (point(1)-x(i));
end
fprintf("pop 1955 = %10.2f\n",sum1/sum2);

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

