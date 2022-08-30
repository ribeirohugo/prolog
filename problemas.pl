% Predicado que verifica se os elementos do primeiro e segundo argumentos aparecem nessa ordem.
ordem_lista(X,Y,[X|L]):- member(Y,L),!.
ordem_lista(X,Y,[_|L]):- ordem_lista(X,Y,L).

% Predicado que remove os elementos seguidos iguais que aparecem numa lista deixando apenas uma ocorrência do elemento
% na lista.
remover_iguais_seguidos([],_):-!.
remover_iguais_seguidos([_],_):-!.
remover_iguais_seguidos([X,Y|L],[Y|L1]):-X==Y,!,remover_iguais_seguidos([Y|L],[Y|L1]).
remover_iguais_seguidos([X,Y|L],L1):-remover_iguais_seguidos([Y|L],[X|L1]).

% Predicado que a partir de duas listas de números inteiros não negativos de igual dimensão e
% cria uma terceira lista com o valor absoluto da diferença dos valores em posições idênticas.
absoluto([],[],[]):-!.
absoluto([X|L],[Y|L1],[Z|L2]):-Y>X,!,absoluto(L,L1,L2),Z is Y-X.
absoluto([X|L],[Y|L1],[Z|L2]):-absoluto(L,L1,L2),Z is X-Y.
