:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("predicados.pl").

% media

test(media) :-
        media([2,2], 2).

test(media) :-
        media([-10,10], 0).

% menor

test(menor) :-
        menor([2,3,4,1], 1).

test(minimo) :-
        minimo([2,3,4,1], 1).

:- end_tests(lists).
