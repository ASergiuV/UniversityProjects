x0=input('x0=');
x1=input('x1=');
x2=input('x2=');
alfa=input('alfa(in 0,1)=');
beta=input('beta(in 0,1)=');
option=input('1 for norm,2 for Student(T) :');
switch option
    case 1
        %normal distr
        mu=input('mu=');
        sigma=input('Sigma(>0)=');
        %a)
        Pa=normcdf(x0,mu,sigma);
        %b)
        Pb=1-Pa;
        %c)
        Pc=normcdf(x2,mu,sigma)-normcdf(x1,mu,sigma);
        %d)
        Pd=1-Pc;
        %e)
        Ae=norminv(alfa,mu,sigma);
        %f)
        Af=norminv(1-beta,mu,sigma);%norm inv ia o prob si da valoare pt care e prob aia
        %beta si alfa sunt probabilitati = arii sub gf

    case 2
        
        %student distr
        df=input('degrees of freedom');
        %a)
        Pa=tcdf(x0,df);
        %b)
        Pb=1-Pa;
        %c)
        Pc=tcdf(x2,df)-normcdf(x1,df);
        %d)
        Pd=1-Pc;
        %e)
        Ae=tinv(alfa,df);
        %f)
        Af=tinv(1-beta,df);%norm inv ia o prob si da valoare pt care e prob aia
        %beta si alfa sunt probabilitati = arii sub gf
    otherwise
        error('wrong option');
end
fprintf('Ans in a) = %f\n',Pa)
fprintf('Ans in b) = %f\n',Pb)
fprintf('Ans in c) = %f\n',Pc)
fprintf('Ans in d) = %f\n',Pd)
fprintf('Ans in e) = %f\n',Ae)
fprintf('Ans in f) = %f\n',Af)
