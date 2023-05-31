#for explicit surface:
##x0=0; y0=-0.5; #point for normal vector
##F=@(x,y)2+x.^2-y.^2; #surface
###the area of the surface assignment
##a=-pi:0.1:pi;
##b=-pi:0.1:pi;
##[x,y]=meshgrid(a,b);
##surf(x,y,F(x,y));
##syms x y z;
##d=[diff(F,x),diff(F,y),"-1"]
##d_x0_y0=double(subs(subs(d,x,x0),y,y0))
##m_d=sqrt(sum(d_x0_y0.^2))
##side=1;
##n=[x0 y0 F(x0,y0)]+((-1)^side)*d_x0_y0./m_d
##hold on;
##axis equal;
##plot3([x0,n(1)],[y0,n(2)],[F(x0,y0),n(3)],'color','r', 'LineWidth',2);

#for parametric surface:
##clear;
##u0=0; v0=-0.5; #point for normal vector
###surface
##syms u v;
##x=@(u,v) cos(u).* sin(v);
##y=@(u,v) sin(u).* sin(v);
##z=@(u,v) cos(v);
##a=0:0.1:2*pi;
##b=-pi:0.1:pi;
##[u1,v1]=meshgrid(a,b);
##X=x(u1,v1);
##Y=y(u1,v1);
##Z=z(u1,v1);
##surf(X,Y,Z);
##dxu=eval(['@(u,v)' char(diff(x,u))]);
##dxv=eval(['@(u,v)' char(diff(x,v))]);
##dyu=eval(['@(u,v)' char(diff(y,u))]);
##dyv=eval(['@(u,v)' char(diff(y,v))]);
##dzu=eval(['@(u,v)' char(diff(z,u))]);
##dzv=eval(['@(u,v)' char(diff(z,v))]);
##n_z=z(u0,v0)+dxu(u0,v0)*dyv(u0,v0)-dxv(u0,v0)*dyu(u0,v0);
##n_x=x(u0,v0)+dyu(u0,v0)*dzv(u0,v0)-dyv(u0,v0)*dzu(u0,v0);
##n_y=y(u0,v0)+dzu(u0,v0)*dxv(u0,v0)-dzv(u0,v0)*dxu(u0,v0);
##l=sqrt(n_x.^2+n_y.^2+n_z.^2);
##hold on;
##axis equal;
##plot3([x(u0,v0),n_x],[y(u0,v0),n_y],[z(u0,v0),n_z],'color','r', 'LineWidth',2);
