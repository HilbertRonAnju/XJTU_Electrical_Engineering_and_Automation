syms t
x = t*(heaviside(t)-heaviside(t-1))+(2-t)*(heaviside(t-1)-heaviside(t-2));
x1 = subs(x,t,-t);
xe = (x+x1)/2;
xo = (x-x1)/2;
subplot(2,1,1)
fplot(xe,[-2,2]); 
title('偶分量'); 
xlabel('t');
ylabel('xe(t)')
subplot(2,1,2)
fplot(xo,[-2,2])
title('奇分量')
xlabel('t');
ylabel('xo(t)')
