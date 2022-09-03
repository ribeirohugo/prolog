:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("voos.pl").

% encontra_voos
test(encontra_voos, [nondet]) :-
    encontra_voos(porto,milao,100,[fr5483, fr1225, fr8518]),
    encontra_voos(porto,milao,100,[fr5483, fr5493]),
    encontra_voos(porto,milao,100,[fr131, fr8518]).

test(encontra_voos, [fail]) :-
    encontra_voos(porto,milao,2500,[]).

% todas_alternativas_voo
test(todas_alternativas_voo):-
    todas_alternativas_voo(porto,milao,100,[[fr5483, fr1225, fr8518],[fr5483, fr5493],[fr131, fr8518]]).

test(todas_alternativas_voo):-
    todas_alternativas_voo(porto,milao,2500,[]).

:- end_tests(lists).
