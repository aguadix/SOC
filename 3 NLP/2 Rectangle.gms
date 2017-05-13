* 2 Rectangle.gms
* Empaquetar círculos en un rectángulo


SETS

i / C1 * C3 / ;


ALIAS (i,j);


SETS

ij(i,j);
ij(i,j)$(ord(i) < ord(j)) = yes;


PARAMETERS

R(i)
/C1       5
C2        15
C3        10/;


VARIABLES

Z, x(i), y(i);


POSITIVE VARIABLES

A1, A2, B1, B2;


EQUATIONS

OBJ, nooverlap(i,j), right(i), left(i), up(i), down(i);

OBJ.. Z =E=  (A1+A2)*(B1+B2);

nooverlap(ij(i,j)).. sqr(x(i)-x(j))+sqr(y(i)-y(j)) =G= sqr(R(i)+R(j));

right(i)..       x(i) + R(i) =L= A1;
left(i)..        R(i) - x(i) =L= A2;
up(i)..          y(i) + R(i) =L= B1;
down(i)..        R(i) - y(i) =L= B2;


MODEL Rectangle /all/;


SOLVE Rectangle using NLP minimizing Z;
