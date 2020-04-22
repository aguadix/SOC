* ProductMixB.gms
* Problema de producci�n con recursos limitados


SETS

i        /E1, E2, E3/
j        /P1, P2/;


PARAMETERS

d(i)
/E1       18
E2        21
E3        24/

b(j)
/P1       3
P2        2/;


TABLE

u(i,j)
           P1      P2
E1         2       1
E2         1       1.5
E3         3       1;


VARIABLES

Z;


POSITIVE VARIABLES

x(j);


EQUATIONS

OBJ, R(i) ;

OBJ..       Z  =E= sum(j,b(j)*x(j)) ;
R(i)..      sum(j,u(i,j)*x(j)) =L= d(i);


MODEL ProductMixB /all/;


SOLVE ProductMixB using LP maximizing Z;
