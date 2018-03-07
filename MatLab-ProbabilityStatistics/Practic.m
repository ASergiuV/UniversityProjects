A=[1021 980 1017 988 1005 998 1014 985 995 1004 1030 1015 995 1023];
B=[1070 970 993 1013 1006 1002 1014 997 1002 1010 975];
%a)
%H0: sigmaA=sigmaB
%H1: sigmaA!=sigmaB
alfa = input('significance level = ');%in (0,1)
[H,P,CI,STATS] = vartest2(A,B,alfa);
if H==0
    fprintf('H0, is not rej, ie sigma1=sigma2 ie variances do not differ\n')
else 
    fprintf('H0, is rej, ie sigma1!=sigma2 ie variances differ\n')
end
fprintf('observed value of TS %3.3f \n',STATS.fstat)
fprintf('P value is %3.3f \n',P)
q1=finv(alfa/2,STATS.df1,STATS.df2);%in loc de df1/2 pot pune length (X1) -1 si lenght (X2) -1
q2=finv(1-alfa/2,STATS.df1,STATS.df2);
fprintf('Rejection region RR is(-Inf,%3.4f)U(%3.4f,Inf)\n',q1,q2);
%b)
%H0: miu1=miu2
%H1:niu1>niu2 right tailed
%se folosete statistica de test cu T
[h,p,ci,stats]=ttest2(A,B,alfa,1,'equal');%'equal' sau unequal se refera la sigma de dinainte
if h==0
    fprintf('H0, is not rej, ie miu1=miu2,ie both suppliers are reliable\n')
else 
    fprintf('H0, is rej, ie niu1>niu2,ie supplier A seems to be more reliable\n')
end

fprintf('observed value of TS %f\n',stats.tstat)
fprintf('P value is %e\n',p)
q=tinv(1-alfa,stats.df);
fprintf('Rejection region RR is(%f,Inf)\n',q);