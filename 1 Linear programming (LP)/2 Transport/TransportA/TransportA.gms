* TransportA.gms
* Problema del transporte


VARIABLES

Z;


POSITIVE VARIABLES

X11, X12, X13, X14,
X21, X22, X23, X24,
X31, X32, X33, X34;


EQUATIONS

OBJ, O1, O2, O3, D1, D2, D3, D4;

OBJ..    Z =E=   10*X11 +  2*X12 + 20*X13 + 11*X14 +
                 12*X21 +  7*X22 +  9*X23 + 20*X24 +
                  4*X31 + 14*X32 + 16*X33 + 18*X34;

O1..     X11 + X12 + X13 + X14 =E= 15;
O2..     X21 + X22 + X23 + X24 =E= 25;
O3..     X31 + X32 + X33 + X34 =E= 10;

D1..     X11 + X21 + X31 =E= 5;
D2..     X12 + X22 + X32 =E= 15;
D3..     X13 + X23 + X33 =E= 15;
D4..     X14 + X24 + X34 =E= 15;


MODEL TransportA /all/;


SOLVE TransportA using LP minimizing Z;
