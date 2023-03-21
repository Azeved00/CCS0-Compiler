# CCS0-Compiler

## Description
A Server &amp; a compiler to compile CCS0 to LTS

## Compiling & Running

### Initiating the server

To start using the program first you set up the Server using :

	$ erl -sname server_name
	(server_name@host)1> c(server).
	(server_name@host)2> server:start().
	
### Initiating and using the client

To start using the program first you set up the Server using :

	$ erl -sname client_name
	(client_name@host)1> c(client).
	(client_name@host)2> client:getLTS('server_name@host', CCS0_Expression).

## Example
In the server

	$ erl -sname gandalf
	(gandalf@myhost)1> c(server).
	(gandalf@myhost)2> server:start().
	
In the client
	
	$ erl -sname bilbo
	(bilbo@host)1> c(client).
	(bilbo@host)2> client:getLTS('gandalf@myhost', "a.b.0").
	
## Other Notes

It is possible use the client and the server in the same terminal,

It is also possible to get the CCS0 AST that the client Generates using the command
	
	client:getAST(ccs0_term).
	
The `ccs0_term` being a `string`.
