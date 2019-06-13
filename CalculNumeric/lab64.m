[x,y] = ginput(5);
x
y

hold on;
%plot(x,'x');
plot(x,y, '*');
plot(x,polyval(polyfit(x,y,2),y));
