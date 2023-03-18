# 1st Project for PC

## Description
Write a program in Erlang to translate CCS0 to LTS.

## TODO
1. 
Write a function with a CCS0 term as input and returns an LTS AST as output.
```
    input : a.0 + b.0 
    output: {choice {prefix 'a' zero} {prefix 'b' zero}}.
```
2.
Make a server that uses the above function.

3. 
Write a parser that converts a CCS0 term to it's AST and sends it to the server.
Implement the parser directly or use an Erlang parser generator (ex: https://www.erlang.org/doc/man/yecc.html)
