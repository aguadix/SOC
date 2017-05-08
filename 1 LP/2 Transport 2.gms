*2 Transport 2.gms
*Problema del transporte


SETS

i        / F1*F3 /
j        / M1*M4 /;


PARAMETERS

o(i)
/F1       15
F2        25
F3        10/

d(j)
/M1        5
M2        15
M3        15
M4        15/;


TABLE

c(i,j)
          M1      M2      M3      M4
F1        10       2      20      11
F2        12       7       9      20
F3         4      14      16      18;


VARIABLES

Z;


POSITIVE VARIABLES

x(i,j);


EQUATIONS

OBJ, Ro(i), Rd(j);

OBJ ..     Z  =E=  sum((i,j), c(i,j)*x(i,j)) ;
Ro(i) ..   sum(j, x(i,j))  =E=  o(i) ;
Rd(j) ..   sum(i, x(i,j))  =E=  d(j) ;


MODEL Transport /all/ ;


SOLVE Transport using LP minimizing Z;
