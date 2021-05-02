* BinPackingA.gms 

FREE VARIABLE
Z       'number of trucks used';

BINARY VARIABLE
xA1, xB1, xC1, xD1, xE1, xF1, xG1, xH1, xI1, xJ1,
xA2, xB2, xC2, xD2, xE2, xF2, xG2, xH2, xI2, xJ2,
xA3, xB3, xC3, xD3, xE3, xF3, xG3, xH3, xI3, xJ3,
xA4, xB4, xC4, xD4, xE4, xF4, xG4, xH4, xI4, xJ4,
xA5, xB5, xC5, xD5, xE5, xF5, xG5, xH5, xI5, xJ5,
xA6, xB6, xC6, xD6, xE6, xF6, xG6, xH6, xI6, xJ6 'if farm is collected by truck = 1, else = 0'

y1, y2, y3, y4, y5, y6  'if truck is used = 1, else = 0';

EQUATION
OBJ 'number of trucks used'
ROA, ROB, ROC, ROD, ROE, ROF, ROG, ROH, ROI, ROJ '-'
RVT1, RVT2, RVT3, RVT4, RVT5, RVT6 'm3';

OBJ..   y1 + y2 + y3 + y4 + y5 + y6 =E= Z;

ROA..   xA1  + xA2  + xA3  + xA4  + xA5  + xA6  =E= 1;
ROB..   xB1  + xB2  + xB3  + xB4  + xB5  + xB6  =E= 1;
ROC..   xC1  + xC2  + xC3  + xC4  + xC5  + xC6  =E= 1;
ROD..   xD1  + xD2  + xD3  + xD4  + xD5  + xD6  =E= 1;
ROE..   xE1  + xE2  + xE3  + xE4  + xE5  + xE6  =E= 1;
ROF..   xF1  + xF2  + xF3  + xF4  + xF5  + xF6  =E= 1;
ROG..   xG1  + xG2  + xG3  + xG4  + xG5  + xG6  =E= 1;
ROH..   xH1  + xH2  + xH3  + xH4  + xH5  + xH6  =E= 1;
ROI..   xI1  + xI2  + xI3  + xI4  + xI5  + xI6  =E= 1;
ROJ..   xJ1  + xJ2  + xJ3  + xJ4  + xJ5  + xJ6  =E= 1;

RVT1..  1*xA1 + 1*xB1 + 2*xC1 + 2*xD1 + 4*xE1 + 4*xF1 + 5*xG1 + 6*xH1 + 7*xI1 + 8*xJ1 =L= 10*y1;
RVT2..  1*xA2 + 1*xB2 + 2*xC2 + 2*xD2 + 4*xE2 + 4*xF2 + 5*xG2 + 6*xH2 + 7*xI2 + 8*xJ2 =L= 10*y2;
RVT3..  1*xA3 + 1*xB3 + 2*xC3 + 2*xD3 + 4*xE3 + 4*xF3 + 5*xG3 + 6*xH3 + 7*xI3 + 8*xJ3 =L= 10*y3;
RVT4..  1*xA4 + 1*xB4 + 2*xC4 + 2*xD4 + 4*xE4 + 4*xF4 + 5*xG4 + 6*xH4 + 7*xI4 + 8*xJ4 =L= 10*y4;
RVT5..  1*xA5 + 1*xB5 + 2*xC5 + 2*xD5 + 4*xE5 + 4*xF5 + 5*xG5 + 6*xH5 + 7*xI5 + 8*xJ5 =L= 10*y5;
RVT6..  1*xA6 + 1*xB6 + 2*xC6 + 2*xD6 + 4*xE6 + 4*xF6 + 5*xG6 + 6*xH6 + 7*xI6 + 8*xJ6 =L= 10*y6;

MODEL BinPackingB /all/;

SOLVE BinPackingB USING MIP MINIMIZING Z;