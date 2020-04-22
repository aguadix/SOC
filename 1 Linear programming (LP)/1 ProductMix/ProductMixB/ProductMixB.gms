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
E1         2.0     1.0
E2         1.0     1.5
E3         3.0     1.0;


VARIABLES

Z;


POSITIVE VARIABLES

x(j);


EQUATIONS

OBJ, Rd(i) ;

OBJ..    Z  =E= sum(j,b(j)*x(j)) ;
Rd(i)..  sum(j,u(i,j)*x(j)) =L= d(i);


MODEL ProductMixB /all/;


SOLVE ProductMixB using LP maximizing Z;
