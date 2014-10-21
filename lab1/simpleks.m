
function[x, exitflag] = simpleks(f, A, b, lb)

[m, n] = size(A)
b = [b; -lb];
A = [[[[[     A        -A                      ];
        [   -eye(n)   eye(n)]]   eye(m+n) ]  b ];
        [     f'       -f'     zeros(1,m+n+1)  ];
];

m = m+n;
n = 2*n;
[mi, col] = min(A(m+1,1:m+n));
base = n+1:m+n

if any(b < 0)
   exitflag = 0
end

while (~isempty(mi) & mi < 0 & abs(mi) > eps)
   t = A(1:m,col);
   if all(t <= 0)
      x = zeros(n,1)
      exitflag = 0;
      return;
   end
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
end

x = zeros(1,m+n);
x(base) = A(1:m,m+n+1);
x = x(1:n)';
x = x(1:length(x)/2) - x(length(x)/2+1:end)
exitflag = 1

function row = MinimumRatio(a, b)
m = length(a);
c = 1:m;
l = c(b > 0);
[mi, row] = min(a(l)./b(l));
row = l(row);
