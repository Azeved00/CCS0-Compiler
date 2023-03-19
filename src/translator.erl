-module(translator).
-export([start/0, translate/1]).

% the ast of CCS0
-type ast() ::  {prefix, atom(),ast()} |
                {choise, ast(), ast()}  |
                zero.

% a transition from s to s' with action a
-type trans() :: {string(),atom(),string()}.
% The Lts System
-type lts() :: {[string()],[trans()],string()}.


start() ->
    translate({choise, 
               {prefix,'strike',{prefix, 'extinguish', zero}},
               {prefix,'teta', zero}}).

%function to add a state if it doesnt exist in the states list
addStates(S1,S2) -> 
    lists:usort(S1++S2).

%function to replace the Origin of the first transition of a list 
alterTrans(Origin,[{_,Action,Dest}|L]) -> 
    [{Origin,Action,Dest}|L].

% helper function to create States
newPrefix(A,State) -> atom_to_list(A) ++ "." ++ State.
newChoise(State1,State2) -> State1 ++ " + " ++ State2.

% the translation logic 
translate(zero) -> {["zero"],[],"zero"};
translate({prefix, Action, Process}) -> 
    {States, Trans, Initial} = translate(Process),
    
    NState = newPrefix(Action,Initial),
    
    {addStates(States,[NState]), 
     [{NState,Action,Initial}] ++ Trans, 
     NState};
translate({choise, Process1, Process2}) -> 
    {States1, Trans1, Initial1} = translate(Process1),
    {States2, Trans2, Initial2} = translate(Process2),
    
    NState = newChoise(Initial1,Initial2),
    NTrans = alterTrans(NState,Trans1) ++ alterTrans(NState,Trans2),

    {addStates(States1,States2), 
     NTrans, 
     NState}.
