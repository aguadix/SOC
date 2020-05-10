* Catenary.gms

SET
i /0*10/;
alias(i,j)

FREE VARIABLE
x(i), y(i), Z;
 
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
d(i,j), obj;
d(i,j) $(ord(i)+1=ord(j))..  sqrt(sqr(x(i)-x(j))+sqr(y(i)-y(j))) =L= 2;
obj..                        SUM(j,y(j))                         =E= Z;

MODEL Catenary /all/;

SOLVE Catenary USING NLP MINIMIZING Z;