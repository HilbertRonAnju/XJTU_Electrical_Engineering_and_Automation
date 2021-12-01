clc;
clear;
close all;

load SEMINAR4_DATA
load SEMINAR4_DATA_TOPIC
% fit figure
[fitresult, gof] = createFit1(D, delta_uC, delta_uC_cal)
[fitresult, gof] = createFit3(D, delta_iL, delta_iL_cal);
[fitresult, gof] = createFit2(D, G);

%% error analysis
% capacitor voltage ripple error
figure('name','v')
hold on
plot(D,abs(delta_uC-delta_uC_cal)./delta_uC_cal,'r-','linewidth',1.5);
plot(D,abs(delta_iL-delta_iL_cal)./delta_iL_cal,'b-','linewidth',1.5);
plot(D,abs(G-1./(1-D))./(D./(1-D)),'k-','linewidth',1.5);
hold off
xlabel('Duty Ratio')
ylabel('capacitor voltage ripple error')
axis([0.3,0.8,0,1]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
title('the error of simulation')
legend('relative error of capacitor voltage ripple','relative error of inductor current ripple','relative error of voltage gain')
grid on

% inductor current ripple error
figure('name','i')
plot(D,abs(delta_iL-delta_iL_cal)./delta_iL_cal,'k-','linewidth',1.5);
xlabel('Duty Ratio')
ylabel('inductor current ripple error')
axis([0.3,0.8,0,1]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
title('the error of simulation about inductor current ripple')
grid on

% voltage gain error
figure('name','g')
plot(D,abs(G-1./(1-D))./(D./(1-D)),'k-','linewidth',1.5);
xlabel('Duty Ratio')
ylabel('voltage gain error')
axis([0.3,0.8,0,1]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
title('the error of simulation about voltage gain')
grid on

%% the relationships between D and voltage gain
[fitresult, gof] = createFit4(D1, G1);


