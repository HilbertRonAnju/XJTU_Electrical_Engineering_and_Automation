t=-10*pi:0.01*pi:10*pi
f=-1./(pi.*t.^2);
x=fft(f,200);
y=abs(x);
plot(y,'r-')