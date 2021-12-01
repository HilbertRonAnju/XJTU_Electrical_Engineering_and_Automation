clc;
clear;
close all;
alpha = [30,50,70];
ui = [30.432,30.432,30.432];
uo = [10.0,14.7,21.6];
uoui = ui./uo;
a = [30:0.1:70];
the = 100./a;

figure(1)
hold on
plot(alpha,uoui,'k.-','linewidth',1.5);
plot(a,the,'r.-','linewidth',1.5);
hold off
xlabel('占空比\it\fontname{times new roman}\alpha\rm(%)')
ylabel('输出电压输入与输入电压之比 \it\fontname{times new roman}U_{i}/U_{o} ')
legend('实验测量结果','理论值');
title('占空比与输入输出电压之比的关系')
grid on

fs = [5,10,20];
iopp = [0.217,0.151,0.107];

figure(2)
plot(fs,iopp,'k.-','linewidth',1.5);
xlabel('频率\it\fontname{times new roman}f_{s} (\rmkHz)')
ylabel('电流峰峰值 \it\fontname{times new roman}i_{o(p-p)} \rm(A) ')
legend('实验测量结果');
title('频率与电流峰峰值之间的关系')
grid on