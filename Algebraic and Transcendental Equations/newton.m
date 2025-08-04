% Implements Newton's Method to find a root of the function:
% f(x) = e^x - 2*cos(x) starting from the initial guess x = 0.
% The algorithm iterates until |f(x)| < 10^(-15).
% It outputs the approximate root, the function value at the root,
% and the number of iterations performed.

function newton
    cont = 0;
    x = 0;
    fx = funcao(x);
    while (abs(fx) > 10^(-15))
        x = x - fx/derivada(x);
        fx = funcao(x);
        cont++;
    end
    
    x
    fx
    cont
end

function fx=funcao(x)
    fx = exp(x) - 2*cos(x);
end

function dx=derivada(x)
    dx = exp(x) + 2*sin(x);
end