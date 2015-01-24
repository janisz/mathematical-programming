function [ val, gradient ] = fun(x)
val = (3*x(1)^2 + x(2)^2 - x(1) - 4*x(2) + x(3));
gradient = [
  6*x(1) - 1;
  2*x(2) - 4;
  1;  
];