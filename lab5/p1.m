function [D,c,Aeq,beq]=p1()
    D = [
        2 1  1  0;
        1 4  2  2;
        1 2  8 -3;
        0 2 -3  8
        ];
      
    c=[4;6;-6;12];
    
    Aeq=[1   1 -1 1;
         -1 -1  1 2];
    beq=[6; 2];
end

