t=-1:0.001:3;
f1=(heaviside(t)-heaviside(t-1)).*t+(heaviside(t-1)-heaviside(t-2)).*(2-t);
f2= fliplr(f1);
subplot(1,3,1)
plot(t,f2)
fe=(f1+f2).*(1/2);
fo=(f1-f2).*(1/2);
subplot(1,3,2);
plot(t,fe);
title('偶分量');
xlabel('t')
ylabel('x(t)')
subplot(1,3,3);
plot(t,fo);
title('奇分量');
xlabel('t')
ylabel('x(t)')