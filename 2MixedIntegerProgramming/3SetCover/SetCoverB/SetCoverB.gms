* SetCoverB.gms

SET
pc   'province to cover'    /Avila, Burgos, Leon, Palencia, Salamanca, Segovia, Soria, Valladolid, Zamora/;
*pi   'province to install'  /Avila, Burgos, Leon, Palencia, Salamanca, Segovia, Soria, Valladolid, Zamora/;
alias(pc,pi);

PARAMETER
c(pi) '$'    /Avila 1.5, Burgos 1.5, Leon 1.0, Palencia 1.5, Salamanca 1.5, Segovia 1.5, Soria 1.0, Valladolid 2.0, Zamora 1.5/;

TABLE
s(pc,pi)    'if pc is covered by pi = 1, else 0'
            Avila  Burgos  Leon  Palencia  Salamanca  Segovia  Soria  Valladolid  Zamora
Avila       1      0       0     0         1          1        0      1           0
Burgos             1       0     1         0          1        1      1           0    
Leon                       1     1         0          0        0      1           1
Palencia                         1         0          0        0      1           0
Salamanca                                  1          0        0      1           1
Segovia                                               1        1      1           0
Soria                                                          1      0           0
Valladolid                                                            1           1
Zamora                                                                            1;

* Completar el triángulo inferior de la matriz simétrica
s(pc,pi) $(ord(pc)>ord(pi)) = s(pi,pc);
display s;

VARIABLES
Z       '$';

BINARY VARIABLES
x(pi)   'if installed = 1, else = 0';

EQUATIONS
OBJ     '$',
R(pc)   '-';

OBJ..   SUM(pi,c(pi)*x(pi))    =E= Z;
R(pc).. SUM(pi,s(pc,pi)*x(pi)) =G= 1;

MODEL SetCoverB /all/;

SOLVE SetCoverB USING MIP MINIMIZING Z;
