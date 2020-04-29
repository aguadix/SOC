* KnapsackB.gms

SET
i       'items' / I1 * I10/;

PARAMETERS
v(i)    '$'     /I1 23, I2 79, I3 35, I4 54, I5 13, I6 83, I7 86, I8 57, I9 28, I10 11/
w(i)    'ton'   /I1 72, I2 99, I3 68, I4 22, I5 44, I6 72, I7 34, I8 57, I9 35, I10 51/
xup(i)  'units' /I1  4, I2  5, I3  4, I4  2, I5  3, I6  2, I7  2, I8  2, I9  1, I10  5/;

SCALAR
WT      'ton'   /250/;

FREE VARIABLE
Z   '$';

INTEGER VARIABLES
*BINARY VARIABLES
x(i)    'units';
*x.up(i) = xup(i);

EQUATIONS
OBJ '$', RWT 'ton';
OBJ..   SUM(i,v(i)*x(i)) =E= Z;
RWT..   SUM(i,w(i)*x(i)) =L= WT;

MODEL KnapsackB /all/;

SOLVE KnapsackB USING MIP MAXIMIZING Z;
