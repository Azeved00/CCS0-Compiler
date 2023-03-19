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

newPrefix(A,State) -> atom_to_list(A) ++ "." ++ State.
newChoise(State1,State2) -> State1 ++ " + " ++ State2.

translate(zero) -> {["zero"],[],"zero"};
translate({prefix, Action, Process}) -> 
    {States, Trans, Initial} = translate(Process),
    
    NState = newPrefix(Action,Initial),
    
    {addStates(States,[NState]), 
     Trans ++ [{NState,Action,Initial}], 
     NState};
translate({choise, Process1, Process2}) -> 
    {States1, Trans1, Initial1} = translate(Process1),
    {States2, Trans2, Initial2} = translate(Process2),
    
    NState = newChoise(Initial1,Initial2),
    
    {addStates(States1,States2), 
     Trans1 ++ Trans2, 
     NState}.
