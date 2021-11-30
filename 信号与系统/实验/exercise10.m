n = -10:10; 
xn1 = (0.9).^n.*(sin(0.25*pi.*n)); 
xn2 = sin(n/3+pi/5); 
subplot(2,1,1); 
stem(n,xn1); 
xlabel('n'); 
ylabel('x(n)'); 
title('(0.9)^n[sin(0.25\pin)]') 
subplot(2,1,2); 
stem(n,xn2); 
xlabel('n'); 
ylabel('x(n)'); 
title('sin(n/3+\pi/5)')
