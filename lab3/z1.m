x0 = [1;-1;2]
[val gradient] = fun(x0)
d0 = -gradient
[a1, a2, a3] = przedzial_niepewnosci(@(alfa)fun(x0+alfa*d0), 0, 0.1)
fplot(@(alfa)fun(x0+alfa*d0), [0, 0.01]);

fminbnd(@(alfa)fun(x0+alfa*d0), 0, 0.01)

ZP(@(alfa)fun(x0+alfa*d0), 0, 0.01, 0.00000001)
