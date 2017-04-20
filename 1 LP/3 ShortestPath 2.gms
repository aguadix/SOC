*3 ShortestPath 2
*Problema de la ruta más corta


SETS
i        nodos       /N1*N5/
j        arcos       /A12, A13, A23, A24, A34, A35, A45/;


PARAMETERS

d(i)     demanda
/N1      -1
N2        0
N3        0
N4        0
N5        1/

c(j)  coste unitario
/A12      20
A13       30
A23       20
A24       30
A34       10
A35       70
A45       50/;


TABLE
a(i,j)  estructura
         A12      A13      A23      A24      A34      A35      A45
N1       -1       -1        0        0        0        0        0
N2        1        0       -1       -1        0        0        0
N3        0        1        1        0       -1       -1        0
N4        0        0        0        1        1        0       -1
N5        0        0        0        0        0        1        1    ;


VARIABLES
Z        coste total;

POSITIVE VARIABLES
x(j)     cantidad transportada;


EQUATIONS
Obj, Balance(i);

Obj..             Z  =E= sum(j,c(j)*x(j)) ;
Balance(i)..      sum(j,a(i,j)*x(j)) =E= d(i);

MODEL ShortestPath /all/;

SOLVE ShortestPath using LP minimizing Z;
