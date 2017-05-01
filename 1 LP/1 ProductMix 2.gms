*1 ProductMix 2.gms
*Problema de producción con recursos limitados


SETS

i        /E1, E2, E3/
j        /P1, P2/;


PARAMETERS

c(j)
/P1       3
P2        2/

b(i)
/E1       18
E2        21
E3        24/;


TABLE

a(i,j)
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

OBJ..       Z  =E= sum(j,c(j)*x(j)) ;
R(i)..      sum(j,a(i,j)*x(j)) =L= b(i);


MODEL ProductMix /all/;


SOLVE ProductMix using LP maximizing Z;
