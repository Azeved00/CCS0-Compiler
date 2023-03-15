# 1st Project for PC

## Description
Write a program in Erlang to translate CCS0 to LTS.

## Important
1. (12,5) 
Write a function with a CCS0 AST as input and LTS as output.
    term a.0 + b.0 can be represented by the ast  {choice {prefix 'a' zero} {prefix &#180;b&#180; zero}}.

2. (5) 
Make a server that uses the above function.

3. (2,5) 
Write a parser that converts a CCS0 term to it's AST and sends it to the server.
Implement the parser directly or use an Erlang parser generator (ex: https://www.erlang.org/doc/man/yecc.html)

## Entrega e Apresentação do Trabalho:

O trabalho deve ser enviado (juntamente com um pequeno README que explique a utilização) para amflorid@fc.up.pt até às *** 13:00 do dia 21 de Março 2023 ***, com o subject: PC-Trabalho 1.

Os alunos têm que fazer uma breve apresentação do trabalho que será feita na aula teórica de dia 22 de Março ou na aula prática de 23 de Março (a partir das 11:30).

O trabalho deve ser feito em grupos de dois alunos ou individualmente.
