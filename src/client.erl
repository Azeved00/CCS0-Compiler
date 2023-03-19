-module(client).
-export([translate/2]).


translate(Server, Query) ->
    rpc:call(Server,server,translate,[Query]).
