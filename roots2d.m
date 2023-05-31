###f(x)=0, x-?
###fzero:
##
##tic
##x=[-5:0.1:5];
##fun=@(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
##plot(x,fun(x));
##hold on;
##plot(x,0*x);
##inv=fzero(fun,-5)
###fzero(fun,-5)
##for t=x
##  k=fzero(fun,t);
##  if(isempty(find(abs(inv-k)<=0.1)))
##    k;
##    inv=[inv k];
##   endif
##endfor
##hold on;
##inv=inv(find(abs(inv)<=5))
##plot(inv,fun(inv),'ro')
##toc
##
###Newton
##
##tic
##x=[-5:0.1:5];
##fun=@(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
##plot(x,fun(x));
##hold on;
##plot(x,0*x);
##inv=find_root_Newton(fun,-5)
##for t=x
##  k=find_root_Newton(fun,t);
##  if(isempty(find(abs(inv-k)<=0.1)))
##    k;
##    inv=[inv k];
##   endif
##endfor
##hold on;
##inv=inv(find(abs(inv)<=5))
##plot(inv,fun(inv),'ro');
##toc
##
###dychotomy
##
##tic
##x=[-5:0.1:5];
##fun=@(x)1+(1+sin(x)-cos(x)).^2-(sin(2*x)-cos(2*x)-0.2).^2;
##plot(x,fun(x));
##hold on;
##plot(x,0*x);
##boards=x(1);
##sgn=sign(fun(x(1)));
##for i=x
##  if(sign(fun(i))==-sgn)
##    boards=[boards i];
##    sgn=-sgn;
##  endif
##endfor
##roots=[];
##for i=[2:(size(boards)(2))]
##  roots=[roots find_root_dychotomy(fun, boards(i-1),boards(i))];
##endfor
##hold on;
##plot(roots,fun(roots),'ro');
##toc
