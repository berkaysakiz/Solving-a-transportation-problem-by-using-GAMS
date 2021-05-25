sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*11/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye TEMMUZ ayinda gonderilecek yuk miktarlari
/1  336750
2  114880
3  97885
4  58758   
5  79552  
6  454594  
7  236274  
8  141837
9  156917   
10 175752 
11 61596 
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11
1    178386  368628  77636   292604  170183  178386  52156   294307  175058  226395  368784
2    274440  567120  119440  450160  261820  274440  80240   452780  269320  348300  567360
3    343050  708900  149300  562700  327275  343050  100300  565975  336650  435375  709200;

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