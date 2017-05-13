* 1 Knapsack 2.gms
* Problema de la mochila


SETS

i / Y1 * Y3 /
j / P1 * P5 /;


PARAMETERS

l(i)
/Y1   20
Y2    23
Y3    25/

b(j)
/P1  20
P2   40
P3   20
P4   15
P5   30/;


TABLE

c(i,j)
         P1      P2      P3      P4      P5
Y1        5       4       3       7       8
Y2        1       7       9       4       6
Y3        8      10       2       1      10;


VARIABLES

Z


BINARY VARIABLES

x(j)


EQUATIONS

OBJ, R(i);

OBJ..       Z =E= sum(j,b(j)*x(j)) ;
R(i)..      sum(j,c(i,j)*x(j)) =L= l(i) ;


MODEL Knapsack /all/;


SOLVE Knapsack using MIP maximizing Z;
