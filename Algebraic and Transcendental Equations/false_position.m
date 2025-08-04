% Implements the False Position Method to find a root of the function:
% f(x) = e^x - 2*cos(x) in the interval [0, 2].
% The algorithm iterates until |f(xm)| < 10^(-15).
% It outputs the approximate root, the function value at that root,
% and the number of iterations performed.

function false_position
    a = 0;
    fa = funcao(a);
    b = 2;
    fb = funcao(b);
    fxm = 1;
    cont = 0;
    while (abs(fxm) > 10^(-15))
        xm = a - fa*(b-a)/(fb-fa);
        fxm = funcao(xm);
        if (fa*fxm > 0)
            a = xm;
            fa = fxm;
        else
            b = xm;
            fb = fxm;
        end
        cont++;
    end
    xm
    fxm
    cont
end

function fx=funcao(x)
    fx = exp(x) - 2*cos(x);
end
