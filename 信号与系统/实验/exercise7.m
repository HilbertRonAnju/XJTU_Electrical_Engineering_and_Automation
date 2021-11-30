syms t w 
f(t) = -1/(pi*t^2); 
F(w) = fourier(f(t),t,w) 
subplot(2,1,1) 
fplot(abs(F(w)),[-5,5]) 
title('·ù¶ÈÆµÆ×') 
xlabel('\omega') 
ylabel('|X(\omega)|','FontName','Times New Roman') 
subplot(2,1,2) 
fplot(angle(F(w)),[-5,5]) 
title('ÏàÎ»ÆµÆ×') 
xlabel('\omega') 
ylabel('\phi_X(\omega)')