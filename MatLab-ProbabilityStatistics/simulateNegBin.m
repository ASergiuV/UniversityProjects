%simulate bernoulli(p) distribution
p=input('p(in (0,1))=');
n=input('nr of trials poz int=');%rank fo succ
%geo var is the nr of failures occuring before the 1st successs
X=0;%init cu 0 
%negbin(n,p) is the sum of n independenbt  geo(p)vars


N=input('Nr of simulations=');
%dam nr mari ca pentru a vedea aproximarea buna trebuie mai multe
    
%10,1e3,1e5,1e6
for j=1:N
    X(j)=0;
    for i=1:n
    Y(i)=0;%init cu 0 
    while rand>=p
        Y(i)=Y(i)+1;
    end%count nr of failures,stop at 1st success
    end
X(j)=sum(Y);    
end
%compare grafically to geo(p)
UX=unique(X);%valori distincte
nX=hist(X,length(UX));%frecventele fiecarei valori
relfr=nX/N;
%true geo dist
k=0:90;%values
pk=nbinpdf(k,n,p);
clf
plot(UX,relfr,'*',k,pk,'o','Markersize',10);
legend('Simulation','Geo','Location','NorthEastOutside');
 

