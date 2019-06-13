x = -1:0.01:3;
x0=0;
hold on;
t=exp(x0);
S=1;

for i = 1:6
  t = t .* (x-x0)/i;
  S=S+t;
  plot(x,S);
end

title('First 6 Taylor polynomials');
