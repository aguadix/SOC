* CatenaryB.gms 

SET
i /0*10/;
alias(i,j);

SCALAR
L 'length' /20/;

FREE VARIABLE
x(i), y(i), LS, Z;
 
* Fixed values
*x.fx('0')  =   0;
*y.fx('0')  =  10;
*x.fx('10') =  10;
*y.fx('10') =  10;
 
* Fixed values (other way)
x.fx(i) $(ord(i)=1)       =   0;
y.fx(i) $(ord(i)=1)       =  10;
x.fx(i) $(ord(i)=card(i)) =  10;
y.fx(i) $(ord(i)=card(i)) =  10;

EQUATION
calLS, d(i,j), obj;
calLs..                                            L/(card(i)-1) =E= LS; 
d(i,j) $(ord(i)+1=ord(j))..  sqrt(sqr(x(i)-x(j))+sqr(y(i)-y(j))) =L= LS;
obj..                        SUM(j,y(j))                         =E= Z;

MODEL CatenaryB /all/;

SOLVE CatenaryB USING NLP MINIMIZING Z;