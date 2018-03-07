%null H0: theta=theta0
%alt H1: theta<theta0 left tailed
%        theta>theta0 right tailed
%        theta!=theta0 two tailed
%-test statistic, TS
%-observed value of TS: TS0=TS(theta=theta0)
%-Rejection Region RR    testez daca TS0 apartine RR
%-P value
%Metode
%Given alfa(0,1) sign level
%P(type I error)=P(rej H0|H0)=alfa
%-daca TS0 apartine RR ipoteza se respinge altfel nu se respinge
%-compar alfa cu P : P<=alfa ->rej. H0
%P>alfa ->do not rej. H0
%L11 theta = niu
%          =sigma2
%L12 theta=niu1-niu2
%         =sigma1^2/sigma2^2
%       mean    var         std
%pop    niu     sigma2      sigma
%samp   xbar    s2          s
X1=[22.4 24.5 21.6 22.4 24.8 21.7 23.4 23.3 21.6 20.0];
X2=[17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];

alfa = input('significance level = ');%in (0,1)
%a) H0:sigma1=sigma2
%   H1:sigma1!=sigma2
[H,P,CI,STATS] = vartest2(X1,X2,alfa);%alfa default e 5% , tail : -1 left +1 right 0 twotailed default two tailed
%p e p-ul testului
%ci e confidence level
%stats contine mai multe chestii printre care valoarea statisticii de test
%df1 and df2 degrees of freedom 
if H==0
    fprintf('H0, is not rej, ie sigma1=sigma2\n')
else 
    fprintf('H0, is rej, ie sigma1!=sigma2\n')
end

fprintf('observed value of TS %f3.3\n',STATS.fstat)
fprintf('P value is %f3.3\n',P)
q1=finv(alfa/2,STATS.df1,STATS.df2);%in loc de df1/2 pot pune length (X1) -1 si lenght (X2) -1
q2=finv(1-alfa/2,STATS.df1,STATS.df2);
fprintf('Rejection region RR is(-Inf,%f3.4)U(%f3.4,Inf)\n',q1,q2);

%b)
%H0: niu1=niu2
%H1:niu1>niu2 right tailed
%se folosete statistica de test cu T
[h,p,ci,stats]=ttest2(X1,X2,alfa,1,'equal');%'equal' sau unequal se refera la sigma de dinainte
if h==0
    fprintf('H0, is not rej, ie niu1=niu2,ie gas milage is the same\n')
else 
    fprintf('H0, is rej, ie niu1>niu2,ie gas milage is better on premium gasoline\n')
end

fprintf('observed value of TS %f3.3\n',stats.tstat)
fprintf('P value is %e\n',p)
q=tinv(1-alfa,stats.df);
fprintf('Rejection region RR is(%f3.4,Inf)\n',q);