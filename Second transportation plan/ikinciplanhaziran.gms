*ikinci plan haziran*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*13/;

parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye haziran ayi gonderilecek yuk miktarlari
/1 71389
2  245455
3  208014
4  36854
5  47096
6  164380
7  58474
8  76750
9  821718
10 196336
11 324260
12 97370
13 224728
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    166231  161200  166231  198752  168701  182286  254392  169299  216450  198757  152711  157157  152711
2    255740  248000  255740  305780  259540  280440  391380  260460  333000  305780  234940  241780  234940
3    319675  310000  319675  382225  324425  350550  489225  325575  416250  382225  293675  302225  293675;

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