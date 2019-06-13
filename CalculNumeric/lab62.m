x = [1 2 3 4 5 6 7];
temp = [13 15 20 14 15 13 10];
m = length(x) - 1;

a = ((m+1) .* sum(x.*temp) - sum(x) .* sum(temp))/ ((m+1).* sum(x.^2)-sum(x).^2);

b= (sum(x.^2) .* sum (temp) - sum(x .* temp) * sum(x)) / ((m+1) * sum(x.^2) - sum(x)^2);
phi = zeros(1, m+1);
for i = 1:m+1 
    phi(1,i) = a * x(i) +b ;
end
minimum = sqrt(sum((temp - phi).^2))
temperaturala8 = a * 8 + b
hold on;
%plot(x,'x');
plot(x,temp, '*');
plot(x,phi);
