function [ xk, k, line ] = GS_BFGS( fun, x0, e)

Dk = eye(length(x0));
k = 0;
xk = x0;
sk = [0,0,0];
rk = [0,0,0];

[val, grad] = fun(xk)
line = [xk]
while (abs(grad) > e)
    
    if (mod(k, 10) == 0)
        Dk = eye(length(x0));
    end
    
    line = horzcat(line,xk);
    
    dk = -Dk*grad;
    [a1, a2, a3] = przedzial_niepewnosci(@(alfa)fun(xk+alfa*dk), 0, 1);
    ak = alfa_ZP(@(alfa)fun(xk+alfa*dk), a1, a3, 1e-4);
    xk1 = xk + ak*dk;
    
    sk = xk1-xk;
    xk = xk1;
    
    [val, grad1] = fun(xk1);
    
    rk = grad1 - grad;
    grad = grad1;
    
    Dk = Dk + rk'*(sk+Dk*rk)/(rk'*sk)^2*(sk*sk')-(sk*rk'*Dk+Dk*rk*sk')/(rk'*sk);
    k = k+1;    
end
line = horzcat(line,xk);
end

