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
