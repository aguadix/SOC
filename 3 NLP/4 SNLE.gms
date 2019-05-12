* 4 SNLE.gms
* Sistema de ecuaciones no lineales
* RCMP no adiabático
* A => B
* Estado estacionario


SCALAR

CP  /0.8/
RHO /1000/
F   /20/
V   /1500/
UA  /10000/
H   /-80000/
T0  /293/
TJ  /283/
CA0 /2.5/
k0  /2.5E10/
R   /1.987/
E   /21000/;


VARIABLES

Z, CA, T, k, rA, Q, e1, e2;

CA.L = 1.25;
T.L = 350;


EQUATIONS

calk, calrA, calQ, BM, BE, OBJ;

calk..    k =E= k0*exp(-E/(R*T));
calrA..  rA =E= -k*CA;
calQ..    Q =E= UA*(TJ-T);
BM..     e1 =E= F*(CA0-CA)/V + rA;
BE..     e2 =E= F*(T0-T)/V + H*rA/(RHO*CP) + Q/(V*RHO*CP);
OBJ..     Z =E= sqr(e1) + sqr(e2);


MODEL SNLE /all/;


SOLVE SNLE using NLP minimizing Z;