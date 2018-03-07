%append1(L-list,E-elemnt to be appended,R-list)
%append1(I,I,O)
append1([], X, X).
append1([H | T], X, Y) :-
    append1(T, X, Y1),
    Y = [H | Y1].
%subs(L-list,E-element to substitute,L-list to sub with,R-list)
%subs(I,I,I,O)
subs([], _, _, []).
subs([H | T], E, X, Y) :-
    H==E,
    subs(T, E, X, Y1),
    append1(X, Y1, Y).

subs([H | T], E, X, [H | Tr]) :-
    H =\= E,
    subs(T, E, X, Tr).
%replace(L-list with sublists,L-list to repl with,R-list)
%replace(I,I,O)
replace([], _, []).

replace([H | T], X, [H | Tr]) :-
    number(H),
    replace(T, X, Tr).

replace([[Hi | Ti] | T], X, Y) :-
    is_list([Hi | Ti]),
    replace(T, X, Y1),
    subs([Hi | Ti], Hi, X, Z),
    Y = [Z | Y1].
