* CSTRb.gms

* 1) A => B
* 2) B => C
* 3) B => D

SET
c 'compounds' /A, B, C, D/,
r 'reactions' /AB, BC, BD/;

SCALAR
F   'L/min'         /    5/
UA  'cal/(min*K)'   /  700/
TJ  'K'             /  350/
RHO 'g/L'           / 1000/
CP  'cal/(g*K)'     /    1/;

PARAMETER
Conc0(c) 'mol/L'    /A 1, B 0, C 0, D 0/,
H(r)     'cal/mol'  /AB -1000, BC -2000, BD -5000/,
EAR(r)              /AB 2600,  BC 2200,  BD 6200/,
lnk0(r)             /AB 6,     BC 7,     BD 17/;

TABLE
key(r,c) 'if reactant = 1, else = 0'
    A B C D
AB  1 0 0 0
BC  0 1 0 0 
BD  0 1 0 0;

TABLE
s(c,r) 'if reactant = -1, if product = 1, else = 0'
   AB  BC  BD
A  -1   0   0
B   1  -1  -1
C   0   1   0
D   0   0   1;

FREE VARIABLE
V              'L',
T0, T          'K',
Conc(c)        'mol/L',
k(r)           'min-1',
rate(r)        'mol/(L*min)'
Z;

*   Starting guess;        Lower bound;        Upper bound;
   V.l      =  100;    V.lo      =  50;    V.up      = 150;
  T0.l      =  300;   T0.lo      = 273;   T0.up      = 373;
   T.l      =  300;    T.lo      = 273;    T.up      = 373;
Conc.l('A') =    1; Conc.lo('A') =   0; Conc.up('A') =   1;
Conc.l('B') =    0; Conc.lo('B') =   0; Conc.up('B') =   1;
Conc.l('C') =    0; Conc.lo('C') =   0; Conc.up('C') =   1;
Conc.l('D') =    0; Conc.lo('D') =   0; Conc.up('D') =   1;

EQUATION
calk(r)       'min-1'
calrate(r)    'mol/(L*min)'
dConcdt(c)    'mol/(L*min)'
dTdt          'K/min'
OBJ           'mol/L';

calk(r)..       k(r)    =E= exp(-EAR(r)/T + lnk0(r));
calrate(r)..    rate(r) =E= k(r)*sum(c,key(r,c)*Conc(c));
dConcdt(c)..          0 =E= F*(Conc0(c) - Conc(c))/V + sum(r,s(c,r)*rate(r));
dTdt..                0 =E= F*(T0-T)/V - (sum(r,H(r)*rate(r)))/(RHO*CP) + UA*(TJ-T)/(V*RHO*CP);
OBJ..                 Z =E= Conc('C');

MODEL CSTRb /all/;

SOLVE CSTRb USING NLP MAXIMIZING Z;