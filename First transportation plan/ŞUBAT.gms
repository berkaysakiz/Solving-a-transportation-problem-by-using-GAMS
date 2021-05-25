*birinci plan subat ayi*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*11/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye şubat ayinda gonderilecek yuk miktarlari
/1 245274
2  238050
3  74310
4  107789
5  88254
6  394802
7  293502
8  143679
9  170490
10 225654
11 158501/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11
1    143598  296725  62491   235534  136994  143598  41990   236899  140920  182247  296855
2    220920  456500  96140   362360  210760  220920  64600   364460  216800  280380  456700
3    276150  570625  120175  452950  263450  276150  80750   455575  271000  350475  570875;

Table a(i,j) i. tip aracin j bolgesine bir sefer yapmasi gereken suresi
     1       2       3       4       5       6       7       8       9       10      11
1    16      24      6       18.46   12      16      2.18    20      15      17.14   26.66
2    16      24      6       18.46   12      16      2.18    20      15      17.14   26.66
3    16      24      6       18.46   12      16      2.18    20      15      17.14   26.66;

Table f(i,j) i. tip aracin j bolgesine yapacagi seferdeki tonaj degeri
     1       2       3       4       5       6       7       8       9       10      11
1    13000   13000   13000   13000   13000   13000   13000   13000   13000   13000   13000
2    20000   20000   20000   20000   20000   20000   20000   20000   20000   20000   20000   
3    25000   25000   25000   25000   25000   25000   25000   25000   25000   25000   25000;   

scalar c  kiralik arac aylik sefer suresi /720/;

Variables
z
x(i,j) i. tip aracin j bolgesine yapacagi sefer sayisi
y(i)   kiralanacak i. tip aracin yapacagi sefer sayisi;

integer variables
x(i,j), y(i) ;

equations
amac        amac fonksiyonu
kisit1      sefer sureleri kisiti
kisit2      dagitimi yapilacak mallarin yuk kisiti;

amac.. z =e= Sum(i,(Sum(j,(d(i,j)*x(i,j)+ (e(i)*y(i))))));
kisit1(i)..  sum(j, a(i,j)*x(i,j)) - (c)*sum(j,y(i)) =l= b(i);
kisit2(j)..  sum(i, f(i,j)*x(i,j)) =g= h(j);


Model dagitimproblemi /all/;
option LIMROW=40;  
option LIMCOL=40;
Solve dagitimproblemi using mip minimizing z;
display x.l , y.l
