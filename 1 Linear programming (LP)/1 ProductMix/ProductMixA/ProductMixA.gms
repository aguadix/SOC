* ProductMixA.gms


FREE VARIABLES

Z '$/day';


POSITIVE VARIABLES

x1, x2 'kg/day';


EQUATIONS

OBJ             '$/day',
RD1, RD2, RD3   'hour/day';

OBJ..   3.0*x1 + 2.5*x2 =E= Z;
RD1..   2.5*x1 + 0.5*x2 =L= 18.5;
RD2..   1.0*x1 + 1.5*x2 =L= 20.0;
RD3..   3.5*x1 + 1.0*x2 =L= 24.0;


MODEL ProductMixA /all/;


SOLVE ProductMixA USING LP MAxIMIZING Z;
