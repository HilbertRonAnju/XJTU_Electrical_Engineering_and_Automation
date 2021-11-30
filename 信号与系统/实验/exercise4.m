p=0.5;
k1=0:p:2;
f1=exp(k1);
k2=k1;
f2=(3.*exp(-2.*k2)-1).*heaviside(k2);
[f,k]=sconv(f1,f2,k1,k2,p)