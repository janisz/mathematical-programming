
function[A, base, x, z] = sympleks(c, A, b)

c = -c;

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

[mi, col] = min(A(m+1,1:m+n));
base = n+1:m+n
while (~isempty(mi) & mi < 0 & abs(mi) > eps)
   t = A(1:m,col);
   row = MinimumRatio(A(1:m,m+n+1),A(1:m,col));
   if ~isempty(row)
      A(row,:)= A(row,:)/A(row,col);
      base(row) = col;
      for i = 1:m+1
         if i ~= row
            A(i,:)= A(i,:)-A(i,col)*A(row,:);
         end
      end
   end
   [mi, col] = min(A(m+1,1:m+n));
   disp(sprintf('     ________________________________________________'))
   A
   base
   disp(sprintf('     ________________________________________________'))
end
z = A(m+1,m+n+1);
x = zeros(1,m+n);
x(base) = A(1:m,m+n+1);
x = x(1:n)';

function [row, mi] = MinimumRatio(a, b)
m = length(a);
c = 1:m;
a = a(:);
b = b(:);
l = c(b > 0);
[mi, row] = min(a(l)./b(l));
row = l(row);
