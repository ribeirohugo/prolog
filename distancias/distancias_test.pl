:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("distancias.pl").

% calcula_viagem
test(calcula_viagem) :-
        calcula_viagem([],0,[]).

test(calcula_viagem) :-
        calcula_viagem([faculdade],40,[]).

test(calcula_viagem) :-
        calcula_viagem([faculdade,parque,trabalho,restaurante],204,[restaurante]).

:- end_tests(lists).
