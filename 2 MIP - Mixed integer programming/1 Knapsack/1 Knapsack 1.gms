* 1 Knapsack 1.gms
* Problema de la mochila


VARIABLES

Z;


BINARY VARIABLES

X1, X2, X3, X4, X5;


EQUATIONS

OBJ, R1, R2, R3;

OBJ..    Z =E= 20*X1 + 40*X2 + 20*X3 + 15*X4 + 30*X5;

R1..     5*X1 +  4*X2 +  3*X3 +  7*X4 +   8*X5 =L= 20;
R2..     1*X1 +  7*X2 +  9*X3 +  4*X4 +   6*X5 =L= 23;
R3..     8*X1 + 10*X2 +  2*X3 +  1*X4 +  10*X5 =L= 25;


MODEL Knapsack /all/;


SOLVE Knapsack using MIP maximizing Z;
