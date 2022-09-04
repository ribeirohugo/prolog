:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("apriori.pl").

% todos_produtos
test(todos_produtos) :-
        todos_produtos([bolo, leite, cha, ovos, refrigerante, sumo]).

:- end_tests(lists).
