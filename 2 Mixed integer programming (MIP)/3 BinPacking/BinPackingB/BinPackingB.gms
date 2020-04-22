* BinPackingB.gms
* Problema de empaquetamiento

SETS
i        objetos            / O1 * O10 /
j        cajas              / C1 * C6 /;

PARAMETERS

w(i)  peso
/O1   1
O2    1
O3    2
O4    2
O5    4
O6    4
O7    5
O8    6
O9    7
O10   8/;

SCALAR
V capacidad de cada caja  /10/ ;



VARIABLES
N        número de cajas usadas;

BINARY VARIABLES
x(i,j)     ¿se mete el objeto i en la caja j?
y(j)       ¿se usa la caja j?;

EQUATIONS
Obj, Asigna(i), Cap(j);

Obj..        N =E= sum(j,y(j)) ;
Asigna(i)..  sum(j,x(i,j)) =E= 1 ;
Cap(j)..     sum(i,w(i)*x(i,j)) =L= V*y(j);

MODEL BinPackingA /all/;

SOLVE BinPackingA using MIP minimizing N;
