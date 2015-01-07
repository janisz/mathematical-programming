function [ x, yk, exitflag ] = eliminacja( H, f, Aeq, beq )

    [Q, R] = qr(Aeq');

    n = length(Q);
    m = length(beq);
    
    R = R(1:m,:);
    
    Q1 = Q(:, 1:m);
    Q2 = Q(:, m+1:end);
    
    S = Q1/R';
    Z = Q2;
    
    x0 = S*beq;
    
    yk = -inv(Z'*H*Z)*Z'*(H*x0+f);
    
    x = x0 + Z*yk;
    
    [~, exitflag] = chol(H);
    
    
   
end

