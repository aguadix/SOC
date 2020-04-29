* SetCoverA.gms
* Problema de la cobertura de conjunto


VARIABLES

Z;


BINARY VARIABLES

X1, X2, X3, X4, X5, X6;


EQUATIONS

OBJ, A12, A14, A23, A24, A25, A35, A36, A45;

OBJ..    Z =E= 6*X1 + 5*X2 + 4*X3 + 3*X4 + 2*X5 + 1*X6;

A12..    X1 + X2                        =G= 1;
A14..    X1           + X4              =G= 1;
A23..         X2 + X3                   =G= 1;
A24..         X2      + X4              =G= 1;
A25..         X2           + X5         =G= 1;
A35..              X3      + X5         =G= 1;
A36..              X3           + X6    =G= 1;
A45..                   X4 + X5         =G= 1;


MODEL SetCoverA /all/;


SOLVE SetCoverA using MIP minimizing Z;
