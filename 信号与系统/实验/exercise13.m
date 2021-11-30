a = [3 2 1]; 
b = [1 2 3]; 
[z p k] = tf2zp(b,a); 
subplot(2,2,[1,3]) 
zplane(z,p); 
title('极零点分布图'); 
[H,w] = freqz(b,a); 
subplot(2,2,2); 
plot(w,abs(H),'linewidth',2); 
title('幅频特性'); 
xlabel('\Omega'); 
ylabel('|H(\Omega)|'); 
set(gca,'YTick',-1:1:1); 
subplot(2,2,4); 
plot(w,angle(H),'linewidth',2); 
title('相频特性'); 
xlabel('\Omega'); 
ylabel('arg(H(\Omega))');
