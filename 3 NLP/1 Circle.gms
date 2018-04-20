* 1 Circle.gms
* Círculo de radio mínimo conteniendo puntos


SETS

i        /p1*p10/;


PARAMETERS

x(i)
/p1 71
p2 38
p3 91
p4 86
p5 53
p6 64
p7 10
p8 85
p9 90
p10 98/

y(i)
/p1 6
p2 35
p3 41
p4 99
p5 71
p6 94
p7 74
p8 40
p9 92
p10 39/;


VARIABLES

x0, y0, R;

x0.L = 50;
y0.L = 50;
R.L = 50;


EQUATIONS

d(i);

d(i)..      sqr(x(i)-x0) + sqr(y(i)-y0) =L= sqr(R);


MODEL Circle /all/;


SOLVE Circle using NLP minimizing R;