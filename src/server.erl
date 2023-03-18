-module(server).
-export([start/0,factorial/2,stop/1]).

-type ast() :: {prefix, string(), ast()} | {choise, ast(), ast()}.

%1)
%função factorial
compute_factorial(1) -> 1;
compute_factorial(N) -> N * compute_factorial(N-1).

start() -> spawn(fun() -> loop(0) end).

factorial(Server, M) ->
    Ref = make_ref(),
    % enviar um request ao server
    Server ! {factorial, self(), Ref, M}, % espera pela resposta e retorna-a
    receive {response, Ref, Result} -> Result end.

%2)

loop(N) -> 
    receive
        % comando factorial 
        {factorial, From, Ref, M} ->
            From! {response, Ref, compute_factorial(M)}, loop(N+1);
        % comando status
        {status, From, Ref} ->
            From ! {response, Ref, N},
            loop(N);
        {stop, _, _} -> ok
   end.

  stop(Server) ->
    Server ! {stop, self()},
    ok.


