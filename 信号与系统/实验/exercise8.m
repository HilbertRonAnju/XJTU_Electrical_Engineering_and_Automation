syms t s 
xt1 = (sin(t))^2; 
xt2 = t*heaviside(t-2); 
X1 = laplace(xt1,t,s) 
X2 = laplace(xt2,t,s)
