* 3 NLR.gms
* Nonlinear regression

SETS

i  / 1*25 /;


PARAMETERS

t(i)
/ 1  0.0
  2  2.5
  3  5.0
  4  7.5
  5 10.0
  6 12.5
  7 15.0
  8 17.5
  9 20.0
 10 22.5
 11 25.0
 12 27.5
 13 30.0
 14 32.5
 15 35.0
 16 37.5
 17 40.0
 18 42.5
 19 45.0
 20 47.5
 21 50.0
 22 52.5
 23 55.0
 24 57.5
 25 60.0/

y(i)
/ 1 0.0
  2 1.8
  3 4.4
  4 4.5
  5 2.8
  6 1.8
  7 2.4
  8 3.4
  9 3.6
 10 3.0
 11 2.5
 12 2.7
 13 3.1
 14 3.2
 15 3.0
 16 2.8
 17 2.8
 18 3.0
 19 3.1
 20 3.0
 21 2.9
 22 2.9
 23 3.0
 24 3.0
 25 3.0/;


VARIABLES

Z, ycal(i), K, tau, zeta;

K.L = 2.5;
tau.L = 3.0;
zeta.L = 0.2;


EQUATIONS

CAL(i), OBJ;

CAL(i)..   ycal(i) =E= K*( 1 - exp(-zeta*t(i)/tau)/sqrt(1-sqr(zeta)) * sin(sqrt(1-sqr(zeta))/tau*t(i) + arccos(zeta) ));
OBJ..      Z  =E= sum(i,sqr(y(i)-ycal(i)));


MODEL NLR /all/;


SOLVE NLR using NLP minimizing Z;