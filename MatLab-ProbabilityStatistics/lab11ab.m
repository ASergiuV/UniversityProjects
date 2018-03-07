alfa=input('significance level= ');
X = [7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];%sample data
v0=25;%test e pot sigma patrat 
[h,p,ci,stats]=vartest(X,v0,alfa,'both');
q1=chi2inv(alfa/2,stats.df);
q2=chi2inv(1-alfa/2,stats.df);
if h==1
   fprintf('reject H0, assumption is not correct  \n');
else
   fprintf('not reject H0, asumption is correct  \n');
end
fprintf('observed value of the test statistic is %3.4f\n',stats.chisqstat);
fprintf('P-value %1.4f\n',p);%pragu minim pt care pot cobora cu alfa sa dea
%acelasi rez 
fprintf('rejection region (-inf,%3.4f)U(%3.4f,inf)\n',q1,q2);
%b 
%H0: sigma=5
%H1: sigma != 5 two-tailed test
%<=> H0: simga2=25
%H1: sigma2!=25
%folosim chi2 test dar nu exista si ii zice vartest