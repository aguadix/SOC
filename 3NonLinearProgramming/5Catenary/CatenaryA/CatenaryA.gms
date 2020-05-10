* CatenaryA.gms

SCALAR
L 'length' /20/,
P 'points' /11/;

FREE VARIABLE
x0, y0
x1,y1,
x2,y2,
x3,y3,
x4,y4,
x5,y5,
x6,y6,
x7,y7,
x8,y8,
x9,y9,
x10,y10,
LS,
Z;

* Fixed values
 x0.fx =  0 ;  y0.fx = 10;
x10.fx = 10 ; y10.fx = 10;

* Starting guess
x1.l = 1; y1.l = 10;
x2.l = 2; y2.l = 10;
x3.l = 3; y3.l = 10;
x4.l = 4; y4.l = 10;
x5.l = 5; y5.l = 10;
x6.l = 6; y6.l = 10;
x7.l = 7; y7.l = 10;
x8.l = 8; y8.l = 10;
x9.l = 9; y9.l = 10;

EQUATION
calLS, d01, d12, d23, d34, d45, d56, d67, d78, d89, d910, obj;

calLS..   LS =E= L/(P-1);

d01..  sqrt(sqr(x0-x1)  + sqr(y0-y1))    =L= LS;
d12..  sqrt(sqr(x1-x2)  + sqr(y1-y2))    =L= LS;
d23..  sqrt(sqr(x2-x3)  + sqr(y2-y3))    =L= LS;
d34..  sqrt(sqr(x3-x4)  + sqr(y3-y4))    =L= LS;
d45..  sqrt(sqr(x4-x5)  + sqr(y4-y5))    =L= LS;
d56..  sqrt(sqr(x5-x6)  + sqr(y5-y6))    =L= LS;
d67..  sqrt(sqr(x6-x7)  + sqr(y6-y7))    =L= LS;
d78..  sqrt(sqr(x7-x8)  + sqr(y7-y8))    =L= LS;
d89..  sqrt(sqr(x8-x9)  + sqr(y8-y9))    =L= LS;
d910.. sqrt(sqr(x9-x10) + sqr(y9-y10))   =L= LS;

obj..  y0+y1+y2+y3+y4+y5+y6+y7+y8+y9+y10 =E= Z;

MODEL CatenaryA /all/;

SOLVE CatenaryA USING NLP MINIMIZING Z;