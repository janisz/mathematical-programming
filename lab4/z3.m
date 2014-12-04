x0 = [-3;2];
e = 1e-6;
[x,y, l] = GS_BFGS( @fun1, x0, e)
options = optimset('GradObj','off');
[f_min_unc, val] = fminunc(@fun1, x0, options)
options = optimset('GradObj','on');
[f_min_unc, val] = fminunc(@fun1, x0, options)
[f_min_search, val] = fminsearch(@fun1, x0)

hold on
grid on
x1_min = -5; x1_max = 5;
x2_min = -5; x2_max = 5;
x1 = x1_min : 0.01 : x1_max;
x2 = x2_min : 0.1 : x2_max;
axis([x1_min x1_max x2_min x2_max]);
[X1, X2] = meshgrid(x1, x2);


contour(X1, X2, X1.^2.+X2.^4.+2.*X1.^2.*X2.^2.-4.*X1+3);   
line(l)
