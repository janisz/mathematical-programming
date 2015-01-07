function [ x, yk, exitflag ] = eliminacja_BFGS( H, f, Aeq, beq )

    [Q, R] = qr(Aeq');

    n = length(Q);
    m = length(beq);
    
    R = R(1:m,:);
    
    Q1 = Q(:, 1:m);
    Q2 = Q(:, m+1:end);
    
    S = Q1/R';
    Z = Q2;
    
    x0 = S*beq;
    
    %yk = -inv(Z'*H*Z)*Z'*(H*x0+f);
    zred_hes = Z'*H*Z
    zred_grad = Z'*(H*x0+f)
    x_zero = zeros(1, length(zred_grad))
    yk = GS_BFGS(zred_hes, zred_grad, x_zero, 1e-6);
    
    x = x0 + Z*yk;
    
    [~, exitflag] = chol(H);
   
end

