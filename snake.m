n=5;
r=0.5
rad2_x=-r:0.01:r;
move_function=@(x)cos(x)
y_top=@(x,r,x0,y0)sqrt(r^2-(x-x0).^2)+y0;
y_bottom=@(x,r,x0,y0)-sqrt(r^2-(x-x0).^2)+y0;
x0_arr=2*r*(n-1);
plots=[];
#find first centres
    x0_arr=[x0_arr+0.1]
    for j=1:n-1
      x0=x0_arr(1)
      while((x0-x0_arr(1))^2+
      (move_function(x0)-move_function(x0_arr(1)))^2-
      4*r^2<=0.01)
      x0-=1.e-2
      endwhile
      x0_arr=[x0,x0_arr]
    endfor
#first plots
for x_c =x0_arr
  p_t=plot(x_c+rad2_x,y_top(x_c+rad2_x,r,x_c,move_function(x_c)));
  hold on;
  p_b=plot(x_c+rad2_x,y_bottom(x_c+rad2_x,r,x_c,move_function(x_c)));
  set(p_t,'color','g','linewidth',2);
  set(p_b,'color','g','linewidth',2);
  axis([-r-1 2*r*n-r+7*pi -(r*n+3*pi) r*n+3*pi]);
  axis equal;
  plots=[plots;p_t,p_b];
endfor
pause(0.1)
#сдвиги
for k=0:0.1:6*pi
  #find new centres
  x0_arr=[x0_arr(n)+0.1]
  for j=1:n-1
    x0=x0_arr(1)
    while((x0-x0_arr(1))^2+
    (move_function(x0)-move_function(x0_arr(1)))^2-
    4*r^2<=0.01)
    x0-=1.e-2
    endwhile
    x0_arr=[x0,x0_arr]
  endfor
  #repaint
  for i =1:size(plots)(1)
      set(plots(i,1),'XData',x0_arr(i)+rad2_x,
      'YData',y_top(x0_arr(i)+rad2_x,r,x0_arr(i),move_function(x0_arr(i))))
      set(plots(i,2),'XData',x0_arr(i)+rad2_x,
      'YData',y_bottom(x0_arr(i)+rad2_x,r,x0_arr(i),move_function(x0_arr(i))))
      drawnow;
  endfor
endfor

