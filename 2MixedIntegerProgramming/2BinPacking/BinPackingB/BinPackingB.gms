* BinPackingB.gms

SET
f       'farms'     /A,B,C,D,E,F,G,H,I,J/
t       'trucks'    /T1*T6/;

PARAMETER
v(f)    'm3'        /A 1, B 1, C 2, D 2, E 4, F 4, G 5, H 6, I 7, J 8/;

SCALAR
VT      'm3'        /10/ ;

FREE VARIABLE
Z       'number of trucks used';

BINARY VARIABLE
x(f,t)  'if farm is collected by truck = 1, else = 0'
y(t)    'if truck is used = 1, else = 0'

EQUATION
OBJ     'number of trucks used'
RO(f)   '-'
RVT(t)  'm3';

OBJ..       SUM(t,y(t))        =E= Z;
RO(f)..     SUM(t,x(f,t))      =E= 1;
RVT(t)..    SUM(f,v(f)*x(f,t)) =L= VT*y(t);

MODEL BinPackingA /all/;

SOLVE BinPackingA USING MIP MINIMIZING Z;