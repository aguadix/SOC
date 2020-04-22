* AssignmentB.gms
* Problema de la  asignación


SETS

i        /P1*P4/
j        /F1*F4/;


TABLE

c(i,j)
          F1       F2       F3       F4
P1        1        4        6        3
P2        9        7        10       9
P3        4        5        11       7
P4        8        7        8        5;


VARIABLES

Z;


POSITIVE VARIABLES

x(i,j);


EQUATIONS

OBJ, Ro(i), Rd(j);

OBJ..     Z =E= sum((i,j),c(i,j)*x(i,j)) ;
Ro(i)..   sum(j,x(i,j)) =E= 1;
Rd(j)..   sum(i,x(i,j)) =E= 1;


MODEL AssignmentB /all/;


SOLVE AssignmentB using LP minimizing Z;
