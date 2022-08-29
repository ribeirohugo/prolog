:- begin_tests(lists).
:- use_module(library(lists)).

:- consult("predicados.pl").

% contar
test(contar) :-
        contar([1,2], 2).

test(contar) :-
        contar([1], 1).

test(contar) :-
        contar([], 0).

% media
test(media) :-
        media([2,2], 2).

test(media) :-
        media([-10,10], 0).

% menor
test(menor) :-
        menor([2,3,4,1], 1).

test(minimo) :-
        minimo([2,3,4,1], 1).

% maior
test(maior) :-
        maior([2,3,4,1], 4).

test(maior) :-
        maior([-2,-3,-4,-1], -1).

% contar_pares_impares
test(contar_pares_impares) :-
        contar_pares_impares([1,2,3,4,5], 2, 3).

test(contar_pares_impares) :-
        contar_pares_impares([-2,-3,-4,-1], 2, 2).

% tem_repetidos
test(tem_repetidos) :-
        tem_repetidos([1,2,3,4,1]).

test(tem_repetidos) :-
        tem_repetidos([1,2,3,4,4]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([1,2,3,4,5]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([1]).

test(tem_repetidos, [fail]) :-
        tem_repetidos([]).

% menor_elemento

test(menor_elemento) :-
        menor_elemento([2,1,0,1,2],[0,2,1,1,2]).

test(menor_elemento) :-
        menor_elemento([2,1,0,1,-2],[-2,2,1,0,1]).

test(menor_elemento) :-
        menor_elemento([],[]).

test(menor_elemento) :-
        menor_elemento([2],[2]).

% concatenar_listas
test(concatenar_listas) :-
        concatenar_listas([1,2,3],[3,2,1],[1,2,3,3,2,1]).

test(concatenar_listas) :-
        concatenar_listas([1,2],[1,2],[1,2,1,2]).

test(concatenar_listas) :-
        concatenar_listas([1,2],[1],[1,2,1]).

test(concatenar_listas) :-
        concatenar_listas([],[],[]).

test(concatenar_listas) :-
        concatenar_listas([1],[],[1]).

test(concatenar_listas) :-
        concatenar_listas([],[1],[1]).

% linearizar_listas
test(linearizar) :-
        linearizar([1,2,[1,2]],[1,2,1,2]).

test(linearizar) :-
        linearizar([[1],2,[]],[1,2]).

test(linearizar) :-
        linearizar([],[]).

% eliminar_ocorrencia
test(eliminar_ocorrencia) :-
        eliminar_ocorrencia([1,2,2,3,3],2,[1,3,3]).

test(eliminar_ocorrencia) :-
        eliminar_ocorrencia([],2,[]).

% eliminar_uma_ocorrencia
test(eliminar_uma_ocorrencia) :-
        eliminar_uma_ocorrencia([1,2,2,3,3],2,[1,2,3,3]).

test(eliminar_uma_ocorrencia) :-
        eliminar_uma_ocorrencia([1,2,3],1,[2,3]).

test(eliminar_uma_ocorrencia) :-
        eliminar_uma_ocorrencia([],2,[]).

% substituir_ocorrencia
test(substituir_ocorrencia) :-
        substituir_ocorrencia([2,2,2],2,2,[2,2,2]).

test(substituir_ocorrencia) :-
        substituir_ocorrencia([2,2,2],2,1,[1,1,1]).

test(substituir_ocorrencia) :-
        substituir_ocorrencia([],1,2,[]).

% adicionar_elemento
test(adicionar_elemento) :-
        adicionar_elemento(0,0,[1,2,3,4],[0,1,2,3,4]).

test(adicionar_elemento) :-
        adicionar_elemento(0,0,[],[0]).

test(adicionar_elemento) :-
        adicionar_elemento(1,3,[],[]).

% inverter
test(inverter) :-
        inverter([1,2,3],[3,2,1]).

test(inverter) :-
        inverter([1],[1]).

test(inverter) :-
        inverter([],[]).

% unir conjuntos
test(unir_conjuntos) :-
        unir_conjuntos([1,2],[3,4],[1,2,3,4]).

test(unir_conjuntos) :-
        unir_conjuntos([1,2],[2,3,4],[1,2,3,4]).

test(unir_conjuntos) :-
        unir_conjuntos([3,2,1],[2,3,4],[3,2,1,4]).

test(unir_conjuntos) :-
        unir_conjuntos([1],[],[1]).

test(unir_conjuntos) :-
        unir_conjuntos([],[1],[1]).

test(unir_conjuntos) :-
        unir_conjuntos([],[],[]).

% interseccao_conjuntos
test(interseccao_conjuntos) :-
        interseccao_conjuntos([],[],[]).

test(interseccao_conjuntos) :-
        interseccao_conjuntos([1,2,3],[],[]).

test(interseccao_conjuntos) :-
        interseccao_conjuntos([1,2,3],[1,2],[1,2]).

test(interseccao_conjuntos) :-
        interseccao_conjuntos([3,1,1,1],[2,1],[3,1,1,1]).

test(interseccao_conjuntos) :-
        interseccao_conjuntos([1],[1],[1]).

% existe
test(existe) :-
        existe([1,2,3],1).

test(existe) :-
        existe([1,2,3],3).

test(existe, [fail]) :-
        existe([1,2,3],5).

test(existe, [fail]) :-
        existe([],5).

:- end_tests(lists).
