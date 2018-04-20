* 2 SetCover 2.gms
*Problema de la cobertura


SETS

i        /N1*N6/
j        /A12, A14, A23, A24, A25, A35, A36, A45/;


PARAMETERS

c(i)
/N1      6
N2       5
N3       4
N4       3
N5       2
N6       1/;


TABLE

a(i,j)
          A12      A14      A23      A24      A25        A35      A36      A45
N1        1        1        0        0        0          0        0        0
N2        1        0        1        1        1          0        0        0
N3        0        0        1        0        0          1        1        0
N4        0        1        0        1        0          0        0        1
N5        0        0        0        0        1          1        0        1
N6        0        0        0        0        0          0        1        0;


VARIABLES

Z;


BINARY VARIABLES

x(i);


EQUATIONS

OBJ, R(j);
OBJ..     Z  =E= SUM(i,c(i)*x(i)) ;
R(j)..    SUM(i,a(i,j)*x(i)) =G= 1;


MODEL SetCover /all/;


SOLVE SetCover using MIP minimizing Z;