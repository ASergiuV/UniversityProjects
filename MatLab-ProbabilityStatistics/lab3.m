n=input('nr of trials ');
p=input('success probability= ');
clf
x=0:n;
ypdf=binopdf(x,n,p);
subplot(2,1,1);
plot(x,ypdf,'*')
subplot(2,1,2);
x2=0:0.01:n;
ycdf=binocdf(x2,n,p);
plot(x2,ycdf,'.')