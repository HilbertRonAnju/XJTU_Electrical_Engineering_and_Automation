u0=[240,229,217,199,177,147,112,68,26];
if1=[125.6,109.4,93.2,77.3,61.9,45.0,28.5,13.5,0];
u01=[112,68,26];
if11=[28.5,13.5,0];
u1=[200,204,209,214,219,224,231];
i1=[0.5,0.430,0.355,0.265,0.189,0.101,0];
u2=[200,211,224,232,239,246];
i2=[0.5,0.4,0.3,0.2,0.1,0];
% p=polyfit(if1,u0,2);
[fitresult, gof] = createFit(if1, u0);
% figure(1)
% hold on;
% plot(if1,u0,'k.');
%
% hold off;
% xlabel('\itI_{f}');
% ylabel('\itU_{0}');
% grid on;
% title('他励空载特性曲线');

p1 =      -61.57;
p2 =       230.6;

p3 =         -92;
p4 =       248.3;
x = 0:0.01:0.5;
y1=p1.*x+p2;
y2=p3.*x+p4;

figure(2)
hold on;
plot(i1,u1,'b.','linewidth',1.5);
plot(i2,u2,'r.','linewidth',1.5);
plot(x,y1,'b-','linewidth',1.5);
plot(x,y2,'r-','linewidth',1.5);
hold off;
legend('他励外特性','并励外特性','他励外特性拟合曲线','并励外特性拟合曲线');
xlabel('\itI(A)');
ylabel('\itU(V)');
title('他励&并励外特性曲线')
grid on;