% Predicado que verifica se os elementos do primeiro e segundo argumentos aparecem nessa ordem.
ordem_lista(X,Y,[X|L]):- member(Y,L),!.
ordem_lista(X,Y,[_|L]):- ordem_lista(X,Y,L).

