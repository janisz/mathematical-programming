function [D,c,Aeq,beq]=p3()
    D=[ 2 1 -2 1; 
        1 1  0 0; 
       -2 0  1 0
        1 0  0 2];
    c=[-3;1;3;0];
    
    Aeq=[1 1 1 1];
    beq=1;
end