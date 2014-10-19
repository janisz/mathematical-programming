
function[A, subs, x, z] = simplex(type, c, A, b);

% The simplex algorithm for the LP problem
%
%                    min(max) z = c*x
%                 Subject to: Ax <= b
%                              x >= 0
%
% Vector b must be nonnegative.
% For the minimization problems the string type = 'min',
% otherwise type = 'max'.
% Output parameters:
% A - final tableau of the simplex method
% subs - indices of the basic variables in the final tableau
% x - optimal solution
% z - value of the objective function at x.
%
% See http://en.wikipedia.org/wiki/Simplex_algorithm

if any(b < 0)
   error(' Right hand sides of the constraint set must be nonnegative.')
end
if type == 'min'
   tp = -1;
else
   tp = 1;
   c = -c;
end
[m, n] = size(A);
A = [A eye(m)];
b = b(:);
c = c(:)';
A = [A b];
d = [c zeros(1,m+1)];
A = [A;d];

   disp(sprintf('     ________________________________________________'))
   A
   disp(sprintf('     ________________________________________________'))

[mi, col] = BlandsRule(A(m+1,1:m+n));
subs = n+1:m+n;
while (~isempty(mi) & mi < 0 & abs(mi) > eps)
   t = A(1:m,col);
   if all(t <= 0)
      disp(sprintf('\n       Problem has unbounded objective function'));
      x = zeros(n,1);
      if tp == -1
         z = -inf;
      else
         z = inf;
      end
      return;
   end
   row = MinimumRatio(A(1:m,m+n+1),A(1:m,col));
   if ~isempty(row)
      A(row,:)= A(row,:)/A(row,col);
      subs(row) = col;
      for i = 1:m+1
         if i ~= row
            A(i,:)= A(i,:)-A(i,col)*A(row,:);
         end
      end
   end
   [mi, col] = BlandsRule(A(m+1,1:m+n));
   disp(sprintf('     ________________________________________________'))
   A
   disp(sprintf('     ________________________________________________'))
end
z = tp*A(m+1,m+n+1);
x = zeros(1,m+n);
x(subs) = A(1:m,m+n+1);
x = x(1:n)';

function [row, mi] = MinimumRatio(a, b)

% The Minimum Ratio Test (MinimumRatio) performed on vectors a and b.
% Output parameters:
% row - index of the pivot row
% mi - value of the smallest ratio.

m = length(a);
c = 1:m;
a = a(:);
b = b(:);
l = c(b > 0);
[mi, row] = min(a(l)./b(l));
row = l(row);

function [m, j] = BlandsRule(d)

% Implementation of the Bland's rule applied to the array d.
% Output parameters:
% m - first negative number in the array d
% j - index of the entry m.
% See http://en.wikipedia.org/wiki/Bland%27s_rule


ind = find(d < 0);
if ~isempty(ind)
   j = ind(1);
   m = d(j);
else
   m = [];
   j = [];
end
