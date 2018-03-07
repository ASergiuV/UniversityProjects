%prim_nr(X-int,C-int)
%prim_nr(i,i-always 2)
prim_nr(1,_):-false.
prim_nr(0,_):-false.
prim_nr(X,X):-!.

prim_nr(X,C):-
    not(mod(X,C)=:=0),
    C1 is C+1,
    prim_nr(X,C1).
%remove(L-list,P-int,f-int,X-list)
%remove(i,i,i,o)
remove([],_,_,[]).
remove([_|T],P,F,T):-
    P=:=F,
    !.
% sterg ce e pe pozitie
% incep de la 1
remove([H|T],P,F,[H|X]):-
    F1 is F+1,
    remove(T,P,F1,X).
%c=1 ca sa fie prima pozitie
% del(L-list,C-int,X-list)
% del(i,i,o)
del([],_,[]).
del([H|T],C,[H|X]):-
    not(prim_nr(H,2)),
    C1 is C+1,
    del(T,C1,X).
del([H1,H2|T],C,[H1,H2|X]):-
    prim_nr(H1,2),
    not(prim_nr(H2,2)),
    C1 is C+1,
    del(T,C1,X).
del([H1,H2|T],C,X1):-
    prim_nr(H1,2),
    prim_nr(H2,2),
    C1 is C+2,
    del(T,C1,X1).
