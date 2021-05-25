*ikinci plan kasim*
sets  i arac turleri sayisi /1,2,3/
      j bolge sayisi /1*13/;

parameter
 
e(i) kiralanacak i. tip aracin yapacagi sefer maliyeti
/1 13
2  20
3  25
/

h(j) j. bolgeye kasim ayi gonderilecek yuk miktarlari
/1 127504
2  350954
3  403378
4  83601
5  80960
6  355080
7  49778
8  138248
9  1281918
10 155432
11 448540
12 129116
13 402964
/

b(i) i. tip aracin j bolgesine en fazla sefer yapabilecegi suresi
/1 30240
2  17280
3  6480/;


Table d(i,j) i. tip aracin j bolgesine yapacagi sefer maliyeti
     1       2       3       4       5       6       7       8       9       10      11      12      13
1    206505  200265  206505  246909  209586  226460  316043  210314  268892  246909  189709  195247  189709
2    317700  308100  317700  379860  322440  348400  486220  32356   413680  379860  291860  300380  291860
3    397125  385125  397125  474825  403050  435500  607775  404450  517100  474825  364825  375475  364825;

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