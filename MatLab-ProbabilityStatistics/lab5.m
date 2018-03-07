%simulate bernoulli(p) distribution
p=input('p(in (0,1))=');
U=rand;
%standard uniform variable
X=(U<p);
%generate a sample
N=input('Nr of simulations=');
%dam nr mari ca pentru a vedea aproximarea buna trebuie mai multe
%10,1e3,1e5,1e6
for i=1:N
U=rand;
X(i)=(U<p);
end
%fprintf('%f\n',X)
%X
%compare to bernoulli distr( 0 1
%                            p q)
UX=unique(X)%valori distincte
nX=hist(X,length(UX));%frecventele fiecarei valori
relfr=nX/N


