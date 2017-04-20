*4 MinCostFlow 1
*Problema del flujo capacitado con coste mínimo

VARIABLES
Z;

POSITIVE VARIABLES
X12, X13, X14, X23, X25, X35, X45;
X12.UP = 30;
X13.UP = 10;
X14.UP = 35;
X23.UP = 60;
X25.UP = 30;
X35.UP = 30;
X45.UP = 30;

EQUATIONS
OBJ, B1, B2, B3, B4, B5;

OBJ..    Z =E=  3*X12 + 7*X13 + 5*X14 + 2*X23 + X25 + 8*X35 + 4*X45;

B1..     -X12 - X13 - X14 =E= -40;
B2..     X12 - X23 - X25 =E= -50;
B3..     X13 + X23 - X35 =E= 0;
B4..     X14 - X45 =E= 30;
B5..     X25 + X35 + X45 =E= 60;


MODEL MinCostFlow1 /all/;

SOLVE MinCostFlow1 using LP minimizing Z;
