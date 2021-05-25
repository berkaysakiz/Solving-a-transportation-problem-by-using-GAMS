sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*11/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye HAZIRAN ayinda gonderilecek yuk miktarlari
/1  369515
2  186250
3  40480
4  70355  
5  101410  
6  520502  
7  194350  
8  115702
9  178148  
10 180061
11 60920 
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11
1    165945  342901  72228   272194  158314  165945  48516   273767  162851  210600  343057
2    255300  527540  111120  418760  243560  255300  74640   421180  250540  324000  527780
3    319125  659425  138900  523450  304450  319125  93300   526475  313175  405000  659725;

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