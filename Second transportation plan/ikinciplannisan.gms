*ikinci plan nisan*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*13/;

parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye nisan ayi gonderilecek yuk miktarlari
/1 81372
2  95260
3  298204
4  34950
5  85110
6  196668
7  32050
8  82770
9  896952
10 200230
11 278295
12 43295
13 214620
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    154635  149955  154635  184886  156936  169572  236652  157482  201344  184886  142051  146198  142051
2    237900  230700  237900  284440  241440  260880  364080  242280  309760  284440  218540  224920  218540
3    297375  288375  297375  355550  301800  326100  455100  302850  387200  355550  273175  281150  273175;

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