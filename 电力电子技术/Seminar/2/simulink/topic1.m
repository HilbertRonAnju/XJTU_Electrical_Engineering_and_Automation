a=170;
f=50;
t=1/f;
VT=zeros(6,1);
for i=1:6
    VT(i)=(a+30+(i-1)*60)/360*t;
end
VT