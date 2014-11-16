[a1, a2, a3] = przedzial_niepewnosci(@(x) x^2, -1)
assert([a1 ,a2, a3], [-1, 0, 1])
[a1, a2, a3] = przedzial_niepewnosci(@(x) sin(x), -1, 1.5)
assert([a1 ,a2, a3], [-1, -0.5, 0])
