# Prolog

Este repositório tem como objectivo reunir predicados e excertos de código em Prolog.

## Predicados

Os predicados de PROLOG estão disponíveis nos seguindes ficheiros:
* ``predicados.pl`` - predicados comuns/genéricos de PROLOG.
* ``problemas.pl`` - resolução de alguns problemas através de predicados.
* ``cargas/cargas.pl`` - resolução de problema de cargas através de predicados.
* ``covid/covid.pl`` - resolução de problema de covid através de predicados.
* ``distancias/distancias.pl`` - resolução de problema de viagens através de predicados.
* ``voos/voos.pl`` - resolução de problema de voos através de predicados.

Para correr os predicados, basta correr o seguinte comando (alterando pelo respectivo nome de ficheiro):
``swipl predicados.pl``.

## Testes

Os testes estão disponíveis nos ficheiros  ``predicados_test.pl`` e ``problemas_test.pl``.

De modo a correr os testes, utiliza os seguintes comandos (alterando pelo respectivo nome de ficheiro):
``swipl -g run_tests -t halt predicados_test.pl``.
