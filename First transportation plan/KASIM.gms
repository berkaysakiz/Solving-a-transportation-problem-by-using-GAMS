sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*11/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/
1 13
2  20
3  25
/

h(j) j. bolgeye KASIM ayinda gonderilecek yuk miktarlari
/
1  568654
2  312221
3  112357 
4  96179    
5  116638 
6  603478 
7  209592 
8  211037 
9  219387    
10 188853
11 113126
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11
1    206141  425984  89726   338143  196664  206141  60268   340106  202306  261625  426179
2    317140  655360  138040  520220  302560  317140  92720   52340   311240  402500  655660
3    396425  819200  172550  650275  378200  396425  115900  654050  389050  503125  819575;

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