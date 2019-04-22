* 1 ProductMix 1.gms
* Problema de producción con recursos limitados


VARIABLES

Z;


POSITIVE VARIABLES

X1 , X2;


EQUATIONS

OBJ, R1, R2, R3;

OBJ..    Z =E= 3*X1 + 2*X2;
R1..     2*X1 + X2 =L= 18;
R2..     X1 + 1.5*X2 =L= 21;
R3..     3*X1 + X2 =L= 24;


MODEL ProductMix /all/;


SOLVE ProductMix using LP maximizing Z;
