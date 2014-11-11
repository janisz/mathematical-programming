 f = [30,95,40,-10,20,10,50]
 b = [5,6]
 A = [5,2,1,1,0,1,0;3,5,2,0,1,0,1]
lb = [0, 0, 0, 0, 0, -inf, -inf] 
up = [inf,inf,inf,inf,inf,0,0]

options = optimset('linprog');
options = optimset(options, 'largeScale', 'off');
options = optimset(options, 'simplex', 'on');
[x, fval, exitflag, output, lambda] = linprog(-f, [], [], A, b, lb, up, [], options)