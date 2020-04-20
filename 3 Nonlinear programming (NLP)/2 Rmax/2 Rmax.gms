* 2 Rmax.gms
* Círculo de radio máximo sin solapamientos


SETS

i / C1 * C3 / ;


SCALAR

L /4/;


PARAMETERS

R(i)
/C1       0.5
C2        1.0
C3        0.2/

X(i)
/C1       1.0
C2        2.0
C3        3.0/

Y(i)
/C1       1.0
C2        3.0
C3        0.5/;


VARIABLES

Rad, X0, Y0;

Rad.L = 0.25;
X0.L = 3.0;
Y0.L = 1.5;


EQUATIONS

d(i), left, down, right, up;

d(i).. sqr(X(i)-X0) + sqr(Y(i)-Y0) =G= sqr(Rad+R(i));
left..       X0 =G= Rad;
down..       Y0 =G= Rad;
right..      X0 =L= L-Rad;
up..         Y0 =L= L-Rad;


MODEL Rmax /all/;


SOLVE Rmax using NLP maximizing Rad;
