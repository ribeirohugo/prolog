% Cálculo da média

media([],0):-!.
media(L,M):-soma_media(L,S,C), M is S/C.

soma_media([],0,0).
soma_media([X|L],S,C):-soma_media(L,S1,C1), S is S1+X, C is C1+1.

% Obter valor mínimo de lista de inteiros

menor([X],X):-!.
menor([X,Y|L],M):- X > Y -> menor([X|L],M); menor([Y|L],M).

minimo([X],X):-!.
minimo([X,Y|L],M):- X > Y, !, minimo([Y|L],M).
minimo([X,_|L],M):- minimo([X|L],M).

% Obter valor máximo de lista de inteiros

maior([X],X):-!.
maior([X,Y|L],M):- X > Y, !, maior([X|L],M).
maior([_,X|L],M):- maior([X|L],M).

% Contar o valor de pares e ímpares de uma lista de inteiros

contar_pares_impares([],0,0).
contar_pares_impares([X|L],P,I):- 0 is mod(X, 2), !, contar_pares_impares(L,P1,I), P is P1+1.
contar_pares_impares([_|L],P,I):-contar_pares_impares(L,P,I1), I is I1+1.

% Verificar se lista tem repetidos

tem_repetidos([X,Y|_]):-X == Y,!.
tem_repetidos([_|L]):-tem_repetidos(L).

% Concatenar duas listas

concatenar_listas([],[],[]):-!.
concatenar_listas([X|L],[Y|L1],[X,Y|L2]):-concatenar_listas(L,L1,L2).
concatenar_listas([X|L],[],[X|L2]):-concatenar_listas(L,[],L2).
concatenar_listas([],[X|L],[X|L2]):-concatenar_listas([],L,L2).

% Linearizar uma lista

linearizar([],[]):-!.
linearizar([L|L1],L2):-is_list(L),!,concatenar_listas(L,L1,LL),linearizar(LL,L2).
linearizar([X|L],[X|L2]):-linearizar(L,L2).
