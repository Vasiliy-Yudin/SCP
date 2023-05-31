function root=find_root_dychotomy(F,l_b,r_b)
  eps=1.e-10;
 while(r_b-l_b>eps)
    mid=l_b+(r_b-l_b)/2;
    if(sign(F(mid))==sign(F(l_b))) l_b=mid;
    elseif(sign(F(mid))==sign(F(r_b))) r_b=mid;
  else break;
  endif
 endwhile
 root=mid;

