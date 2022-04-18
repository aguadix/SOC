* MinCostFlowA.gms


FREE VARIABLES

Z   '$/min';


POSITIVE VARIABLES

x12, x13, x14, x23, x25, x35, x45   'm3/min';
x12.up = 30;
x13.up = 10;
x14.up = 35;
x23.up = 60;
x25.up = 30;
x35.up = 30;
x45.up = 30;


EQUATIONS

OBJ                     '$/min',
B1, B2, B3, B4, B5      'm3/min';

OBJ..    3*x12 + 7*x13 + 5*x14 + 2*x23 + 1*x25 + 8*x35 + 4*x45 =E= Z;

B1..      -x12 -   x13 -   x14                                 =E= -40;
B2..       x12                 -   x23 -   x25                 =E= -50;
B3..               x13         +   x23           - x35         =E=   0;
B4..                       x14                          -  x45 =E=  30;
B5..                                       x25 +   x35  +  x45 =E=  60;


MODEL MinCostFlowA /all/;


SOLVE MinCostFlowA USING LP MINIMIZING Z;
