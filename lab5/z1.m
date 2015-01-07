options = optimset('quadprog');
options = optimset(options, 'largescale', 'off');
[H, f, Aeq, beq] = p1();
[x,fval,exitflag] = quadprog(H,f,[],[],Aeq,beq, [],[],[],options)
[H, f, Aeq, beq] = p2();
[x,fval,exitflag] = quadprog(H,f,[],[],Aeq,beq, [],[],[],options)
[H, f, Aeq, beq] = p3();
[x,fval,exitflag] = quadprog(H,f,[],[],Aeq,beq, [],[],[],options)