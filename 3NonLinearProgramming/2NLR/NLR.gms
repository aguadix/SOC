* NLR.gms

SET

m  'measurements' / M1*M21 /;

PARAMETER

t(m)
/ M1   0
  M2   5
  M3  10
  M4  15
  M5  20
  M6  25
  M7  30
  M8  35
  M9  40
 M10  45
 M11  50
 M12  55
 M13  60
 M14  65
 M15  70
 M16  75
 M17  80
 M18  85
 M19  90
 M20  95
 M21 100/

yexp(m)
/ M1  0.0
  M2  2.4
  M3  4.5
  M4  3.0
  M5  1.4
  M6  2.5
  M7  3.6
  M8  2.9
  M9  2.1
 M10  2.6
 M11  3.1
 M12  2.8
 M13  2.4
 M14  2.6
 M15  2.9
 M16  2.8
 M17  2.6
 M18  2.7
 M19  2.8
 M20  2.7
 M21  2.6/;

VARIABLE

Z, ycal(m), K, tau, zeta;

* Starting guess
   K.L = 2.5;
 tau.L = 3.0;
zeta.L = 0.1;

EQUATION

CAL(m), OBJ;

CAL(m)..   ycal(m) =E= K*(1-exp(-zeta*t(m)/tau)/sqrt(1-sqr(zeta))*sin(sqrt(1-sqr(zeta))*t(m)/tau+arccos(zeta)));
OBJ..           Z  =E= SUM(m,sqr(yexp(m)-ycal(m)));

MODEL NLR /all/;

SOLVE NLR USING NLP MINIMIZING Z;
