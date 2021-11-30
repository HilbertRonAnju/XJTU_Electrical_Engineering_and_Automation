N = 4; % 有限序列长度
x = [1 3 5 2];

%% DFT
syms k 
Hkk = [];
for k = 0:N-1
 Hk = 0;
 for n = 0:N-1
 Hk = Hk + x(n+1)*exp(-j*2*pi*k*n/N);
 end
  Hkk = [Hkk Hk];
end
n = 0:N-1;
w0 = 2*pi/N; 
stem(n*w0,abs(Hkk),'linewidth',1.5); xlabel('k\Omega_0'); ylabel('|X[k]|'); title('幅度谱');
set(gca, 'XTick',0:w0:(N-1)*w0)
set(gca, 'XTicklabel', {'0','\Omega_0','2\Omega_0','3\Omega_0'})
hold on

%% DTFT
syms w
Xw = 0;
for i = 1:N
 Xw = Xw + x(i)*exp(-j*w*i);
end
fplot(abs(Xw),[0,5],'r--')
grid on
legend('DFT','DTFT')
