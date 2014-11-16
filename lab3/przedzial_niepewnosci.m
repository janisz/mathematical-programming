function [a1, a2, a3] = przedzial_niepewnosci(F, a0, delta)

if nargin < 3
  delta = 1
end

a1 = a0

punktProbny = a1 + delta;

if (F(a1) <= F(punktProbny))
  a3 = punktProbny
  a2 = (a1+a3)/2
  while (warunke3P(F, a1, a2 , a3) == 1)
    a2 = (a1+a2)/2
  end
else
  a2 = punktProbny
  a3 = a2 + delta
  while (~warunke3P(F, a1, a2 , a3))
    delta = 2*delta
    a3 = a2 + delta
  end
end


function [spelnia] = warunke3P(F, a1, a2, a3)

spelnia = ((a1 < a2 && a2 < a3) && (F(a1) > F(a2) && F(a3) > F(a2)))
