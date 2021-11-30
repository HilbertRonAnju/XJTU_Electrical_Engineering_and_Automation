syms s t 
Xs = (1-exp(-2*s))/(s+1); 
xt = ilaplace(Xs,s,t) 
