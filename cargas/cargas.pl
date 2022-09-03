:- consult("consulta.pl").

% Predicado para visitar cidades, criar uma lista da carga decremental do transporte e retornar o somatório dos pesos
% no 3º argumento.
% carga(Cidade,Carga)
soma_pesos([],[],0):-!.
soma_pesos([_],[X],X):-!.
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
