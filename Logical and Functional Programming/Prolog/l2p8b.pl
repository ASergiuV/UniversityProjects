min([],Min,Min).
min([H|T],Min,R):- H < Min,
	min(T, H, R),!.
min([_|T],Min,R):-
	min(T, Min, R).

del([],_,[]).

del([H|T],X,[H|R]):- X=\=H,
	del(T,X ,R).
del([H|T],X,R):-H=:=X,
	R=T.

delMin(L,R):-
	min(L,1000,RM),
	del(L,RM,R).

