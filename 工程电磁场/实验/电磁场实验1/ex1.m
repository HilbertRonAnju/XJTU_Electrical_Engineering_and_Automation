clc;clear;close all;
hx=40;hy=20;
v1=ones(hy,hx);
v1(hy,:)=ones(1,hx)*0;
v1(1,:)=ones(1,hx)*100;
for i=1:hy
    v1(i,1)=0;
    v1(i,hx)=0;
end
m=4;
w=1.769;
maxt=1;t=0;
v2=v1;n=0;
while(maxt>1e-3)
    n=n+1;
    maxt=0;
    for i=2:hy-1;
        for j=2:hx-1;
        v2(i,j)=v1(i,j)+(v1(i,j+1)+v1(i+1,j)+v2(i-1,j)+v2(i,j-1)-4*v1(i,j))*w/4;
            t=abs(v2(i,j)-v1(i,j));
            if(t>maxt)
                maxt=t;
            end
        end
    end
    v1=v2;
end
