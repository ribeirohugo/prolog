:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("covid.pl").

% cercado
test(cercado, [fail]) :-
        cercado(porto).

test(cercado) :-
        cercado(maia).

:- end_tests(lists).
