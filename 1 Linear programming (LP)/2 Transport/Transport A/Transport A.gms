* Transport A.gms
* Problema del transporte


VARIABLES

Z;


POSITIVE VARIABLES

X11, X12, X13, X14,
X21, X22, X23, X24,
X31, X32, X33, X34;


EQUATIONS

OBJ, F1, F2, F3, M4, M5, M6, M7;

OBJ..    Z =E=   10*X11 +  2*X12 + 20*X13 + 11*X14 +
                 12*X21 +  7*X22 +  9*X23 + 20*X24 +
                  4*X31 + 14*X32 + 16*X33 + 18*X34;

F1..     X11 + X12 + X13 + X14 =E= 15;
F2..     X21 + X22 + X23 + X24 =E= 25;
F3..     X31 + X32 + X33 + X34 =E= 10;

M4..     X11 + X21 + X31 =E= 5;
M5..     X12 + X22 + X32 =E= 15;
M6..     X13 + X23 + X33 =E= 15;
M7..     X14 + X24 + X34 =E= 15;


MODEL Transport /all/;


SOLVE Transport using LP minimizing Z;
