%teta-target parameter
%ipoteza nula H0: teta=teta0
%ipoteza alternativa H1: {teta<teta0 left-tailed (test)
%(research hipothesis)   {teta>teta0 right-tailed
%                        {teta != teta0  two-tailed
%Goal : decision to reject H0 in favor of H1 
%       or to not reject it
%on basis of sample X1,..,Xn
%Given alfa in (0,1) significance level (probabilitate de eroare)
%!!P(type I error)=P(reject H0 | H1)=alfa
%-test statistic TS 
%-observed value of the test statistic TS0=TS(teta=teta0)
%-Rejection Region , RR
%-TS0 in RR ?
%   yes -> rej H0
%   no -> not reject H0
%-significance testing 
%   P-value
%   P <= alfa -> rej H0
%   P > alfa -> not rej H0
%       mean    var         std
%pop    niu     sigma2      sigma
%samp   xbar    s2          s

%H0 is always fixed with equality

alfa = input('significance level = ');%in (0,1)
X = [7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];%sample data
sigma = 5;%sigma known
miu0 = 9;
%H0: miu = miu0 (>= works too (efficiency standard met) but we set it with
%equality )
%H1: miu < miu0 it doesnt meet the efficiency standard
%large sample n>30
n=length(X);
%TS=Z z-test is called
%TS=(xbar-miu)/(sigma/sqrt(n));
%ztest(X,miu0,sigma); miu0 e media de test, optional mai incolo pot da alfa
%si tail. alfa default 0.05, tail=left right both (-1 1 0). default la tail
%e 0 , face test bilateral. returneaza [h, p ,ci ,zval]
%h e variabila ce spune ce decizie sa luat respingere sau nerespingere 1
%sau 0
%p e p-value
%ci confidence interval in sensul testului pe care il fac , nu ne interes
%zval observed value of the TS
%if h==1
%   fprintf('reject H0, i.e. efficiency standard not met\n');
%else
%   fprintf('not reject H0, effficiency standard met \n');
%fprintf('observed value of the test statiswtic is %3.4f\n',zval);
%fprintf('P-value %1.4f\n',p);
[h,p,ci,zval]=ztest(X,miu0,sigma,alfa,'left');
ttalfa=norminv(alfa,0,1);
if h==1
   fprintf('reject H0, i.e. efficiency standard not met\n');
else
   fprintf('not reject H0, effficiency standard met \n');
end
fprintf('observed value of the test statiswtic is %3.4f\n',zval);
fprintf('P-value %1.4f\n',p);%pragu minim pt care pot cobora cu alfa sa dea
%acelasi rez 
fprintf('rejection region (-inf,%3.4f)\n',ttalfa);
%alfa =0.05 si 0.01 da aproape la fel se schimba quantila pt ca depinde de
%alfa
