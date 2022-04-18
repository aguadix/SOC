* MinDist.gms

SCALAR
* Ellipse
ae / 3/
be / 2/
* Parabola
ap / 1/
bp /-4/
cp / 6/;

FREE VARIABLE
t,xe,ye,
xp,yp
D;

* Starting guess;
   t.l = 0.2;
  xp.l = 1.5;
  
EQUATION
calxe, calye,
calyp,
obj;

calxe..    xe =E= ae*cos(2*pi*t);
calye..    ye =E= be*sin(2*pi*t);
calyp..    yp =E= ap*sqr(xp) + bp*xp + cp;
obj..      D  =E= sqrt(sqr(xe-xp)+sqr(ye-yp));

MODEL MinDist /all/;

SOLVE MinDist USING NLP MINIMIZING D;