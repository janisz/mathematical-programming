V = [ +1,+1;
      -1,+1;
      -1,-1;
      +1,-1;];
[actual,y0,dV,dy,P,Q] = nelder(@himmelblau,V,5,25,1e-10,0);

actual
expected = [3, 2]

V = [ 3, 4;
     -2, 2;
      1, 1 ];
[actual,y0,dV,dy,P,Q] = nelder(@himmelblau,V,5,25,1e-10,0);

actual
expected = [-2.80512,  3.13134]

V = [ 1,  4;
      2,  3;
      1, -4 ];
[actual,y0,dV,dy,P,Q] = nelder(@beale,V,5,25,1e-10,0);

actual
expected = [3, 0.5]
