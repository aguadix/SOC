*1 ProductMix 1
*Problema de producción con recursos limitados

VARIABLES
Z;

POSITIVE VARIABLES
X1 , X2;

EQUATIONS
OBJ, E1, E2, E3;

OBJ..    Z =E= 3*X1 + 2*X2;
E1..     2*X1 + X2 =L= 18;
E2..     X1 + 1.5*X2 =L= 21;
E3..     3*X1 + X2 =L= 24;

MODEL ProductMix1 /all/;

SOLVE ProductMix1 using LP maximizing Z;
