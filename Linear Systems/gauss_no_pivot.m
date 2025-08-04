% Solves the linear system Ax = b using.
% Method: Gauss without pivoting
% Matrix A:
%     [4   2   3;
%      2  -4  -1;
%     -1   1   4]
% Vector b:
%     [7; 1; -5]

a = [4 2 3;2 -4 -1;-1 1 4]
b = [7; 1; -5]
n = 3;

for (k = 1:n-1)
  for (i = k+1:n)
    m = a(i, k)/a(k, k);
    for (j = k:n)
      a(i,j) = a(i, j) - m * a(k, j);
    endfor
    b(i) = b(i) - m * b(k);
  endfor
end

x(n) = b(n)/a(n, n);
for (i = n-1:-1:1)
  soma = 0;
  for (j = i+1:n)
    soma += a(i, j) * x(j);
  endfor
  x(i) = (b(i) - soma)/a(i, i);
endfor
x