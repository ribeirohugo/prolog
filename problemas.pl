% Predicado que verifica se os elementos do primeiro e segundo argumentos aparecem nessa ordem.
ordem_lista(X,Y,[X|L]):- member(Y,L),!.
ordem_lista(X,Y,[_|L]):- ordem_lista(X,Y,L).

% Predicado que remove os elementos seguidos iguais que aparecem numa lista deixando apenas uma ocorrência do elemento
% na lista.
remover_iguais_seguidos([],_):-!.
remover_iguais_seguidos([_],_):-!.
remover_iguais_seguidos([X,Y|L],[Y|L1]):-X==Y,!,remover_iguais_seguidos([Y|L],[Y|L1]).
remover_iguais_seguidos([X,Y|L],L1):-remover_iguais_seguidos([Y|L],[X|L1]).
