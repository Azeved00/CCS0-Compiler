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
    translate({prefix,'strike',{prefix, 'extinguish', zero}}).


newState(A,State) -> atom_to_list(A) ++ "." ++ State.

translate(zero) -> {["zero"],[],"zero"};
translate({prefix, Action, Process}) -> 
    {States, Trans, Initial} = translate(Process),
    
    NState = newState(Action,Initial),
    
    {States ++ [NState], 
     Trans ++ [{NState,Action,Initial}], 
     NState};
translate({choise, X, Y}) -> 
    X.
