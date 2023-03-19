-module(client).
-export([getLTS/2]).


getLTS(Server, Query) ->
    rpc:call(Server,server,getLTS,[Query]).
