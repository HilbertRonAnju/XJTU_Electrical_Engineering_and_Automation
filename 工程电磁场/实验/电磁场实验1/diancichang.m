clear
clc
close all
L=40;
M=20;
%L为分的段数
for i=2:L+1
    for j=1:M+1
        d1(i,j)=0;
    end
end
d1(1,M+1)=0;
d1(L+1,M+1)=0;
d1(1,2:L)=100;
d2=d1;
w=2/(1+sin(pi/L));
wc=1;k=0;t=0;
while wc>1e-3
    k=k+1;
for i=2:L
    for j=2:L
        d2(i,j)=d1(i,j)+(d1(i+1,j)+d1(i,j+1)+d2(i-1,j)+d2(i,j-1)-4*d1(i,j))*w/4
        t=abs(d2(i,j)-d1(i,j));
        if(t<wc)
            wc=t;
        end
    end
end
d1=d2;
end