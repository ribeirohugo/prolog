:- consult("consulta.pl").

% Predicado que indica se o nível de risco de covid de um dado concelho Ci é inferior ao de todos os seus concelhos vizinhos.

cercado(Ci):-
    findall(X,(concelhos_vizinhos(Ci,X);concelhos_vizinhos(X,Ci)),LL),
    risco_covid(Ci,Risco),niveis_risco(LRiscos),
    nth1(Pos,LRiscos,Risco),
    todos_risco_maior(LL,Pos),!.

todos_risco_maior([],_).
todos_risco_maior([C|LC],Pos):-
    niveis_risco(LRiscos),
    risco_covid(C,Risco),
    nth1(Pos2,LRiscos,Risco),
    Pos2>Pos,
    todos_risco_maior(LC,Pos).
