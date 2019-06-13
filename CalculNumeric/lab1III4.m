x=0:50;
res = zeros(1,length(x));
for i = 1:length(x)
        if(mod(x(i),2)==0)
            res(i)=x(i)/2;
        else
            res(i)=3*x(i)+1;
        end
end
plot(x,res);