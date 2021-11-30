a = [1 -1/6 -1/6];
b = [11 -1 -1];
zy = [0 0];
zx = [0 0];
z = filtic(b,a,zy,zx);
xn = [ones(1,1),zeros(1,10)];
yn = filter(b,a,xn,z);
n = 0:length(xn)-1;
stem(n,yn); ylabel('h[n]'); xlabel('n');
