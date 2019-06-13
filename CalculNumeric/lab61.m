x = [0 pi/2 pi 3*pi/2 2*pi];
fun = sin(x);
point = pi/4;
y = [0, 1, 0, -1, 0];

range = 0:0.01:2*pi;
rez = spline (x,fun,range);
s = spline(x,[cos(0),y,cos(2*pi)],range);
hold on;

plot(x,fun,'x',range,rez);
plot(x,fun,'o',range,s);
