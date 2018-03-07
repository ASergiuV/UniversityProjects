p=input('p(0.05,0.95)=');
clf
for n=1 :3:100
xpdf=0:n;
ypdf=binopdf(xpdf,n,p);
plot(xpdf,ypdf)
pause(0.2)
end