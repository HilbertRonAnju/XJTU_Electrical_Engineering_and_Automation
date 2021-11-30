syms n 
xn1 = kroneckerDelta(n,0)+kroneckerDelta(n,1); 
xn2 = (1/2)^(n-1); 
Xz1 = ztrans(xn1) 
Xz2 = ztrans(xn2)
