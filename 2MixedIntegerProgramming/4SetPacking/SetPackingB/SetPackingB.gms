* SetPackingB.gms

SET

i        /I12, I24, I25, I45, I56/
p        /P1*P6/;

PARAMETERS

b(p) /P1 1, P2 3, P3 1, P4 1, P5 2, P6 1/;


TABLE
a(i,p)
           P1       P2       P3       P4       P5       P6
I12        1        1        0        0        0        0
I24        0        1        0        1        0        0
I25        0        1        0        0        1        0
I45        0        0        0        1        1        0
I56        0        0        0        0        1        1;


FREE VARIABLE
Z;

BINARY VARIABLES
x(p);

EQUATIONS
OBJ,
R(i);

OBJ..     SUM(p,b(p)*x(p))   =E= Z;
R(i)..    SUM(p,a(i,p)*x(p)) =L= 1;

MODEL SetPackingB /all/;

SOLVE SetPackingB USING MIP MAXIMIZING Z;
