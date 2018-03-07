
alfa=input('significance level= ');
n=20;
miu0=99.4;
X=[99.8*ones(1,2),99.9*ones(1,5),98.0*ones(1,3),100.1*ones(1,4),100.5*ones(1,2),100.0*ones(1,2),100.2*ones(1,2)];%sample data
%H0:miu=miu0 (<=)
%H1:miu>miu0 (righttailed test)
%acu e t-test 
[h,p,ci,stats]=ttest(X,miu0,alfa,'right');
tt=tinv(1-alfa,stats.df);%stats.df=n-1
if h==1
   fprintf('reject H0, i.e. too many calories/fitness center doesnt accept\n');
else
   fprintf('not reject H0, not too many calories/fitness center accepts \n');
end
fprintf('observed value of the test statiswtic is %3.4f\n',stats.tstat);
fprintf('P-value %1.4f\n',p);%pragu minim pt care pot cobora cu alfa sa dea
%acelasi rez 
fprintf('rejection region (%3.4f,inf)\n',tt);
%stats se schimba putin, tstat = TS0, df degrees of freedom(parametrul
%distributiei trebuie ot quantila), sd standard dev
%accesez ca si clasele stats.tstat