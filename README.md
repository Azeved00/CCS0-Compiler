# CCS0-Compiler

## Description
A Server &amp; a compiler to compile CCS0 to LTS

## Compiling & Running

### Initiating the server

To start using the program first you set up the Server using :

	$ erl -name server_name
	(server_name@host)1> c(server).
	(server_name@host)2> server:start().
	
### Initiating and using the client

To start using the program first you set up the Server using :

	$ erl -name client_name
	(client_name@host)1> c(client).
	(client_name@host)2> client:getLTS('server_name@host', CCS0_Expression).

## Example
In the server

	$ erl -name gandalf
	(gandalf@myhost)1> c(server).
	(gandalf@myhost)2> server:start().
	
In the client
	
	$ erl -name bilbo
	(bilbo@host)1> c(client).
	(bilbo@host)2> client:getLTS('gandalf@myhost', "a.b.0").
