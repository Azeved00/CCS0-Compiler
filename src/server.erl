-module(server).
-import(translator, [translate/1]).
-export([start/0,getLTS/1,stop/0]).


-type ast() :: {prefix, string(), ast()} | {choice, ast(), ast()}.


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
        % comando translate
        {translate, From, Ref, M} ->
            From! {response, Ref, translator:main(M)}, loop(N+1);
        {stop, _, _} -> ok
   end.




