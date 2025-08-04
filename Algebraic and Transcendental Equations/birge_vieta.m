% Implements the Birge-Vieta Method to find a root of a polynomial.
% The polynomial coefficients are stored in vector 'a'.
% Polynomial represented:
%     P(x) = x^3 + 0*x^2 + 2*x - 1
% Iterations continue until the polynomial value at x is less than 10^(-15).
% Outputs the final polynomial value, root approximation, and iteration count.

a = [1 0 2 -1];
x = 1;
cont = 0;
n = length(a);

b = [a(1)];
c = [b(1)];

b(n) = 1;

while abs(b(n)) > 10^(-15)
  cont++;

  for i = 2:n-1
      b(i) = b(i-1) * x + a(i);
      c(i) = c(i-1) * x + b(i);
  end
  b(n) = b(n-1) * x + a(n);
  x = x - b(4)/c(3);
end
b(n)
x
cont