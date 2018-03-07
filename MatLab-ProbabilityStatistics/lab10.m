conf_level=input('confidence level = ');
alfa=1-conf_level;
X1=[22.4 24.5 21.6 22.4 24.8 21.7 23.4 23.3 21.6 20.0];
X2=[17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];
n1=length(X1);
n2=length(X2);
xb1=mean(X1);
xb2=mean(X2);
%sigma 1 = sigma 2
S21=var(X1);
S22=var(X2);
sp2=((n1-1)*S21+(n2-1)*S22)/(n1+n2-2);
q1=tinv(alfa/2,n1+n2-2);
q2=-q1;
ci1=xb1-xb2-q2*sqrt(sp2)*sqrt(1/n1+1/n2);
ci2=xb1-xb2+q2*sqrt(sp2)*sqrt(1/n1+1/n2);
%pt sigma 1!= simga 2
c=(S21/n1)/(S21/n1+S22/n2);
ninvers=c^2/(n1-1)+(1-c)^2/(n2-1);
n=1/ninvers;
t1=tinv(1-alfa/2,n);
%t e quantila si se calc in fct de c si n
ci3=xb1-xb2-t1*sqrt(S21/n1+S22/n2);
ci4=xb1-xb2+t1*sqrt(S21/n1+S22/n2);

%c
qu1=finv(alfa/2,n1-1,n2-1);
qu2=finv(1-alfa/2,n1-1,n2-1);
ratio1=(1/qu2)*S21/S22;
ratio2=(1/qu1)*S21/S22;
fprintf('confidence interval for the difference of means, sigma1=sigma2, is(%3.4f,%3.4f)\n',ci1,ci2);
fprintf('confidence interval for the difference of means, sigma1!=sigma2, is(%3.4f,%3.4f)\n',ci3,ci4);
fprintf('confidence interval for the ratio of variances is(%3.4f,%3.4f)\n',ratio1,ratio2);
fprintf('confidence interval for the ratio of standard deviations is(%3.4f,%3.4f)\n',sqrt(ratio1),sqrt(ratio2));