# CCS0 Documentation

## Grammar
    
    P ::= 0 | P + P | a.P

where P is a **process**, 0 is the **termination symbol** and a is an **action**.
## Priorities
    
    P + Q + R is ( P + Q ) + R
    a.b.P     is a.(b.P)
    a.P + Q   is (a.P) + Q
    0 can be omited

## Transforming to LTS
1. `0` becomes `zero`
2. `action.Process` becomes `{prefix 'action' 'Process'}`
3. `Process1 +  Process2` becomes `{choise 'Process1' 'Process2'}`
4. Add the `zero` if it was not present in the input
