*2 Transport 2
*Problema del transporte

SETS
i        fábricas  / F1*F3 /
j        mercados  / M4*M7 /;

PARAMETERS
o(i)       oferta
/F1       15
F2        25
F3        10/

d(j)      demanda
/M4        5
M5        15
M6        15
M7        15/;

TABLE
c(i,j)    coste unitario
          M4      M5      M6      M7
F1        10       2      20      11
F2        12       7       9      20
F3         4      14      16      18;

VARIABLES
Z        coste total ;

POSITIVE VARIABLES
x(i,j)   cantidad transportada;

EQUATIONS
Obj, Oferta(i), Demanda(j);

Obj ..         Z  =E=  sum((i,j), c(i,j)*x(i,j)) ;

Oferta(i) ..   sum(j, x(i,j))  =E=  o(i) ;

Demanda(j) ..  sum(i, x(i,j))  =E=  d(j) ;


MODEL Transport /all/ ;

SOLVE Transport using LP minimizing Z;
