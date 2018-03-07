%inserare(L-list,E-int,R-list)
%inserare(i,i,o)
%inserare([],E,[E].
inserare(L,E,[E|L]).
inserare([H|T],E,[H|R]):-inserare(T,E,R).

%permutari(L-list,R-list)
%permutari(i,o)
permutari([],[]).
permutari([H|T],R):-
    permutari(T,RP),
    inserare(RP,H,R).
mainpermutari(L,LR):-
    findall(RP,permutari(L,RP),LR).

%combinari(L-list,K-nr,R-list)
%combinari(i,i,o)
combinari(_,0,[]):-!.
combinari([H|T],K,[H|R]):-
    K1 is K-1,
    combinari(T,K1,R).
combinari([_|T],K,R):-
    combinari(T,K,R).
maincombinari(L,K,LR):-
    findall(RP,combinari(L,K,RP),LR).
%aranjamente(L-list,K-int,R-list)
%aranjamente(i,i,o)
aranjamente(L,K,R):-
    combinari(L,K,R1),
    permutari(R1,R).
mainaranjamente(L,K,LR):-
    findall(RP,aranjamente(L,K,RP),LR).
