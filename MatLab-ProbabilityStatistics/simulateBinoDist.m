%simulate bernoulli(p) distribution
p=input('p(in (0,1))=');
n=input('nr of trials intreg pozitiv=');
U=rand(n,1);
%bino distr is the sum of the n independent bernoulli distr
%standard uniform variable
X=sum(U<p);
%generate a sample
N=input('Nr of simulations=');
%dam nr mari ca pentru a vedea aproximarea buna trebuie mai multe
%10,1e3,1e5,1e6
for i=1:N
U=rand(n,1);
X(i)=sum(U<p);
end
%fprintf('%f\n',X)
%X
%compare grafically to bino(n,p)
UX=unique(X);%valori distincte
nX=hist(X,length(UX));%frecventele fiecarei valori
relfr=nX/N;
%true bino dist
k=0:n;%values
pk=binopdf(k,n,p);
clf
plot(UX,relfr,'*',k,pk,'o','Markersize',10);
legend('Simulation','Binomial','NorthEastOutside');


