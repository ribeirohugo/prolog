concelhos_vizinhos(porto,matosinhos).
concelhos_vizinhos(porto,vila_nova_de_gaia).
concelhos_vizinhos(porto,maia).
concelhos_vizinhos(porto,gondomar).
concelhos_vizinhos(vila_nova_de_gaia,espinho).
concelhos_vizinhos(vila_nova_de_gaia,gondomar).
concelhos_vizinhos(vila_nova_de_gaia,santa_maria_da_feira).
concelhos_vizinhos(matosinhos,maia).
concelhos_vizinhos(matosinhos,vila_do_conde).
concelhos_vizinhos(maia,vila_do_conde).
concelhos_vizinhos(maia,trofa).
concelhos_vizinhos(maia,valongo).
concelhos_vizinhos(vila_do_conde,povoa_do_varzim).
concelhos_vizinhos(trofa,santo_tirso).
concelhos_vizinhos(santo_tirso,valongo).
concelhos_vizinhos(valongo,paredes).
concelhos_vizinhos(valongo,gondomar).
concelhos_vizinhos(gondomar,paredes).
concelhos_vizinhos(gondomar,santa_maria_da_feira).
concelhos_vizinhos(espinho,santa_maria_da_feira).
concelhos_vizinhos(santa_maria_da_feira,sao_joao_da_madeira).
concelhos_vizinhos(sao_joao_da_madeira,oliveira_de_azemeis).
concelhos_vizinhos(santa_maria_da_feira,oliveira_de_azemeis).
concelhos_vizinhos(arouca,santa_maria_da_feira).
concelhos_vizinhos(vale_de_cambra,arouca).
concelhos_vizinhos(oliveira_de_azemeis,vale_de_cambra).

risco_covid(povoa_do_varzim,extremo).
risco_covid(vila_do_conde,extremo).
risco_covid(porto,muito_elevado).
risco_covid(maia,elevado).
risco_covid(matosinhos,muito_elevado).
risco_covid(trofa,muito_elevado).
risco_covid(santo_tirso,muito_elevado).
risco_covid(valongo,muito_elevado).
risco_covid(paredes,muito_elevado).
risco_covid(vila_nova_de_gaia,muito_elevado).
risco_covid(gondomar,muito_elevado).
risco_covid(espinho,elevado).
risco_covid(santa_maria_da_feira,elevado).
risco_covid(sao_joao_da_madeira,moderado).
risco_covid(oliveira_de_azemeis,muito_elevado).
risco_covid(arouca,elevado).
risco_covid(vale_de_cambra,elevado).

niveis_risco([moderado,elevado,muito_elevado,extremo]).
