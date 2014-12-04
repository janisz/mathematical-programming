function [ val, gradient ] = fun1(x)
val = (x(1)^2 + x(2)^4 + 2*x(1)^2*x(2)^2 - 4*x(1)+3);

gradient = [
    2*x(1)+4*x(2)^2*x(1)-4;
    4*x(2)^3+4*x(1)^2*x(2)
];