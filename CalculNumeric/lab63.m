temp = [0 10 20 30 40 60 80 100];
pressure = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];
p4 = polyfit(temp, pressure, 4)
p3 = polyfit(temp, pressure, 3)
p2 = polyfit(temp, pressure, 2)
p1 = polyfit(temp, pressure, 1)

p1de45 = polyval(p1,45)
p2de45 = polyval(p2,45)
p3de45 = polyval(p3,45)
p4de45 = polyval(p4,45)

trueP45 = 0.095848;
error = abs(p4de45 - trueP45)



x = [0 10 20 30 40 60 80 100];
f = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];
point = [45];

A=a(x);

n=length(x);
sum1=0;
sum2=0;

for i = 1:n
    sum1 = sum1 + A(i) * f(i) / (point(1)-x(i));
    sum2 = sum2 + A(i) / (point(1)-x(i));
end
fprintf("t 45 = %10.2f\n",sum1/sum2);

temperatiru = linspace(0,100,1000);
hold on;
plot(temp,pressure,'o')
plot(temperatiru, polyval(p4,temperatiru));
plot(temperatiru, polyval(p2,temperatiru));
legend('data','degree 4','degree 2')

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

