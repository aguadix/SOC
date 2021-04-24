* ProductMixB.gms 


SETS

m  'machines'    /M1, M2, M3/
p  'products'    /P1, P2/;


PARAMETERS

d(m)    'hour/day'
/M1       18.5
M2        20.0
M3        24.0/

b(p)    '$/kg'
/P1        3.0
P2         2.5/;


TABLE

u(m,p)  'hour/kg'
           P1      P2
M1         2.5     0.5
M2         1.0     1.5
M3         3.5     1.0;


FREE VARIABLES

Z       '$/day';


POSITIVE VARIABLES

x(p)    'kg/day';


EQUATIONS

OBJ     '$/day',
RD(m)   'hour/day';

OBJ..   SUM(p,b(p)*x(p))   =E= Z;

RD(m).. SUM(p,u(m,p)*x(p)) =L= d(m);


MODEL ProductMixB /all/;


SOLVE ProductMixB USING LP MAXIMIZING Z;
