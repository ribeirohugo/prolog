:- consult("consulta.pl").

% Predicado encontra_voos(Origem,Destino,T,L), onde T é o
% instante de tempo a partir do qual o passageiro consegue aceder à zona de
% embarque/desembarque do aeroporto (também em minutos a partir das 0:00).
% Retorna as diferentes listas com os possíveis voos da origem ao destino.
encontra_voos(Origem,Destino,T,L):-encontra_voos2(Origem,Destino,[Origem],T,L).

encontra_voos2(X,X,_,_,[]):-!.
encontra_voos2(Origem,Destino,L,T,[ID|LV]):-
    voo(ID,Origem,X,TPartida,TChegada),
    tempo_chegada(TEmbarque),
    TLimite is T+TEmbarque,TPartida>=TLimite,
    not(member(X,L)),
    encontra_voos2(X,Destino,[X|L],TChegada,LV).

% Predicado que encontra todas as alternativas de voo entre a origem O e o destino D a partir do instante T gerando uma
% lista LL, em que as listas internas são possibilidades de voos usadas.
todas_alternativas_voo(Origem,Destino,T,LL):-findall(L,encontra_voos(Origem,Destino,T,L),LL).

% Predicado que encontra o voo que chega mais cedo ao destino pretendido, dentro de todos os possíveis.
chega_mais_cedo(Origem,Destino,T,L):-todas_alternativas_voo(Origem,Destino,T,[X|LL]),mais_cedo(LL,X,L).

mais_cedo([],X,X).
mais_cedo([X|LL],Y,Z):-
    ultimo(X,X1),
    ultimo(Y,Y1),
    voo(X1,_,_,_,T1),
    voo(Y1,_,_,_,T2),
    T2<T1,!,
    mais_cedo(LL,Y,Z).

mais_cedo([_|LL],Y,Z):-
    mais_cedo(LL,Y,Z).

ultimo([X],X).
ultimo([_,L],X):-ultimo(L,X).

% Predicado que gera uma lista com a viagem onde haja menor ligação de voos.
menos_ligacoes(Origem,Destino,T,L):-
    todas_alternativas_voo(Origem,Destino,T,[X|LL]),
    ligacoes(LL,X,L).

ligacoes([],X,X):-!.
ligacoes([X|LL],Y,L):-
    length(X,X1),
    length(Y,Y1),
    X1>Y1,!,
    ligacoes(LL,Y,L).
ligacoes([X|LL],_,L):-
    ligacoes(LL,X,L).



