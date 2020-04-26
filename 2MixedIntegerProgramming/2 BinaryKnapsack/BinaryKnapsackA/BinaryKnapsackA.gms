* BinaryKnapsackA.gms
* Problema de la mochila


FREE VARIABLES

Z;


BINARY VARIABLES

X1,X2, X3, X4, X5, X6, X7, X8, X9, X10;


EQUATIONS

OBJ 'función objetivo',
R1  'restricción';

OBJ..
Z =E= 
23*X1+
79*X2+
35*X3+
54*X4+
13*X5+
83*X6+
86*X7+
57*X8+
28*X9+
11*X10;

R1..
72*X1+
99*X2+
68*X3+
22*X4+
44*X5+
72*X6+
34*X7+
57*X8+
35*X9+
51*X10 =L= 250;


MODEL KnapsackA /all/;


SOLVE KnapsackA using MIP maximizing Z;
