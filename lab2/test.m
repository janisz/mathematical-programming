f = [-1,3,-2,8,-10];
A = [3,-1,2,4,5;
    -2,4,0,-5,8;
    -4,3,8,20,2;
    ];
b = [7;12;7];
lb = [-10;-5;-30;-8;-20];
[x1, fval] = linprog(-f', A, b, [], [], zeros(5,1), [])
[x2, exitflag, z] = simpleks_dual(-f', A, b, zeros(5,1))

assert(exitflag, 1)
assert(x2, x1)


[x1, fval] = linprog(-f', A, b, [], [], lb, []);
[x2, exitflag, z] = simpleks_dual(-f', A, b, lb);

assert(exitflag, 1)
assert(z, fval)
assert(x2, x1)
