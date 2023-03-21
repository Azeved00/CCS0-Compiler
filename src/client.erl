-module(client).
-import(parser, [parse/1]).
-export([getLTS/1,getLTS/2]).

getLTS(Query) ->
    {ok,Tokens,_} = erl_scan:string(Query),
    {ok,AST} = parser:parse(Tokens),
    AST.

getLTS(Server, Query) ->
    {ok,Tokens,_} = erl_scan:string(Query),
    {ok,AST} = parser:parse(Tokens),
    rpc:call(Server,server,getLTS,[AST]).
