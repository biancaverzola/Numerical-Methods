% Gaussian Elimination with Partial Pivoting and Row Swapping
% Given linear system: Ax = b

a =[1 1 1.5 1 1.5 0 0 0 0 0;
       0 1 0.01 0.51 1.5 0.5 0 0 0 0;
       2.9 1 2 1 1 0 5 0 0 0;
       9 1 0.2 1 1 0 0 1.5 0 0;
       1 0 2 0 0 1 1 1 0 2;
       0 1 0 0 -2 0 1 -1 1 1 ;
       1 0 2 0 0 0 1 1 1 0;
       0 1 0 0 2 0 1 1 1 -1;
       0 0 1 0 2 1 -1 0 -1 -1;
       0 1 0 0 2 0 1 0 1 1];
b = [4 -3 1 -1 -1 0 -1 1 3 -2];
a1 = a;  %copia para residuo
b1 = b; %copia para residuo
x = [0 0 0 0 0 0 0 0 0 0];
n = length(b);

for (k = 1:n-1)
  pivo = abs(a(k, k));
  p = k;
  for (i = k+1:n)
    if (abs(a(i, k))>pivo)
      pivo = abs(a(i, k));
      p = i;
    endif
  endfor
  
  if p>k
    for (j = k:n)
      aux = a(k, j);
      a(k, j) = a(p, j);
      a(p, j) = aux;
    endfor
    aux = b(k);
    b(k) = b(p);
    b(p) = aux;
  endif
  
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

a
b
x
r = abs(b1' - a1*x')
