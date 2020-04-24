* TransportB.gms


SETS

p  'plants'    / P1*P3 /
m  'markets'   / M1*M4 /;


PARAMETERS

o(p)    'ton/year'
/P1       15
P2        25
P3        10/

d(m)    'ton/year'
/M1        5
M2        15
M3        15
M4        15/;


TABLE

c(p,m)  '$/ton'
          M1      M2      M3      M4
P1        10       2      20      11
P2        12       7       9      20
P3         4      14      16      18;


FREE VARIABLES

Z   '$/year';


POSITIVE VARIABLES

x(p,m)  'ton/year';


EQUATIONS

OBJ      '$/year',
RO(p)    'ton/year',
RD(m)    'ton/year';

OBJ ..     SUM((p,m), c(p,m)*x(p,m))  =E=  Z;
RO(p) ..   SUM(m, x(p,m))             =E=  o(p) ;
RD(m) ..   SUM(p, x(p,m))             =E=  d(m) ;


MODEL TransportB /all/ ;


SOLVE TransportB USING LP MINIMIZING Z;
