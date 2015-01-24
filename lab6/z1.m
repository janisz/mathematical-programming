f=@(x)(3*x(1)^2 + x(2)^2 - x(1) - 4*x(2) + x(3));

A = [];
b = [];
lb = [1 0 0];

x0 = [-1 -1 -1];

options = optimset('fmincon');
options = optimset(options,'GradObj','on');
options = optimset(options,'GradConstr','on');

x = fmincon(@fun,x0,[],[],[],[],lb,[],@nonlconstr, options)

