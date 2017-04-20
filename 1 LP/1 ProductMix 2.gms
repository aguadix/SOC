*1 ProductMix 2
*Problema de producción con recursos limitados

SETS
i        equipos         /E1, E2, E3/
j        productos       /P1, P2/;


PARAMETERS
b(j)     beneficio unitario
/P1       3
P2        2/

d(i)     disponibilidad
/E1       18
E2        21
E3        24/;

TABLE
u(i,j)    uso
           P1      P2
E1         2       1
E2         1       1.5
E3         3       1;

VARIABLES
Z        beneficio total;

POSITIVE VARIABLES
x(j)     cantidad producida;

EQUATIONS
Obj, Disponibilidad(i) ;

Obj..                    Z  =E= sum(j,b(j)*x(j)) ;
Disponibilidad(i)..      sum(j,u(i,j)*x(j)) =L= d(i);

MODEL ProductMix /all/;

SOLVE ProductMix using LP maximizing Z;
