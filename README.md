# CCS0-Compiler

## Description
A Server &amp; a compiler to compile CCS0 to LTS

## Compiling & Running
### Compiling And Starting the server

	c(server).
	register(serveralias, server:start()).
	
You can chose the `serveralias` freely
 
### Querying the server

 	server:translate(serveralias, AST).

if you changed `serveralias` in the previous command don't forget to also change it in this command.

### Example

	server:translate(serveralias, {choise, {prefix, 'a', {prefix, 'b', zero}}, {prefix, 'c', zero}}.
