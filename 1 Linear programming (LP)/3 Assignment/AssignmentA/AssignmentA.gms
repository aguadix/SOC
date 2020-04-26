* AssignmentA.gms


VARIABLES

Z   '$/year';


POSITIVE VARIABLES

x11, x12, x13, x14,
x21, x22, x23, x24,
x31, x32, x33, x34,
x41, x42, x43, x44  'if product is assigned to line = 1, else = 0';


EQUATIONS

OBJ                     '$/year',
RO1, RO2, RO3, RO4      '-',
RD1, RD2, RD3, RD4      '-';

OBJ..   1*x11 + 4*x12 +  6*x13 + 3*x14 +
        9*x21 + 7*x22 + 10*x23 + 9*x24 +
        4*x31 + 5*x32 + 11*x33 + 7*x34 +
        8*x41 + 7*x42 +  8*x43 + 5*x44 =E= Z;

RO1..     x11 +   x12 +    x13 +   x14 =E= 1;
RO2..     x21 +   x22 +    x23 +   x24 =E= 1;
RO3..     x31 +   x32 +    x33 +   x34 =E= 1;
RO4..     x41 +   x42 +    x43 +   x44 =E= 1;

RD1..     x11 +   x21 +    x31 +   x41 =E= 1;
RD2..     x12 +   x22 +    x32 +   x42 =E= 1;
RD3..     x13 +   x23 +    x33 +   x43 =E= 1;
RD4..     x14 +   x24 +    x34 +   x44 =E= 1;


MODEL AssignmentA /all/;


SOLVE AssignmentA USING LP MINIMIZING Z;
