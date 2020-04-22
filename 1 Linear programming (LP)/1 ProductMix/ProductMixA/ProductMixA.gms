* ProductMixA.gms
* Problema de producci�n con recursos limitados


VARIABLES

Z;


POSITIVE VARIABLES

X1 , X2;


EQUATIONS

OBJ, Rd1, Rd2, Rd3;

OBJ..   Z =E= 3*X1 + 2*X2;
Rd1..   2.0*X1 + 1.0*X2 =L= 18;
Rd2..   1.0*X1 + 1.5*X2 =L= 21;
Rd3..   3.0*X1 + 1.0*X2 =L= 24;


MODEL ProductMixA /all/;


SOLVE ProductMixA using LP maximizing Z;
