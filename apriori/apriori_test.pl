:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("apriori.pl").

% todos_produtos
test(todos_produtos) :-
        todos_produtos([bolo, leite, cha, ovos, refrigerante, sumo]).

% nivel_suporte
test(nivel_suporte) :-
        nivel_suporte([p(bolo, 1), p(leite, 2), p(cha, 3), p(ovos, 3), p(refrigerante, 3), p(sumo, 1)]).


:- end_tests(lists).

