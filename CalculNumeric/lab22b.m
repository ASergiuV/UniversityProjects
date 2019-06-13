T = @(n, t) cos(n * acos(t));
t = -1:0.01:1;


%plot(t, T(1, t));
%plot(t, T(2, t));
%plot(t, T(3, t));

n = input('What is n?');
x = -1:0.01:1;

T0 = 1;
T1 = x;

hold on;
title('Chebyshev polynomials');
plot(x,T0);
plot(x,T1);

for i = 2 : n
  T2 = 2.*x.*T1 - T0;
  plot(x,T2);
  T0 = T1;
  T1 = T2;
end
