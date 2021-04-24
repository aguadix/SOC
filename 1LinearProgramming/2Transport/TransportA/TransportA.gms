* TransportA.gms 


FREE VARIABLES

Z   '$/year';


POSITIVE VARIABLES

x11, x12, x13, x14,
x21, x22, x23, x24,
x31, x32, x33, x34  'ton/year';


EQUATIONS

OBJ                 '$/year',
RO1, RO2, RO3       'ton/year',
RD1, RD2, RD3, RD4  'ton/year';

OBJ..    10*x11 +  2*x12 + 20*x13 + 11*x14 +
         12*x21 +  7*x22 +  9*x23 + 20*x24 +
          4*x31 + 14*x32 + 16*x33 + 18*x34 =E=   Z;

RO1..       x11 +    x12 +    x13 +    x14 =E= 15;
RO2..       x21 +    x22 +    x23 +    x24 =E= 25;
RO3..       x31 +    x32 +    x33 +    x34 =E= 10;

RD1..       x11 +    x21 +    x31          =E=  5;
RD2..       x12 +    x22 +    x32          =E= 15;
RD3..       x13 +    x23 +    x33          =E= 15;
RD4..       x14 +    x24 +    x34          =E= 15;


MODEL TransportA /all/;


SOLVE TransportA USING LP MINIMIZING Z;
