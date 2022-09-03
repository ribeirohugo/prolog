:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("covid.pl").

% cercado
test(cercado, [fail]) :-
        cercado(porto).

test(cercado) :-
        cercado(maia).

% agrega_diretos
test(agrega_diretos) :-
        agrega_diretos(porto,[matosinhos, vila_nova_de_gaia, gondomar]).

test(agrega_diretos) :-
        agrega_diretos(vila_do_conde,[povoa_do_varzim]).

% agrega
test(agrega) :-
        agrega(santa_maria_da_feira,[santa_maria_da_feira, espinho, arouca, vale_de_cambra]).

test(agrega) :-
        agrega(porto,[porto, matosinhos, vila_nova_de_gaia, gondomar, paredes, valongo, santo_tirso, trofa]).

test(agrega) :-
        agrega(vila_do_conde,[vila_do_conde, povoa_do_varzim]).

:- end_tests(lists).
