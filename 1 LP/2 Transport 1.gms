*2 Transport 1
*Problema del transporte

VARIABLES
Z;

POSITIVE VARIABLES
X14, X15, X16, X17,
X24, X25, X26, X27,
X34, X35, X36, X37;

EQUATIONS
OBJ, F1, F2, F3, M4, M5, M6, M7;

OBJ..    Z =E=   10*X14 + 2*X15 + 20*X16 + 11*X17 +
                 12*X24 + 7*X25 + 9*X26 + 20*X27 +
                 4*X34 + 14*X35 + 16*X36 + 18*X37;

F1..     X14 + X15 + X16 + X17 =E= 15;
F2..     X24 + X25 + X26 + X27 =E= 25;
F3..     X34 + X35 + X36 + X37 =E= 10;

M4..     X14 + X24 + X34 =E= 5;
M5..     X15 + X25 + X35 =E= 15;
M6..     X16 + X26 + X36 =E= 15;
M7..     X17 + X27 + X37 =E= 15;

MODEL Transport1 /all/;

SOLVE Transport1 using LP minimizing Z;
