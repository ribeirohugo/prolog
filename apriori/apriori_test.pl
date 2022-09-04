:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("apriori.pl").

% todos_produtos
test(todos_produtos) :-
        todos_produtos([bolo, leite, cha, ovos, refrigerante, sumo]).

% nivel_suporte
test(nivel_suporte) :-
        nivel_suporte([p(bolo, 1), p(leite, 2), p(cha, 3), p(ovos, 3), p(refrigerante, 3), p(sumo, 1)]).

% corta_inferiores_N
test(corta_inferiores_N) :-
        corta_inferiores_N([p(bolo, 1), p(leite, 2), p(cha, 3), p(ovos, 3), p(refrigerante, 3), p(sumo, 1)],2,[leite, cha, ovos, refrigerante]).

% escolhe_n
test(escolhe_n, [nondet]):-
    escolhe_n(3,[leite, cha, ovos, refrigerante],[leite, cha, ovos]),
    escolhe_n(3,[leite, cha, ovos, refrigerante],[leite, cha, refrigerante]),
    escolhe_n(3,[leite, cha, ovos, refrigerante],[leite, ovos, refrigerante]),
    escolhe_n(3,[leite, cha, ovos, refrigerante],[cha, ovos, refrigerante]).

:- end_tests(lists).
