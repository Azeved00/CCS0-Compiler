-module(translator).
-export([main/1]).

%function to replace the Origin of the first transition of a list 
alterTrans(Origin,[{_,Action,Dest}|L]) -> 
    [{Origin,Action,Dest}|L].

main(Ast) -> {Map,Trans,_} = translate(#{},Ast),
             {Map, Trans}. 

updateTab(Map, V) -> case maps:is_key(V, Map) of
                        false ->
                            maps:put(V, maps:size(Map)+1, Map);
                        true -> 
                            Map
                        end.

% the translation logic 
translate(Map, zero) -> {Map, [], {zero,zero}};
translate(Map, {prefix, Action, Process}) -> 
    {Tab, Trans, {_,Initial}} = translate(Map,Process),
    
    NState = {prefix, Action, Process},
    NTab =  updateTab(Tab,NState),
    State = maps:get(NState,NTab),
    
    {NTab,[{State,Action,Initial}] ++ Trans, {NState,State}};
translate(Map, {choise, Process1, Process2}) -> 
    {Tab1, Trans1, {Initial1,_}} = translate(Map,Process1),
    Tab1T = maps:remove(Initial1,Tab1),
    {Tab2, Trans2, {Initial2,_}} = translate(Tab1T,Process2),
    Tab2T = maps:remove(Initial2,Tab2),
    
    NState = {choise, Process1, Process2},
    NTab =  updateTab(Tab2T,NState),
    State = maps:get(NState,NTab),
    NTrans = alterTrans(State,Trans1) ++ alterTrans(State,Trans2),

    {NTab, NTrans, {NState,State}}.

