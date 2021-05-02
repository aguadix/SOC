* SetPackingA.gms 

FREE VARIABLE
Z   '$';

BINARY VARIABLE
x1, x2, x3, x4, x5, x6  'if project is performed = 1, else 0';

EQUATION
OBJ '$',
I12, I24, I25, I45, I56 '-';

OBJ.. 1*x1 + 3*x2 + 1*x3 + 1*x4 + 2*x5 + 1*x6 =E= Z;

I12..   x1 +   x2                             =L= 1;
I24..          x2        +   x4               =L= 1;
I25..          x2               +   x5        =L= 1;
I45..                        x4 +   x5        =L= 1;
I56..                               x5 +   x6 =L= 1;

MODEL SetPackingA /all/;

SOLVE SetPackingA USING MIP MAXIMIZING Z;