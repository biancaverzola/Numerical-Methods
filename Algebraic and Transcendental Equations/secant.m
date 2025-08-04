% Implements the Secant Method to find a root of the function:
% f(x) = e^x - 2*cos(x) using initial approximations x0 = 0 and x1 = 2.
% The algorithm stops when |f(x)| < 10^(-15).
% It outputs the approximate root, the function value at the root,
% and the number of iterations performed.

function secant
    cont = 0;
    x_atual = 2;
    x_ant = 0;
    fx = funcao(x_atual);
    fx_ant = funcao(x_ant);

    while (abs(fx) > 10^(-15))
        x = x_atual - (x_atual - x_ant)*fx/(fx - fx_ant);
        x_ant = x_atual;
        x_atual = x;
        fx_ant = fx;
        fx = funcao(x);
        cont++;
    end
    
    x
    funcao(x)
    cont
end

function fx=funcao(x)
    fx = exp(x) - 2*cos(x);
end
