%simulate bernoulli(p) distribution
p=input('p(in (0,1))=');
%geo var is the nr of failures occuring before the 1st successs
X=0;%init cu 0 
while rand>=p
    X=X+1;
end%count nr of failures,stop at 1st success


N=input('Nr of simulations=');
%dam nr mari ca pentru a vedea aproximarea buna trebuie mai multe
%10,1e3,1e5,1e6
for i=1:N
X(i)=0;%init cu 0 
while rand>=p
    X(i)=X(i)+1;
end%count nr of failures,stop at 1st success
end

%compare grafically to geo(p)
UX=unique(X);%valori distincte
nX=hist(X,length(UX));%frecventele fiecarei valori
relfr=nX/N;
%true geo dist
k=0:50;%values
pk=geopdf(k,p);
clf
plot(UX,relfr,'*',k,pk,'o','Markersize',10);
legend('Simulation','Geo','Location','NorthEastOutside');
 

