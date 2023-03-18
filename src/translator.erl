-module(translator).
-export([translate/1]).

% the ast of CCS0
-type ast() ::  {prefix, string(),ast()} |
                {choise, ast(), ast()}  |
                zero.

% a transition from s to s' with action a
-type trans() :: {string(),string(),string()}.
% The Lts System
-type lts() :: {[string()],[trans()],string()}.

newState(A,State) -> [A] ++ [State].

translate(zero) -> {['zero'],[],'zero'};
translate({prefix, Action, Process}) -> 
    {States, Trans, Initial} = translate(Process),
    
    NState = newState(Action,Initial),
    
    {States ++ [NState], 
     Trans ++ [{NState,Action,Initial}], 
     NState};
translate({choise, X, Y}) -> 
    X.
