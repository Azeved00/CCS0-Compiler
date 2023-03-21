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
    
    {NTab,[{State,Action,Initial}] ++ Trans, State};
translate(Map, {choise, Process1, Process2}) -> 
    {Tab1, Trans1, {Initial,_}} = translate(Map,Process1),
    Tab1T = maps:remove(Tab1,Initial),
    {Tab2, Trans2, {Initial,_}} = translate(Tab1T,Process2),
    Tab2T = maps:remove(Tab2,Initial),
    
    NState = {choise, Process1, Process2},
    NTab =  updateTab(Tab2T,NState),
    State = maps:get(NState,NTab),
    NTrans = alterTrans(State,Trans1) ++ alterTrans(State,Trans2),

    {NTab, NTrans, State}.

