conf_level=input('conflevel= ');
%1-alfa in (0,1)
alfa=1-conf_level;
X=[1.48 1.26 1.52 1.56 1.48 1.46...
1.30 1.28 1.43 1.43 1.55 1.57...
1.51 1.53 1.68 1.37 1.47 1.61...
1.49 1.43 1.64 1.51 1.60 1.65...
1.60 1.64 1.51 1.51 1.53 1.74
];
%unknown sigma
S=var(X);
n=length(X);
%sample size
selection_mean=mean(X);%x barred sample mean
q1=chi2inv(alfa/2,n-1);
q2=chi2inv(1-alfa/2,n-1);
%these were the quantils
%aici se putea q2=1-q1
ci1=(n-1)*S/q2;
ci2=(n-1)*S/q1;
fprintf('c.i. selection variance = (%3.4f,%3.4f)\n',ci1,ci2)
fprintf('c.i. standard deviation = (%3.4f,%3.4f)\n',sqrt(ci1),sqrt(ci2))