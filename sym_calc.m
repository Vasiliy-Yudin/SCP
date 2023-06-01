#сивольные вычисления
#pkg load symbolic;
#syms y(t);
#DE=diff(y,t)-y==0;
#sol=dsolve(DE)
#для решения задачи Коши
#sol=dsolve(DE,y(0)==1)

#DE=diff(y,t)-2*y/t==0;
#soll=dsolve(DE,y(-1)==1)

#DE=diff(y,t,2)+y==0;
#soll=dsolve(DE)

#система уравнения
##syms x(t) y(t);
##ode_sys=[diff(x(t),t)==y(t);diff(y(t),t)==x(t)];
##soln=dsolve(ode_sys);
##sx=soln.x
##sy=soln.y

#рисование
##syms y(x);
##de=diff(y(x),x)-0.2*x*y(x)==0;
##sol=dsolve(de,y(0)==0.3);
##x_val=linspace(-5,5,100);
##sol_f=function_handle(sol);
##plot(x_val,sol_f(x_val),'r')

#численные методы решения
#[t,y]=odesolver(function_handle,[initial_time,final_time],
#[initial_cond_array])
#ode45() - метод Рунге-Кутта 4-шаговый
#dydt=@(t,y)2*t;
#dy/dt=2t с начальный условием y(-1)=1
#ode45(dydt,[-1 1],1)
#[t,y]=ode45(dydt,[-1 1],1)

#система
##A=pi/4;
##w0=0;
##tspan=0:0.1:10;
##[t,fi]=ode45(@twoeq,tspan,[-A w0])
##plot(t,fi(:,1));
##axis([0 11])

#рисование маятника
A=pi/4;
w0=0;
L=10;
tspan=-L*sin(A)-1:0.05:L*sin(A)+1;
[t,fi]=ode45(@twoeq,tspan,[-A w0]);
fi=fi(:,1)';
plot(t,fi);
set(gca,'box','off');
set(gca,'xaxislocation','origin');
set(gca,'yaxislocation','origin');
hold on;
axis([-L*sin(A)-1 L*sin(A)+1 -L-1 A+1]);
#plot([-L*sin(A)-1 L*sin(A)+1],[0,0],'r');
#hold on;
#plot([0,0],[-L-1,A+1],'r');
#hold on;
pr=plot([0,L*cos(-pi/2+fi(1))],[0,L*sin(-pi/2+fi(1))]);
red_dot=plot(t(1),fi(1),'ro');
m_dot=plot(L*sin(fi(1)),L*cos(fi(1)),'ro');
for i=2:size(fi)(2)
  set(red_dot,'XData',t(i),'YData',fi(i));
  set(pr,'XData',[0,L*sin(fi(i))],'YData',[0,-L*cos(fi(i))]);
  set(m_dot,'XData',L*sin(fi(i)),'YData',-L*cos(fi(i)));
  drawnow;
  pause(0.05);
endfor
