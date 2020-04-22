* ShortestPathA.gms
* Problema de la ruta más corta


VARIABLES

Z;


POSITIVE VARIABLES

X12, X13, X23, X24, X34, X35, X45;


EQUATIONS

OBJ, B1, B2, B3, B4, B5;

OBJ..    Z =E= 20*X12 + 30*X13 + 20*X23 + 30*X24 + 10*X34 + 70*X35 + 50*X45 ;

B1..    -X12 - X13                                =E= -1;
B2..     X12       - X23 - X24                    =E=  0;
B3..           X13 + X23       - X34 - X35        =E=  0;
B4..                       X24 + X34       - X45  =E=  0;
B5..                                   X35 + X45  =E=  1;


MODEL ShortestPathA /all/;


SOLVE ShortestPathA using LP minimizing Z;
