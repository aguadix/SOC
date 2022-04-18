* ShortestPathB.gms


SETS

c   'compounds'  /A, B, C, D, E/
r   'reactions'  /AB, AC, BC, BD, CD, CE, DE/;


PARAMETERS

d(c)    ' - '
/A      -1
B        0
C        0
D        0
E        1/

t(r)    'min'
/AB      20
AC       30
BC       20
BD       30
CD       10
CE       70
DE       50/;


TABLE

s(c,r)  'if reagent = -1, product = 1, not involved = 0'
        AB       AC       BC       BD       CD       CE       DE
A       -1       -1        0        0        0        0        0
B        1        0       -1       -1        0        0        0
C        0        1        1        0       -1       -1        0
D        0        0        0        1        1        0       -1
E        0        0        0        0        0        1        1    ;


FREE VARIABLES

Z       'min';


POSITIVE VARIABLES

x(r)    'if reaction is in the shortest path = 1, else = 0';


EQUATIONS

OBJ     'min',
B(c)    ' - ';

OBJ..   SUM(r,t(r)*x(r))   =E= Z;

B(c)..  SUM(r,s(c,r)*x(r)) =E= d(c);


MODEL ShortestPathB /all/;


SOLVE ShortestPathB USING LP MINIMIZING Z;
