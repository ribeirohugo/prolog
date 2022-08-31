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

% remover_iguais_seguidos
test(remover_iguais_seguidos) :-
        remover_iguais_seguidos([1,2,2,2,3],[1,2,3]).

test(remover_iguais_seguidos) :-
        remover_iguais_seguidos([1,2,2,2,3,2,2],[1,2,3,2]).

test(remover_iguais_seguidos) :-
        remover_iguais_seguidos([1],[1]).

test(remover_iguais_seguidos) :-
        remover_iguais_seguidos([],[]).

% absoluto
test(absoluto) :-
        absoluto([],[],[]).

test(absoluto) :-
        absoluto([3,3,3],[2,1,1],[1,2,2]).

test(absoluto) :-
        absoluto([1,1,1],[1,2,3],[0,1,2]).

test(absoluto) :-
        absoluto([1,1,1],[1,2,3],[0,1,2]).

% discretizar
test(conjuntos_possiveis) :-
        conjuntos_possiveis([],[]).

test(conjuntos_possiveis) :-
        conjuntos_possiveis([1,2,3],[1,2,3]).

test(conjuntos_possiveis, [nondet]) :-
        conjuntos_possiveis([1,[1,2],2],[1,1,2]),
        conjuntos_possiveis([1,[1,2],2],[1,2,2]).

test(conjuntos_possiveis, [nondet]) :-
        conjuntos_possiveis([1,[1,2],2,[3,4]],[1,1,2,3]),
        conjuntos_possiveis([1,[1,2],2,[3,4]],[1,1,2,4]),
        conjuntos_possiveis([1,[1,2],2,[3,4]],[1,2,2,3]),
        conjuntos_possiveis([1,[1,2],2,[3,4]],[1,2,2,4]).

:- end_tests(lists).
