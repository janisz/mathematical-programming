function [ xk, k, line ] = GS_BFGS( zred_grad, zred_hes, x0, e)

Dk = eye(length(x0));
k = 0;
xk = x0;
sk = ones(length(x0), 1);
rk = ones(length(x0), 1);

grad = zred_hes*xk + zred_grad
line = [xk];
while (abs(grad) > e)
       
    line = horzcat(line,xk);
    
    dk = -Dk*grad
%    [a1, ~, a3] = przedzial_niepewnosci(@(alfa)fun(xk+alfa*dk), 0, 1);
%    ak = alfa_ZP(@(alfa)fun(xk+alfa*dk), a1, a3, 1e-4);

    ak = (-grad'*dk)/(dk'*zred_hes*dk)

    xk1 = xk + ak*dk;
    
    sk = xk1-xk;
    xk = xk1;
    
    grad1 = zred_hes*xk1 + zred_grad;
    
    rk = grad1 - grad;
    grad = grad1;
    
    Dk = Dk + rk'*(sk+Dk*rk)/(rk'*sk)^2*(sk*sk')-(sk*rk'*Dk+Dk*rk*sk')/(rk'*sk);
    k = k+1;    
end
line = horzcat(line,xk);
end

