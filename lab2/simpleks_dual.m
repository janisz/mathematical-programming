
function[x, exitflag, z] = simpleks_dual(f, A, b, lb)

[m, n] = size(A);
A = [[-A   eye(m)    -b ];
     [ f' zeros(1,m + 1)]];
exitflag = 1;

base = n+1:n+m;
[bmin, row] = min(-b);
while (bmin < 0)
   if A(row,1:m+n) >= 0
     exitflag = 0;
   end
   col = MaximumRatio(A(m+1,1:m+n),A(row,1:m+n));
   base(row) = col;
   A(row,:)= A(row,:)/A(row,col);
      for i = 1:m+1
      if i ~= row
         A(i,:)= A(i,:)-A(i,col)*A(row,:);
      end
   end
   [bmin, row] = min(A(1:m,m+n+1));
end
x = zeros(m+n,1);
x(base) = A(1:m,m+n+1);
x = x(1:n);
z = -A(m+1,m+n+1);

function col = MaximumRatio(a, b)
c = 1:length(a);
l = c(b < 0);
[mi, col] = max(a(l)./b(l));
col = l(col);
