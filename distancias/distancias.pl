:- consult("consulta.pl").

% Predicado para calcular o tempo de uma viagem de um veículo eléctrico entre diferentes pontos.
% Calcula o tempo de viagem e a lista de pontos onde foram efectuados carregamentos.
% O primeiro e último ponto é encontrado em partida_chegada/1.
% Tem um tempo_carregament/1 em minutos.
% Tem uma autonomia_max/1 em Km.
% calcula_viagem(?ListaLocais,?TempoDeViagem,?ListaDeCarregamentos)

calcula_viagem([],0,[]):-!.
calcula_viagem(L,Tempo,LCarregamentos):-
    partida_chegada(PC),
    append([PC|L],[PC],LCompleta),
    autonomia_max(A),
    calcula(LCompleta,A,Tempo,LCarregamentos).

calcula([_],_,0,[]).
calcula([X,Y|L],Autonomia,Tempo,LC):-
    (distancia_tempo(X,Y,Dist,T);distancia_tempo(Y,X,Dist,T)),
    (
        (
            Autonomia<Dist,!,tempo_carregamento(TC),
            autonomia_max(A), A1 is A-Dist, LC=[X|LCarregou]
        );
        (
            A1 is Autonomia-Dist,TC is 0, TC is 0, LC=LCarregou
        )
    ),
    calcula([Y|L],A1,T1,LCarregou),
    Tempo is T1+TC+T,!.
