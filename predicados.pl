% Cálculo da média

media([],0):-!.
media(L,M):-soma_media(L,S,C), M is S/C.

soma_media([],0,0).
soma_media([X|L],S,C):-soma_media(L,S1,C1), S is S1+X, C is C1+1.

% Obter valor mínimo de lista de inteiros

menor([X],X):-!.
menor([X,Y|L],M):- X < Y -> menor([X|L],M); menor([Y|L],M).

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

tem_repetidos([X|X]):-!.
tem_repetidos([X|L]):-member(X,L),!.
tem_repetidos([_|L]):-tem_repetidos(L).

% Colocar o menor elemento da lista à frente da lista

menor_elemento([],[]):-!.
menor_elemento(L,[Menor|L1]):-menor(L,Menor), remove_menor(Menor,L,L1),!.

remove_menor(M,[M|L],L).
remove_menor(M,[X|L],[X|L1]):-remove_menor(M,L,L1).

% Concatenar duas listas

concatenar_listas([],[],_):-!.
concatenar_listas([X|L],L1,[X|L2]):-concatenar_listas(L,L1,L2).
concatenar_listas([],[X|L1],[X|L2]):-concatenar_listas([],L1,L2).

% Linearizar uma lista

linearizar([],[]):-!.
linearizar([L|L1],L2):-is_list(L),!,concatenar_listas(L,L1,LL),linearizar(LL,L2).
linearizar([X|L],[X|L2]):-linearizar(L,L2).

% Eliminar todas as ocorrências de um elemento numa lista

eliminar_ocorrencia([],_,[]).
eliminar_ocorrencia([X|L],N,L1):-X==N,!,eliminar_ocorrencia(L,N,L1).
eliminar_ocorrencia([X|L],N,[X|L1]):-eliminar_ocorrencia(L,N,L1).

% Eliminar a 1ª ocorrência de um elemento numa lista

eliminar_uma_ocorrencia([_],_,[_]):-!.
eliminar_uma_ocorrencia(L,N,L1):-eliminar_uma_ocorrencia_aux(L,N,0,L1).

eliminar_uma_ocorrencia_aux([],_,1,[]):-!.
eliminar_uma_ocorrencia_aux([X|L],N,O,L1):-O==0,X==N,!,eliminar_uma_ocorrencia_aux(L,N,O1,L1), O1 is O+1.
eliminar_uma_ocorrencia_aux([X|L],N,O,[X|L1]):-eliminar_uma_ocorrencia_aux(L,N,O,L1).

% Substituir todas as ocorrências de um dado elemento numa lista por um outro elemento

substituir_ocorrencia([],_,_,[]):-!.
substituir_ocorrencia([X|L],E1,E2,[E2|L2]):-X==E1,!,substituir_ocorrencia(L,E1,E2,L2).
substituir_ocorrencia([X|L],E1,E2,[X|L2]):-substituir_ocorrencia(L,E1,E2,L2).

% Adicionar elemento numa posição da lista
% N - elemento a adicionar
% I - índice de onde adicionar o elemento

adicionar_elemento(N,0,L,[N|L]):-!.
adicionar_elemento(N,I,[Y|L],[Y|L1]):-I1 is I-1,adicionar_elemento(N,I1,L,L1).

% Inverter lista

inverter([],[]):-!.
inverter([X|L],L2):-inverter(L,L1),concatenar_listas(L1,[X],L2).

% União de dois conjuntos representados por listas (os conjuntos não
% admitem elementos repetidos)

unir_conjuntos([],[],_):-!.
unir_conjuntos([X|L],L1,L2):-tem_repetidos([X|L]),!,unir_conjuntos(L,L1,L2).
unir_conjuntos([],[Y|L1],L2):-tem_repetidos([Y|L1]),!,unir_conjuntos([],L1,L2).
unir_conjuntos([],[Y|L1],[Y|L2]):-unir_conjuntos([],L1,L2).
unir_conjuntos([X|L],L1,[X|L2]):-unir_conjuntos(L,L1,L2).
