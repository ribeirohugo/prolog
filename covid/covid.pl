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

% Predicado que a partir de um dado concelho C agrega na lista todos os concelhos vizinhos diretos que tenham o mesmo
% nível de risco.

agrega_diretos(C,L):-
    findall(X,(concelhos_vizinhos(C,X);concelhos_vizinhos(X,C)),LL),
    niveis_risco(LRiscos),
    risco_covid(C,Risco),
    nth1(Pos,LRiscos,Risco),
    agrega_diretos_aux(LL,Pos,L),!.

agrega_diretos_aux([],_,[]).
agrega_diretos_aux([X|LL],Pos,[X|L]):-
    niveis_risco(LRiscos),
    risco_covid(X,Risco),
    nth1(Pos2,LRiscos,Risco),
    Pos==Pos2,
    agrega_diretos_aux(LL,Pos,L).
agrega_diretos_aux([_|LL],Pos,L):-
    agrega_diretos_aux(LL,Pos,L).

% Predicado agrega(C,LAgreg) que a partir de um dado concelho C agrega na lista todos os concelhos vizinhos diretos ou
% indiretos que tenham o mesmo nível de risco.

agrega(C,LAgreg):-risco_covid(C,Risco),agrega1([C],Risco,[C],LAgreg).

agrega1([],_,LAgreg,LAgreg).
agrega1([X|LC],Risco,LAgreg,LAgregf):-
    findall(C,((concelhos_vizinhos(X,C);concelhos_vizinhos(C,X)),risco_covid(C,Risco),\+member(C,LAgreg)),LC1),
    append(LC1,LC,LC2),
    append(LAgreg,LC1,LAgreg1),
    agrega1(LC2,Risco,LAgreg1,LAgregf).

