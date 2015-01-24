function [c,ceq, cgrad, ceqgrad] = nonlconstr(x)
c = [
    x(1)^2 - x(2)^2 + 2*x(3) - 9;
    -x(1) + x(2)^2 + x(3)^2;    
];
ceq = [];

cgrad = [
    2*x(1), -4*x(2), 2;
    -1, 2*x(2), 2*x(3);  
    ]'

ceqgrad = [];