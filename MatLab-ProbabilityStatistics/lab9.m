conf_level=input('conflevel= ');
%1-alfa in (0,1)
alfa=1-conf_level;
X=[7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];
%sample data
sigma=5;%known sigma
n=length(X);
%sample size
selection_mean=mean(X);%x barred sample mean
q1=norminv(alfa/2,0,1);
q2=norminv(1-alfa/2,0,1);
%these were the quantils
%aici se putea q2=1-q1
ci1=selection_mean-sigma/sqrt(n)*q2;
ci2=selection_mean-sigma/sqrt(n)*q1;
fprintf('c.i. for pop mean niu, case sigma known= (%3.4f,%3.4f)\n',ci1,ci2)