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
