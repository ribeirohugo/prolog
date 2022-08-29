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

% maior
test(maior) :-
        maior([2,3,4,1], 4).

test(maior) :-
        maior([-2,-3,-4,-1], -1).

% contar_pares_impares
test(contar_pares_impares) :-
        contar_pares_impares([1,2,3,4,5], 2, 3).

test(contar_pares_impares) :-
        contar_pares_impares([-2,-3,-4,-1], 2, 2).

% tem_repetidos
test(tem_repetidos) :-
        tem_repetidos([1,2,3,4,1]).

test(tem_repetidos) :-
        tem_repetidos([1,2,3,4,4]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([1,2,3,4,5]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([1]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([]).

% menor_elemento

test(menor_elemento) :-
        menor_elemento([2,1,0,1,2],[0,2,1,1,2]).

test(menor_elemento) :-
        menor_elemento([2,1,0,1,-2],[-2,2,1,0,1]).

test(menor_elemento) :-
        menor_elemento([],[]).

test(menor_elemento) :-
        menor_elemento([2],[2]).

:- end_tests(lists).
