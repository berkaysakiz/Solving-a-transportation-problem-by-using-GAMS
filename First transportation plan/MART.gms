sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*11/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye MART ayinda gonderilecek yuk miktarlari
/1 350452
2  180066
3  90994 
4  65178
5  105181
6  398188 
7  186002 
8  63734
9  153960
10 173496
11 73808/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11
1    154362  318981  67184   253201  147264  154362  45136   254670  151489  195910  319124
2    237480  490740  103360  389540  226560  237480  69440   391800  233060  301400  490960
3    296850  613425  129200  486925  283200  296850  86800   489750  291325  376750  613700;

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
y(i) kiralanacak i. tip aracin yapacagi sefer sayisi
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
display x.l , y.l ,z.l