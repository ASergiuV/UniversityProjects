h = 0.25;
a = 1;
f = @(x) sqrt(5 .* x .^ 2 + 1);

x = a:h:1+6*h;
n=length(x);
m=zeros(n);
m(:,1)=f(x);%prima coloana

for j = 2:n
    for i = 1:n+1-j
       m(i,j) = m(i+1,j-1) - m(i,j-1);
   end
end

%fprintf([repmat('%f\t', 1, size(m, 2)) '\n'], m')
m