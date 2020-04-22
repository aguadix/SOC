* AssignmentA.gms
* Problema de la  asignación


VARIABLES

Z;


POSITIVE VARIABLES

X11, X12, X13, X14,
X21, X22, X23, X24,
X31, X32, X33, X34,
X41, X42, X43, X44;


EQUATIONS

OBJ, P1, P2, P3, P4, F1, F2, F3, F4;

OBJ..    Z =E=   1*X11 + 4*X12 +  6*X13 + 3*X14 +
                 9*X21 + 7*X22 + 10*X23 + 9*X24 +
                 4*X31 + 5*X32 + 11*X33 + 7*X34 +
                 8*X41 + 7*X42 +  8*X43 + 5*X44;

P1..     X11 + X12 + X13 + X14 =E= 1;
P2..     X21 + X22 + X23 + X24 =E= 1;
P3..     X31 + X32 + X33 + X34 =E= 1;
P4..     X41 + X42 + X43 + X44 =E= 1;

F1..     X11 + X21 + X31 + X41 =E= 1;
F2..     X12 + X22 + X32 + X42 =E= 1;
F3..     X13 + X23 + X33 + X43 =E= 1;
F4..     X14 + X24 + X34 + X44 =E= 1;


MODEL AssignmentA /all/;


SOLVE AssignmentA using LP minimizing Z;
