*4 MinCostFlow 2
*Problema del flujo capacitado con coste mínimo


SETS
i        nodos       /N1*N5/
j        arcos       /A12, A13, A14, A23, A25, A35, A45/;


PARAMETERS

d(i)     demanda
/N1      -40
N2       -50
N3        0
N4        30
N5        60/

c(j)  coste unitario
/A12      3
A13       7
A14       5
A23       2
A25       1
A35       8
A45       4/

xup(j)   capacidad
/A12      30
A13       10
A14       35
A23       60
A25       30
A35       30
A45       30/;


TABLE
a(i,j)  estructura
         A12      A13      A14      A23      A25      A35      A45
N1       -1       -1       -1        0        0        0        0
N2        1        0        0       -1       -1        0        0
N3        0        1        0        1        0       -1        0
N4        0        0        1        0        0        0       -1
N5        0        0        0        0        1        1        1;


VARIABLES
Z        coste total;

POSITIVE VARIABLES
x(j)     cantidad transportada;

x.up(j) = xup(j);

EQUATIONS
Obj, Balance(i);

Obj..             Z  =E= sum(j,c(j)*x(j)) ;
Balance(i)..      sum(j,a(i,j)*x(j)) =E= d(i);

MODEL MinCostFlow /all/;

SOLVE MinCostFlow using LP minimizing Z
