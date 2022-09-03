:- consult("consulta.pl").

% Predicado para visitar cidades, criar uma lista da carga decremental do transporte e retornar o somatório dos pesos
% no 3º argumento.
% carga(Cidade,Carga)
soma_pesos([],[],0):-!.
soma_pesos([X|L],[Peso|L1],Peso):-
    carga(X,Carga),
    soma_pesos(L,L1,P),
    Peso is Carga+P.

% Predicado para acrescentar uma dada Tara do transporte expressa em toneladas e uma lista de pesos LPesos, e retorna
% a lista de pesos com a tara incluída.
acrescenta_tara(Tara,[],[Tara]):-!.
acrescenta_tara(Tara,[P|L],[Peso|L1]):-
    acrescenta_tara(Tara,L,L1),
    Peso is P+Tara.

% Predicado que calcula o custo como a soma dos produtos das distâncias percorridas pelo peso em movimento (do camião
% mais cargas transportadas).
calcula_custo([],0):-!.
calcula_custo(LCidades,Custo):-
    soma_pesos(LCidades,LPesos,_),
    tara(Tara),
    acrescenta_tara(Tara,LPesos,LPesosTara),
    cidade_fabrica(CF),
    append([CF|LCidades],[CF],LCidadesCompleta),
    custo(LCidadesCompleta,LPesosTara,Custo),!.

custo([_],[],0):-!.
custo([X,Y|LCidades],[P|LPesos],Custo):-
    (dist(X,Y,Dist);dist(Y,X,Dist)),
    custo([Y|LCidades],LPesos,C),
    Custo is C+(Dist*P).

% d)[30%] Escreva um predicado seq_custo_min(LC,Custo) que determine a sequência de entregas de todas as
  %cargas que leva ao menor custo de acordo com o cálculo do custo definido na alínea anterior, retornando em
  %LC a sequência de cidades no trajeto de entregas e em Custo o respetivo custo. As cidades a entregar são
  %aquelas que estiverem nos factos do tipo carga/2.
  %Sugestões:
  %-se obtiver uma lista com todas as cidades pode gerar todas as sequências de cidades através da permutação
  %de elementos da lista e para o efeito pode usar o predicado já existente no SWI Prolog
  %permutation(ListaCidades,ListaCidadesPermutada) que terá a capacidade de gerar todas as permutações de
  %ListaCidades. Desse modo não precisará aplicar um método de geração de caminhos visto que o
  %permutation/2 tem essa capacidade. O predicado permutation/2 funciona do seguinte modo:
  %?- permutation([1,2,3],L).
  %L = [1, 2, 3] ;
  %L = [1, 3, 2] ;
  %L = [2, 1, 3] ;
  %L = [2, 3, 1] ;
  %L = [3, 1, 2] ;
  %L = [3, 2, 1] ;
  %false.
  %-guarde num facto dinâmico custo_min(ListaCidadesPermutada,Custo) o menor Custo da melhor lista de
  %cidades permutada ListaCidadesPermutada enquanto os custos das diversas permutações de cidades estão a
  %ser calculados, no final o facto terá a melhor solução.

seq_custo_min(LC,Custo):-(run;true),custo_min(LC,Custo).

run:-
    retractall(custo_min(_,_)),
    assertz(custo_min(_,100000)),
    findall(Cidade,carga(Cidade,_),LC),
    permutation(LC,LCPerm),
    calcula_custo(LCPerm,Custo),
    atualiza(LCPerm,Custo),
    fail.

atualiza(LCPerm,Custo):-
    custo_min(_,CustoMin),
    ((Custo<CustoMin,!,retract(custo_min(_,_)),assertz(custo_min(LCPerm,Custo)),
    write(Custo),nl);true).
