* MaxRad.gms

SET
c /C1*C3/;

SCALAR
L /4/;

PARAMETER
 R(c) /C1 0.5, C2 1.0, C3 0.2/
xc(c) /C1 1.0, C2 2.0, C3 3.0/
yc(c) /C1 1.0, C2 3.0, C3 0.5/;


FREE VARIABLE
R0, xc0, yc0;

* Starting guess;
 R0.l = 0.25;
xc0.l = 3.00;
yc0.l = 1.50;

EQUATION

NoOverlap(c), left, down, right, up;

NoOverlap(c).. sqr(R0+R(c))  =L=  sqr(xc0-xc(c))+sqr(yc0-yc(c));
left..         xc0           =G=  R0;
down..         yc0           =G=  R0;
right..        xc0           =L=  L-R0;
up..           yc0           =L=  L-R0;

MODEL MaxRad /all/;

SOLVE MaxRad USING NLP MAXIMIZING R0;