# Implements the Bisection Method to find a root of the function:
# f(x) = e^x - 2*cos(x) in the interval [0, 2].
# The algorithm iterates until |f(xm)| < 10^(-15).
# It prints the approximate root, the function value at that root,
# and the number of iterations performed.

import math

def f(x):
  fx = math.e**(x) - 2*math.cos(x)
  return fx


a = 0
b = 2
fa = f(a)
fb = f(b)
fxm = 1
cont = 0

while (abs(fxm) > 10**(-15)):
  xm = (a+b)/2
  fxm = f(xm)
  if (fa*fxm < 0):
    b = xm
  else:
    a = xm
    fa = fxm
  cont += 1

print('xm =', xm)
print('f(xm) =', fxm)
print('counter =', cont)
