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

% Predicado que apresenta as combinações possíveis sempre que encontrar uma lista como elemento
% dessa lista.
% ex.: conjuntos_possiveis([1,[1,2],2,[3,4]],L).
% L = [1,1,2,3];[1,1,2,4];[1,2,2,3];[1,2,2,4].

conjuntos_possiveis([],[]).
conjuntos_possiveis([X|L],[Y|L1]):-is_list(X),!,member(Y,X),conjuntos_possiveis(L,L1).
conjuntos_possiveis([X|L],[X|L1]):-conjuntos_possiveis(L,L1).

% Escreva um predicado Prolog retira_extremos/2 que a partir de uma lista representando uma
  %sequência de números retira todas as ocorrências do menor valor e do maior valor da sequência. Por
  %exemplo:
  %?- retira_extremos([10,12,15,13,12,9,14,17,9,15,17],LSE).
  %LSE = [10, 12, 15, 13, 12, 14, 15].
  %Nota: pode usar o predicado delete/3 que recebe no 1º argumento uma lista instanciada e remove dessa
  %lista todas as ocorrências do valor instanciado indicado no 2º argumento, gerando a lista pretendida no
  %3º argumento

retira_extremos([],[]):-!.
retira_extremos(L,L2):-
    retira_extremos_aux(L,Menor,Maior),
    delete(L,Maior,L1),
    delete(L1,Menor,L2).

retira_extremos_aux([X],X,X).
retira_extremos_aux([X|L],X,Menor):-retira_extremos_aux(L,Maior,Menor),X>Maior,!.
retira_extremos_aux([X|L],Maior,X):-retira_extremos_aux(L,Maior,Menor),X<Menor,!.
retira_extremos_aux([_|L],Maior,Menor):-retira_extremos_aux(L,Maior,Menor).

