* CSTRa.gms 

* 1) A => B
* 2) B => C
* 3) B => D

SCALAR
F   'L/min'         /    5/
CA0 'mol/L'         /    1/
CB0 'mol/L'         /    0/
CC0 'mol/L'         /    0/
CD0 'mol/L'         /    0/
H1  'cal/mol'       /-1000/
H2  'cal/mol'       /-2000/
H3  'cal/mol'       / -500/
UA  'cal/(min*K)'   /  700/
TJ  'K'             /  350/
RHO 'g/L'           / 1000/
CP  'cal/(g*K)'     /    1/;

FREE VARIABLE
V              'L',
T0, T          'K',
CA, CB, CC, CD 'mol/L',
k1, k2, k3     'min-1',
r1, r2, r3     'mol/(L*min)';
* NV = 13

* Starting guess; Lower bound; Upper bound;
      V.l =  100;  V.lo =  50;  V.up = 150;
     T0.l =  300; T0.lo = 273; T0.up = 373;
      T.l =  300;  T.lo = 273;  T.up = 373;
     CA.l =    1; CA.lo =   0; CA.up =   1;
     CB.l =    0; CB.lo =   0; CB.up =   1;
     CC.l =    0; CC.lo =   0; CC.up =   1;
     CD.l =    0; CD.lo =   0; CD.up =   1;
  
EQUATION
calk1,calk2,calk3         'min-1',
calr1,calr2,calr3         'mol/(L*min)',
dCAdt,dCBdt,dCCdt,dCDdt   'mol/(L*min)',
dTdt                      'K/min';
* NE = 11
* DOF = NV - NE = 13-12 = 2 

calk1..    k1 =E= exp(-2600/T + 6);
calk2..    k2 =E= exp(-2200/T + 7);
calk3..    k3 =E= exp(-6200/T + 17);

calr1..    r1 =E= k1*CA;
calr2..    r2 =E= k2*CB;
calr3..    r3 =E= k3*CB;

dCAdt..     0 =E= F*(CA0-CA)/V - r1;
dCBdt..     0 =E= F*(CB0-CB)/V + r1 - r2 -r3;
dCCdt..     0 =E= F*(CC0-CC)/V + r2;
dCDdt..     0 =E= F*(CD0-CD)/V + r3;

dTdt..      0 =E= F*(T0-T)/V - (H1*r1+H2*r2+H3*r3)/(RHO*CP) + UA*(TJ-T)/(V*RHO*CP);

MODEL CSTRa /all/;

SOLVE CSTRa USING NLP MAXIMIZING CC;