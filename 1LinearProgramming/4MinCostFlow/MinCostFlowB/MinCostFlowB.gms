* MinCostFlowB.gms


SETS

n   'nodes'       /N1*N5/
a   'arcs'        /A12, A13, A14, A23, A25, A35, A45/;


PARAMETERS

d(n)    'm3/min'
/N1      -40
N2       -50
N3        0
N4        30
N5        60/

c(a)    'm3/min'
/A12      3
A13       7
A14       5
A23       2
A25       1
A35       8
A45       4/

xup(a)  'm3/min'
/A12      30
A13       10
A14       35
A23       60
A25       30
A35       30
A45       30/;


TABLE

s(n,a)  'if arc leaves node = -1, arrives = 1, not involved = 0'
         A12      A13      A14      A23      A25      A35      A45
N1       -1       -1       -1        0        0        0        0
N2        1        0        0       -1       -1        0        0
N3        0        1        0        1        0       -1        0
N4        0        0        1        0        0        0       -1
N5        0        0        0        0        1        1        1;


FREE VARIABLES

Z       '$/min';


POSITIVE VARIABLES

x(a)    'm3/min';
x.up(a) = xup(a);


EQUATIONS

OBJ     '$/min',
B(n)    'm3/min';

OBJ..   SUM(a,c(a)*x(a))    =E= Z;

B(n)..  SUM(a,s(n,a)*x(a))  =E= d(n);


MODEL MinCostFlowB /all/;


SOLVE MinCostFlowB USING LP MINIMIZING Z;