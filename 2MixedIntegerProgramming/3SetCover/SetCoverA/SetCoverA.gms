* SetCoverA.gms

FREE VARIABLE
Z '$';

BINARY VARIABLE
xAvila, xBurgos, xLeon, xPalencia, xSalamanca, xSegovia, xSoria, xValladolid, xZamora 'if installed = 1, else = 0';

EQUATION
OBJ '$',
RAvila, RBurgos, RLeon, RPalencia, RSalamanca, RSegovia, RSoria, RValladolid, RZamora '-';

OBJ..           1.5*xAvila + 1.5*xBurgos + 1.0*xLeon +  1.5*xPalencia + 1.5*xSalamanca + 1.5*xSegovia + 1.0*xSoria + 2.0*xValladolid + 1.5*xZamora =E= Z;

RAvila..            xAvila                                            +     xSalamanca +     xSegovia              +     xValladolid               =G= 1;
RBurgos..                        xBurgos             +      xPalencia                  +     xSegovia +     xSoria +     xValladolid               =G= 1;
RLeon..                                        xLeon +      xPalencia                                              +     xValladolid +     xZamora =G= 1;
RPalencia..                      xBurgos +     xLeon +      xPalencia                                              +     xValladolid               =G= 1;
RSalamanca..        xAvila                                            +     xSalamanca                             +     xValladolid +     xZamora =G= 1;
RSegovia..          xAvila +     xBurgos                                               +     xSegovia +     xSoria +     xValladolid               =G= 1;
RSoria..                         xBurgos                                               +     xSegovia +     xSoria                                 =G= 1;
RValladolid..       xAvila +     xBurgos +     xLeon +      xPalencia +     xSalamanca +     xSegovia              +     xValladolid +     xZamora =G= 1;
RZamora..                                      xLeon                  +     xSalamanca                             +     xValladolid +     xZamora =G= 1;   

MODEL SetCoverA /all/;

SOLVE SetCoverA USING MIP MINIMIZING Z;