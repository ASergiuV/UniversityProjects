%simulate 3 coin tosses
N=input('nr of simulations: ');
U=rand(3,N);
Y=(U<1/2);
X=sum(Y);
%hist=histograma da frecventa 
hist(X)

% 
% x1=(rand(1,10)<1/2)
% x2=(rand(1,10)<1/2)
% x3=(rand(1,10)<1/2)