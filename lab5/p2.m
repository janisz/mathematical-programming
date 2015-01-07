function [D,c,Aeq,beq]=p2()
    D=[8 1 -2; 
       1 3 0; 
       -2 0 1];
    c=[-3;1;5];
    
    Aeq=[1 2 -1; -1 1 -1];
    beq=[4; 2];
end