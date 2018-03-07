len([],0).

len([_|T],R):-
    len(T,R1),
    R is R1 + 1.

even(L,R):-
    len(L, R1),
    R is mod(R1,2).
