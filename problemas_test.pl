:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("problemas.pl").

% ordem_lista
test(ordem_lista) :-
        ordem_lista(1,2,[1,2]).

test(ordem_lista, [fail]) :-
        ordem_lista(1,2,[2,1]).

test(ordem_lista, [fail]) :-
        ordem_lista(1,2,[]).

test(ordem_lista) :-
        ordem_lista(1,2,[0,1,5,3,8,2]).

test(ordem_lista) :-
        ordem_lista(1,2,[1,2,1,2]).

test(ordem_lista) :-
        ordem_lista(1,2,[0,1,2,1,8,2,1]).

:- end_tests(lists).
