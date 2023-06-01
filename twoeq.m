function dydt = twoeq (t,fi)
  dydt(1)=fi(2);
  dydt(2)=-9.8/10.*sin(fi(1));
  dydt=dydt';
endfunction
