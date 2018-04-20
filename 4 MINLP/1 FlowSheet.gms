* 1 FlowSheet.gms
* Diagrama de flujo


VARIABLES

Z        beneficio total;

POSITIVE VARIABLES

a        consumo de a
a2       consumo de a en proceso 2
a3       consumo de a en proceso 3
b2       producción de b en proceso 2
b3       producción de b en proceso 3
bp       cantidad de b comprada
b1       consumo de b en proceso 1
c        producción de c en proceso 1;

* demanda de c
c.up = 1;


BINARY VARIABLES

y1       existencia de proceso 1
y2       existencia de proceso 2
y3       existencia de proceso 3;


EQUATIONS

bala     balance para separación de a
bal1     balance para proceso 1
bal2     balance para proceso 2
bal3     balance para proceso 3
balb     balance para mezcla de b

cap1     capacidad de proceso 1
cap2     capacidad de proceso 2
cap3     capacidad de proceso 3

obj      beneficio;

bala..   a =E= a2 + a3;
bal1..   c =E= 0.9*b1 ;
bal2..   exp(b2) - 1 =E=  a2 ;
bal3..   exp(b3/1.2) - 1 =E= a3 ;
balb..   b1 =E= b2 + b3 + bp ;

cap1..   c  =L= 2*y1 ;
cap2..   b2  =L= 4*y2 ;
cap3..   b3  =L= 5*y3 ;

obj..    Z =E=   13*c
                 - 3.5*y1 - y2 - 1.5*y3
                 - 2*c - b2 - 1.2*b3
                 - 1.8*a - 7*bp;


MODEL FlowSheet /all/ ;


SOLVE FlowSheet using MINLP maximizing Z;