* SetPackingB.gms
* Problema del empaquetamiento de conjunto



SETS

i        /S12, S24, S25, S45, S56/
j        /P1*P6/;


PARAMETERS

b(j)
/P1      1000
P2       3000
P3       1000
P4       1000
P5       2000
P6       1000/;


TABLE

a(i,j)
           P1       P2       P3       P4       P5       P6
S12        1        1        0        0        0        0
S24        0        1        0        1        0        0
S25        0        1        0        0        1        0
S45        0        0        0        1        1        0
S56        0        0        0        0        1        1;


VARIABLES

Z;


BINARY VARIABLES

x(j);


EQUATIONS

OBJ, R(i);

OBJ..     Z  =E= sum(j,b(j)*x(j));
R(i)..    sum(j,a(i,j)*x(j)) =L= 1;


MODEL SetPackingB /all/;


SOLVE SetPackingB using MIP maximizing Z;
