conf_level=input('conflevel= ');
%1-alfa in (0,1)
alfa=1-conf_level;
X=[99.8*ones(1,2),99.9*ones(1,5),98.0*ones(1,3),100.1*ones(1,4),100.5*ones(1,2),100.0*ones(1,2),100.2*ones(1,2)];%sample data
%unknown sigma
S=std(X);
n=length(X);
%sample size
selection_mean=mean(X);%x barred sample mean
q1=tinv(alfa/2,n-1);
q2=tinv(1-alfa/2,n-1);
%these were the quantils
%aici se putea q2=1-q1
ci1=selection_mean-S/sqrt(n)*q2;
ci2=selection_mean-S/sqrt(n)*q1;
fprintf('c.i. for pop mean niu, case sigma unknown= (%3.4f,%3.4f)\n',ci1,ci2)