Nonterminals proc.
Terminals atom integer '(' ')' '+' '.'.
Rootsymbol proc.


proc -> atom '.' proc           : {prefix, value_of('$1'), '$3'}.
proc -> proc '+' proc           : {choise, '$1', '$3'}.
proc -> integer                 : zero.
proc -> atom                    : {prefix, value_of('$1'), zero}.
proc -> '(' proc ')'            : '$2'.

Erlang code.
value_of(Token) -> element(3,Token).
