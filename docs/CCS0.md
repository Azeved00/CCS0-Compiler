# CCS0 Documentation

## Grammar
    
    P ::= 0 | P + P | a.P

where P is a **process**, 0 is the **termination symbol** and a is an **action**.
## Priorities
    
    P + Q + R is ( P + Q ) + R
    a.b.P     is a.(b.P)
    a.P + Q   is (a.P) + Q
    0 can be omited

## Abstract Syntax Tree
1. `0` is `zero`.
1. `action.Process` is `{prefix 'action' 'Process'}`.
1. `Process1 +  Process2` is `{choise 'Process1' 'Process2'}`.
1. Add the `zero` if it was not present in the input.
