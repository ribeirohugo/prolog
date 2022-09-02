% locais possíveis
locais([faculdade,trabalho,parque,biblioteca,cafe,restaurante]).

% local de partida e de chegada
partida_chegada(casa).

% tempo de carregamento em minutos
tempo_carregamento(30).

% autonomia máxima em Km
autonomia_max(120).

% distancia-tempo entre locais dois locais (1º e 2º argumentos)
% o 3º argumento representa a distância em Km e o 4º representa o tempo em minutos
distancia_tempo(casa,faculdade,4,20).
distancia_tempo(casa,trabalho,2,5).
distancia_tempo(casa,parque,3,10).
distancia_tempo(casa,biblioteca,2,5).
distancia_tempo(casa,cafe,58,45).
distancia_tempo(casa,restaurante,31,38).
distancia_tempo(faculdade,trabalho,5,20).
distancia_tempo(faculdade,parque,6,25).
distancia_tempo(faculdade,biblioteca,4,20).
distancia_tempo(faculdade,cafe,60,55).
distancia_tempo(faculdade,restaurante,34,48).
distancia_tempo(parque,biblioteca,5,10).
distancia_tempo(parque,cafe,1,2).
distancia_tempo(parque,restaurante,59,45).
distancia_tempo(parque,trabalho,30,36).
distancia_tempo(biblioteca,restaurante,5,10).
distancia_tempo(biblioteca,cafe,60,47).
distancia_tempo(biblioteca,trabalho,32,38).
distancia_tempo(cafe,restaurante,59,45).
distancia_tempo(cafe,trabalho,30,36).
distancia_tempo(trabalho,restaurante,70,55).
