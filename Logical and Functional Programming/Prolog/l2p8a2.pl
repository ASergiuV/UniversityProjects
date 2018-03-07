even2([]).
even2([_|T]):-
    not(even2(T)).
