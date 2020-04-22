* BinPackingA.gms
* Problema de empaquetamiento

VARIABLES

* Número de cajas usadas;
N;


BINARY VARIABLES
* Xij  ¿se mete el objeto i en la caja j?
X11, X21, X31, X41, X51, X61, X71, X81, X91, X101,
X12, X22, X32, X42, X52, X62, X72, X82, X92, X102,
X13, X23, X33, X43, X53, X63, X73, X83, X93, X103,
X14, X24, X34, X44, X54, X64, X74, X84, X94, X104,
X15, X25, X35, X45, X55, X65, X75, X85, X95, X105,
X16, X26, X36, X46, X56, X66, X76, X86, X96, X106


*Yj  ¿se usa la caja j?;
Y1, Y2, Y3, Y4, Y5, Y6;

EQUATIONS

*Obj, Asigna(i), Cap(j);
Obj,
Asigna1, Asigna2, Asigna3, Asigna4, Asigna5, Asigna6, Asigna7, Asigna8, Asigna9, Asigna10,
Cap1, Cap2, Cap3, Cap4, Cap5, Cap6;



* Obj..         N =E= sum(j,y(j)) ;
Obj..           N =E= Y1 + Y2 + Y3 + Y4 + Y5 + Y6;


* Asigna(i)..   sum(j,x(i,j)) =E= 1 ;
* Cada objeto en una caja
Asigna1..       X11 + X12 + X13 + X14 + X15 + X16 =E= 1;
Asigna2..       X21 + X22 + X23 + X24 + X25 + X26 =E= 1;
Asigna3..       X31 + X32 + X33 + X34 + X35 + X36 =E= 1;
Asigna4..       X41 + X42 + X43 + X44 + X45 + X46 =E= 1;
Asigna5..       X51 + X52 + X53 + X54 + X55 + X56 =E= 1;
Asigna6..       X61 + X62 + X63 + X64 + X65 + X66 =E= 1;
Asigna7..       X71 + X72 + X73 + X74 + X75 + X76 =E= 1;
Asigna8..       X81 + X82 + X83 + X84 + X85 + X86 =E= 1;
Asigna9..       X91 + X92 + X93 + X94 + X95 + X96 =E= 1;
Asigna10..      X101 + X102 + X103 + X104 + X105 + X106 =E= 1;


* Cap(j)..      sum(i,w(i)*x(i,j)) =L= V*y(j);
* No superar la capacidad de la caja
Cap1..          1*X11 + 1*X21 + 2*X31 + 2*X41 + 4*X51 + 4*X61 + 5*X71 + 6*X81 + 7*X91 + 8*X101 =L= 10*Y1;
Cap2..          1*X12 + 1*X22 + 2*X32 + 2*X42 + 4*X52 + 4*X62 + 5*X72 + 6*X82 + 7*X92 + 8*X102 =L= 10*Y2;
Cap3..          1*X13 + 1*X23 + 2*X33 + 2*X43 + 4*X53 + 4*X63 + 5*X73 + 6*X83 + 7*X93 + 8*X103 =L= 10*Y3;
Cap4..          1*X14 + 1*X24 + 2*X34 + 2*X44 + 4*X54 + 4*X64 + 5*X74 + 6*X84 + 7*X94 + 8*X104 =L= 10*Y4;
Cap5..          1*X15 + 1*X25 + 2*X35 + 2*X45 + 4*X55 + 4*X65 + 5*X75 + 6*X85 + 7*X95 + 8*X105 =L= 10*Y5;
Cap6..          1*X16 + 1*X26 + 2*X36 + 2*X46 + 4*X56 + 4*X66 + 5*X76 + 6*X86 + 7*X96 + 8*X106 =L= 10*Y6;


MODEL BinPackingB /all/;


SOLVE BinPackingB using MIP minimizing N;
