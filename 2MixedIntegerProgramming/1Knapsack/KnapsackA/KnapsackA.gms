* KnapsackA.gms

FREE VARIABLE
Z   '$/week';

INTEGER VARIABLE
*BINARY VARIABLES
x1,x2, x3, x4, x5, x6, x7, x8, x9, x10  'batch/week';
x1.up = 4; x2.up = 5; x3.up = 4; x4.up = 2; x5.up = 3; x6.up = 2; x7.up = 2; x8.up = 2; x9.up = 1; x10.up = 5;

EQUATION
OBJ '$/week', RMT 'ton/week';
OBJ..   23*x1 + 79*x2 + 35*x3 + 54*x4 + 13*x5 + 83*x6 + 86*x7 + 57*x8 + 28*x9 + 11*x10 =E= Z;
RMT..   72*x1 + 99*x2 + 68*x3 + 22*x4 + 44*x5 + 72*x6 + 34*x7 + 57*x8 + 35*x9 + 51*x10 =L= 250;

MODEL KnapsackA /all/;

SOLVE KnapsackA USING MIP MAXIMIZING Z;