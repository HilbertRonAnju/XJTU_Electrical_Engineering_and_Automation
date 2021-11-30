T = 1; 
w0 = 2*pi/T;  

%% DFT 
N = 32; 
Ts = T/N; 
n = 0:N-1; 
xn = square(2*pi.*n*Ts,25)/2+1/2; 
Xk = fft(xn,N); 

%% FS 
syms w t 
ck = int(exp(-j*n*w0*t)/T, t, 0, 1/4); 
ck = ck(1,1:N/2); 
wk = n*w0; 
wk = wk(1,1:N/2);  
subplot(2,1,1); 
stem(n*w0,abs(Xk)/N,'linewidth',1); 
xlabel('\omega'); ylabel('|c_k|'); title('·ù¶ÈÆµÆ×'); 
hold on
plot(wk,abs(ck),'*') 
legend('DFS','FS') 
subplot(2,1,2); 
stem(n*w0,angle(Xk),'linewidth',1); 
xlabel('\Omega'); ylabel('\phi_k'); title('ÏàÎ»ÆµÆ×'); 