* SetCoverB.gms
* Problema de la cobertura de conjunto


SETS

i        /A12, A14, A23, A24, A25, A35, A36, A45/
j        /N1*N6/;


PARAMETERS

c(j)
/N1      6
N2       5
N3       4
N4       3
N5       2
N6       1/;


TABLE

a(i,j)

	N1	N2	N3	N4	N5	N6
A12	1	1	0	0	0	0
A14	1	0	0	1	0	0
A23	0	1	1	0	0	0
A24	0	1	0	1	0	0
A25	0	1	0	0	1	0
A35	0	0	1	0	1	0
A36	0	0	1	0	0	1
A45	0	0	0	1	1	0;


VARIABLES

Z;


BINARY VARIABLES

x(j);


EQUATIONS

OBJ, R(i);
OBJ..     Z  =E= SUM(j,c(j)*x(j)) ;
R(i)..    SUM(j,a(i,j)*x(j)) =G= 1;


MODEL SetCoverB /all/;


SOLVE SetCoverB using MIP minimizing Z;
