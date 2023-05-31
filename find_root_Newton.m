function root=find_root_Newton(F, x0)
eps=1.e-4;
count=0;
x1=x2=x3=x0;
#syms z;
#d=diff(F,z);
d1=@(x)3*x.^2;
while((abs((x3-x2)/(1-(x3-x2)/(x2-x1)))>eps ||count<2) && count<40)
   ++count;
   x1=x2;
   x2=x3;
   #x3=x2-F(x2)*(eps/(F(x2+eps)-F(x2)));
   #x3=x2-F(x2)/double(subs(d,x2));
   x3=x2-F(x2)/d1(x2);
  endwhile
if(count<40) root=x3;
else root=100000000;
endif
