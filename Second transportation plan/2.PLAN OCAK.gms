*ikinci plan ocak ayi*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*13/;
      
parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye bolgesine ocak ayi gonderilecek yuk miktarlari
/1 86460
2  482428
3  196380
4  15910
5  44870
6  188872
7  83718
8  93610
9  1022915
10 248664
11 304638
12 69372
13 204550
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    143845  139490  143845  171990  145990  157742  220142  146497  187291  171990  132145  135993  132145
2    221300  214600  221300  264600  224600  242680  338680  225380  288140  264600  203300  209220  203300
3    276625  268250  276625  330750  280750  303350  423350  281725  360175  330750  254125  261525  254125;

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
y(i) kiralanacak i. tip aracin yapacagi sefer sayisi
;

integer variables
x(i,j), y(i) ;

equations
amac        amac fonksiyonu
kisit1      sefer sureleri kisiti
kisit2      dagitimi yapilacak mallarin yuk kisiti
;

amac.. z =e= Sum(i,(Sum(j,(d(i,j)*x(i,j)+ (e(i)*y(i))))));
kisit1(i)..  sum(j, a(i,j)*x(i,j)) - (c)*sum(j,y(i)) =l= b(i);
kisit2(j)..  sum(i, f(i,j)*x(i,j)) =g= h(j);

Model dagitimproblemi /all/  ;
option LIMROW=40;  
option LIMCOL=40;
Solve dagitimproblemi using mip minimizing z;
display x.l , y.l