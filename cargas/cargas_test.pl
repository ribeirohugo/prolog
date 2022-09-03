:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("cargas.pl").

% soma_pesos
test(soma_pesos) :-
    soma_pesos([],[],0).

test(soma_pesos) :-
    soma_pesos([a],[0.5],0.5).

test(soma_pesos) :-
    soma_pesos([a,b,c,d,e,f],[9.0, 8.5, 6.7, 5.7, 3.2, 2],9.0).

% acrescenta_tara
test(acrescenta_tara) :-
    acrescenta_tara(6,[],[6]).

test(acrescenta_tara) :-
    acrescenta_tara(6,[0.5],[6.5,6]).

test(acrescenta_tara) :-
    acrescenta_tara(6,[9.0, 8.5, 6.7, 5.7, 3.2, 2],[15.0, 14.5, 12.7, 11.7, 9.2, 8,6]).

:- end_tests(lists).
