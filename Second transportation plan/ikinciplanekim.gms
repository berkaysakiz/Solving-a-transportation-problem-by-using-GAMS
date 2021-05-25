*ikinci plan ekim*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*13/;

parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye ekim ayi gonderilecek yuk miktarlari
/1 129486
2  358950
3  155756
4  41718
5  99960
6  261658
7  86170
8  93568
9  1145346
10 199038
11 402540
12 80956
13 234220
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    192101  186290  192101  229684  194961  210665  293995  195637  250133  229684  176475  181623  176475
2    295540  286600  295540  353360  299940  324100  452300  300980  384820  353360  271500  279420  271500
3    369425  358250  369425  441700  374925  405125  565375  376225  481025  441700  339375  349275  339375;

Table a(i,j) i. tip aracin j bolgesine bir sefer yapmasi gereken suresi
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    16      12      16      24      18.46   21.81   34.28   18.46   26.66   24      10.43   10.90   10.90
2    16      12      16      24      18.46   21.81   34.28   18.46   26.66   24      10.43   10.90   10.90
3    16      12      16      24      18.46   21.81   34.28   18.46   26.66   24      10.43   10.90   10.90;

Table f(i,j) i. tip aracin j bolgesine yapacagi seferdeki tonaj degeri
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    13000   13000   13000   13000   13000   13000   13000   13000   13000   13000   13000   13000   13000
2    20000   20000   20000   20000   20000   20000   20000   20000   20000   20000   20000   20000   20000
3    25000   25000   25000   25000   25000   25000   25000   25000   25000   25000   25000   25000   25000;

scalar c  kiralik arac aylik sefer suresi /720/;

Variables
z
x(i,j) i. tip aracin j bolgesine yapacagi sefer sayisi
y(i)   kiralanacak i. tip aracin yapacagi sefer sayisi
;

integer variables
x(i,j), y(i) ;

equations
amac        amac fonksiyonu
kisit1      sefer sureleri kisiti
kisit2      dagitimi yapilacak mallarin yuk kisiti;

amac.. z =e= Sum(i,(Sum(j,(d(i,j)*x(i,j)+ (e(i)*y(i))))));
kisit1(i)..  sum(j, a(i,j)*x(i,j)) - (c)*sum(j,y(i)) =l= b(i);
kisit2(j)..  sum(i, f(i,j)*x(i,j)) =g= h(j);

Model dagitimproblemi /all/  ;
option LIMROW=40;  
option LIMCOL=40;
Solve dagitimproblemi using mip minimizing z;
display x.l , y.l