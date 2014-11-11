f= [5; 6];
A= [5 3;
   2 5;
   1 2];
b= [30; 95; 40];
lowerBound= [-10; 20];
upperBound= [10; 50];

[x, fval] = linprog(-f, A, b, [], [], lowerBound, upperBound)

[m, n] = size(A);

hold on
grid on
x1_min = -20; x1_max = 20;
x2_min = 10; x2_max = 60;
x1 = x1_min : 0.01 : x1_max;
x2 = x2_min : 0.1 : x2_max;
axis([x1_min x1_max x2_min x2_max]);
[X1, X2] = meshgrid(x1, x2);
F = f(1).*X1 + f(2).*X2;
[c, h] = contour(X1, X2, F, 'r-');

for i = 1 :m,
   G = A(i, 1).*X1 + A(i,2).*X2 - b(i);
   contour(X1, X2, G, [0 : 0.1 : 1.5], 'g-');   
   contour(X1, X2, G, [0 0], 'b-'); 
   gtext(sprintf('%d', i));
end

y = [5, 3; 2, 5]
a = [30, 95]
  