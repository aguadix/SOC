* AssignmentB.gms


SETS

p   'products'     /P1*P4/
l   'lines'        /L1*L4/;


TABLE

c(p,l)  '$/year'
          L1       L2       L3       L4
P1         1        4        6        3
P2         9        7       10        9
P3         4        5       11        7
P4         8        7        8        5;


FREE VARIABLES

Z       '$/year';


POSITIVE VARIABLES

x(p,l)  'if product is assigned to line = 1, else = 0';


EQUATIONS

OBJ       '$/year',
RO(p)     '-',
RD(l)     '-';

OBJ..     SUM((p,l),c(p,l)*x(p,l))  =E= Z;
RO(p)..   SUM(l,x(p,l))             =E= 1;
RD(l)..   SUM(p,x(p,l))             =E= 1;


MODEL AssignmentB /all/;


SOLVE AssignmentB USING LP MINIMIZING Z;
