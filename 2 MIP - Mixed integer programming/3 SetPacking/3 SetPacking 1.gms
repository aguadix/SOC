* 3 SetPacking 1.gms
*Problema del empaquetamiento


VARIABLES

Z;


BINARY VARIABLES

X1, X2, X3, X4, X5, X6;


EQUATIONS

OBJ, S12, S24, S25, S45, S56;

OBJ.. Z =E= 1000*X1 + 3000*X2 + 1000*X3 + 1000*X4 + 2000*X5 + 1000*X6;
S12.. X1 + X2 =L= 1;
S24.. X2 + X4 =L= 1;
S25.. X2 + X5 =L= 1;
S45.. X4 + X5 =L= 1;
S56.. X5 + X6 =L= 1;


MODEL SetPacking /all/;


SOLVE SetPacking using MIP maximizing Z;
