* BinaryKnapsackB.gms
* Problema de la mochila


SETS

i 'pepe gotera' / O1 * O10/;


PARAMETERS

w(i)
/O1 72
O2 99
O3 68
O4 22
O5 44
O6 72
O7 34
O8 57
O9 35
O10 51/

v(i)
/O1 23
O2 79
O3 35
O4 54
O5 13
O6 83
O7 86
O8 57
O9 28
O10 11/;


SCALAR

wt /250/;



VARIABLES

Z;


BINARY VARIABLES

x(i);


EQUATIONS

OBJ, R;

OBJ..
Z =E= sum(i,v(i)*x(i)) ;

R..
sum(i,w(i)*x(i)) =L= wt;


MODEL KnapsackB /all/;


SOLVE KnapsackB using MIP maximizing Z;
