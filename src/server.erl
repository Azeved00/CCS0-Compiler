-module(server).
-import(translator, [translate/1]).
-export([start/0,getLTS/1,stop/0]).


-type ast() :: {prefix, string(), ast()} | {choise, ast(), ast()}.


start() -> register(server, spawn(fun() -> loop(0) end)).

getLTS(M) ->
    Ref = make_ref(),
    % enviar um request ao server
    server ! {translate, self(), Ref, M}, % espera pela resposta e retorna-a
    receive {response, Ref, Result} -> Result end.

stop() ->
    server ! {stop, self()},
    ok.

loop(N) -> 
    receive
        % comando factorial 
        {translate, From, Ref, M} ->
            From! {response, Ref, translator:translate(M)}, loop(N+1);
        % comando status
        {status, From, Ref} ->
            From ! {response, Ref, N},
            loop(N);
        {stop, _, _} -> ok
   end.




