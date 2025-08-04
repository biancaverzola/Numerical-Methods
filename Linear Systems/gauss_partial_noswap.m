% Gaussian Elimination with Partial Pivoting (No Row Swapping)
% Solves Ax = b using elimination with pivot selection, but without row swapping.
% Only the index vector 'o' is updated to track pivot positions.
% Outputs the modified matrix A, vector b, solution x, index vector o, and residual r = |b - Ax|.

a =[1 1 1.5 1 1.5 0 0 0 0 0;...
       0 1 0.01 0.51 1.5 0.5 0 0 0 0;...
       2.9 1 2 1 1 0 5 0 0 0;...
       9 1 0.2 1 1 0 0 1.5 0 0;...
       1 0 2 0 0 1 1 1 0 2;...
       0 1 0 0 -2 0 1 -1 1 1;...
       1 0 2 0 0 0 1 1 1 0;...
       0 1 0 0 2 0 1 1 1 -1;...
       0 0 1 0 2 1 -1 0 -1 -1;...
       0 1 0 0 2 0 1 0 1 1];
b = [4; -3; 1; -1; -1; 0; -1; 1; 3; -2];
a1 = a;  % Copy of A for residual calculation
b1 = b; % Copy of b for residual calculation
%x = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
n = length(b);

o = [1:n];

for (k = 1:n-1)
  pivo = abs(a(o(k), k));
  p = k;
  for (i = k+1:n)
    if (abs(a(o(i), k))>pivo)
      pivo = abs(a(o(i), k));
      p = i;
    endif
  endfor
  
  if (p>k)
    aux = o(k);
    o(k) = o(p);
    o(p) = aux;
  endif

  for (i = k+1:n)
    m = a(o(i), k)/a(o(k), k);
    for (j = k:n)
      a(o(i),j) = a(o(i), j) - m * a(o(k), j);
    endfor
    b(o(i)) = b(o(i)) - m * b(o(k));
  endfor
end

x(n) = b(o(n))/a(o(n), n);
for (i = n-1:-1:1)
  soma = 0;
  for (j = i+1:n)
    soma += a(o(i), j) * x(j);
  endfor
  x(i) = (b(o(i)) - soma)/a(o(i), i);
endfor

a
b
x
o
r = abs(b1 - a1*x')
