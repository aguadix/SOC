* ShortestPathA.gms


FREE VARIABLES

Z   'min';


POSITIVE VARIABLES

xAB, xAC, xBC, xBD, xCD, xCE, xDE 'if reaction is in the shortest path = 1, else = 0';


EQUATIONS

OBJ                 'min',
BA, BB, BC, BD, BE  ' - ';

OBJ..    20*xAB + 30*xAC + 20*xBC + 30*xBD + 10*xCD + 70*xCE + 50*xDE =E= Z;

BA..       -xAB -    xAC                                              =E= -1;
BB..        xAB          -    xBC -    xBD                            =E=  0;
BC..                 xAC +    xBC          -    xCD -    xCE          =E=  0;
BD..                                   xBD +    xCD          -    xDE =E=  0;
BE..                                                     xCE +    xDE =E=  1;


MODEL ShortestPathA /all/;


SOLVE ShortestPathA USING LP MINIMIZING Z;
