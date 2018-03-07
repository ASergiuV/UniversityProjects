x=[20*ones(1,2),21,22*ones(1,3),23*ones(1,6),24*ones(1,5),25*ones(1,9),26*ones(1,2),27*ones(1,2)];
y=[75*ones(1,3),76*ones(1,2),77*ones(1,2),78*ones(1,5),79*ones(1,8),80*ones(1,8),81,82];
mx=mean(x);
my=mean(y);
fprintf('mx = %f\n',mx)
fprintf('my = %f\n',my)

vx=var(x,1);
vy=var(y,1);
fprintf('Variances:\nvx = %f\n',vx)
fprintf('vy = %f\n',vy)
cxy=cov(x,y,1);

fprintf('covariance = %f\n',cxy(1,2))

cxy2=corrcoef(x,y);
%exremele inseamna ca e legatura perfecta adica daca e -1 sau 1 ins ca 
%au legatura totala,o sa fie pe dreapta de regresie ,descendenta daca e neg
%asc daca e poz , 
fprintf('corelation coefficient ,se noteaza cu ro= %f\n',cxy2(1,2))
clf
scatter(x,y)
hold on
%dreapta de regresie line of regression
xreg=x;
yreg=my+cxy2(1,2)*(sqrt(vy)/sqrt(vx))*(xreg-mx);
plot(xreg,yreg,'b');
%cine are varianta cu 1 sunt var , std,cov. simple sau de populatie ,
%simple=de selectie
%notatia pt varianta e cu s^2 ,le face cu sume, functia std din matlab e ca
%si cum am face noi de mana ,face sqrt, cand in formule apare s^2, nu
%trebuie sa apara std(x)^2 ca std face patratu dupaia face radicalu si
%dupaia ridica iar la patrat , s^2 inseamna direct varianta, daca vede
%doaman profa asa ceva se infurie :)
