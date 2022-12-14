:- consult("consulta.pl").

% Predicado que retorna todos os produtos distintos existentes na consulta.
todos_produtos(LTP):-
    findall(X,compra(_,X),LL),
    produtos(LL,LTP),!.

lista_produtos([],_).
lista_produtos([X|LL],LTP):-
    produtos(X,LP2),
    append(LP1,LP2,LTP),
    lista_produtos(LL,LP1).

produtos([],_).
produtos([X|LL],[X|LTP]):-
    not(member(X,LTP)),!,
    produtos(LL,LTP).
produtos([_|LL],LTP):-
    produtos(LL,LTP).

% Predicado que retorna uma lista LTPNS de termos do tipo p(P,Qt) que representam a quantidade Qt de compras (nível de
% suporte) envolvendo o produto P.
nivel_suporte(LTPNS):-todos_produtos(LTP),nivel_suporte1(LTP,LTPNS),!.

nivel_suporte1([],[]).
nivel_suporte1([P|LTP],[p(P,QtI)|LTPNS]):-
    findall(I,(compra(I,LPI),member(P,LPI)),LI),
    length(LI,QtI),
    nivel_suporte1(LTP,LTPNS).

% Predicado que retorna uma lista com os nomes dos produtos que têm pelo menos o nível de suporte N1.
corta_inferiores_N([],_,[]).
corta_inferiores_N([p(P,Qt)|LTPNS],N,[P|LP]):-
    N=<Qt,!,
    corta_inferiores_N(LTPNS,N,LP).
corta_inferiores_N([_|LTPNS],N,LP):-
    corta_inferiores_N(LTPNS,N,LP).

% Predicado escolheN(N,LP,LPC) que a partir de uma lista de produtos LP, retorna uma lista LPC
% com uma combinação de N produtos dessa lista.
escolhe_n(0,_,[]):-!.
escolhe_n(N,[X|LP],[X|LPC]):-N1 is N-1, escolhe_n(N1,LP,LPC).
escolhe_n(N,[_|L],LPC):-escolhe_n(N,L,LPC).
