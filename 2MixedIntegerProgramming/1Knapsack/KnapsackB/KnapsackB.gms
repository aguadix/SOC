* KnapsackB.gms

SET
f       'ferment'   /F1*F10/;

PARAMETER
b(f)    '$/batch'     /F1 23, F2 79, F3 35, F4 54, F5 13, F6 83, F7 86, F8 57, F9 28, F10 11/
m(f)    'ton/batch'   /F1 72, F2 99, F3 68, F4 22, F5 44, F6 72, F7 34, F8 57, F9 35, F10 51/
xup(f)  'batch/week'  /F1  4, F2  5, F3  4, F4  2, F5  3, F6  2, F7  2, F8  2, F9  1, F10  5/;

SCALAR
MT      'ton/week'   /250/;

FREE VARIABLE
Z       '$/week';

INTEGER VARIABLE
*BINARY VARIABLES
x(f)    'batch/week';
x.up(f) = xup(f);

EQUATION
OBJ '$/week', RMT 'ton/week';
OBJ..   SUM(f,b(f)*x(f)) =E= Z;
RMT..   SUM(f,m(f)*x(f)) =L= MT;

MODEL KnapsackB /all/;

SOLVE KnapsackB USING MIP MAXIMIZING Z;