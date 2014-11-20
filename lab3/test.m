x0 = [1;-1;2];
[val gradient] = fun(x0);
d0 = -gradient;
[a1, a2, a3] = przedzial_niepewnosci_octave(@(alfa)fun(x0+alfa*d0), 0);
[a1, a2, a3]
[a1, a2, a3] = przedzial_niepewnosci_octave(@(alfa)fun(x0+alfa*d0), 0, 0.00001);
[a1, a2, a3]
[a1, a2, a3] = przedzial_niepewnosci(@(x) x^2, -1)
assert([a1 ,a2, a3], [-1, 0, 1])
[a1, a2, a3] = przedzial_niepewnosci(@(x) cos(x), -0.01, 6.29)
assert([a1 ,a2, a3], [-0.01, 3.135, 6.28])
[a1, a2, a3] = przedzial_niepewnosci(@(x) (x^3+x^2), -0.5, 175)
assert([a1 ,a2, a3], [-0.5, 0.183594, 174.5])
