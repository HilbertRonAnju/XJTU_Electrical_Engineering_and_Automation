clc;
clear;
close all;

data1 = xlsread('电机学实验数据4.xlsx','Sheet1');
data2 = xlsread('电机学实验数据4.xlsx','Sheet2');
data3 = xlsread('电机学实验数据4.xlsx','Sheet3');

% % experiment1
% data check
% IA1 = data1(:,1);
% IB1 = data1(:,2);
% IC1 = data1(:,3);
% P11 = data1(:,4);
% P21 = data1(:,5);
% T1 = data1(:,6);
% n1 = data1(:,7); 
% data calculation
% I1 = (IA1+IB1+IC1)./3;
% P_1 = P11+P21;
% P_2 = 1.027.*T1.*n1;
% eta = P_2./P_1;
% cosfai1 = P_1./(sqrt(3).*380.*I1);
% s = (1500-n1)./1500;
% plot the figure
% [fitresult, gof] = createFit_16(P_1, s);
% [fitresult, gof] = createFit_11(P_2, eta);
% [fitresult, gof] = createFit_12(P_2, cosfai1);
% [fitresult, gof] = createFit_13(P_2, T1);
% [fitresult, gof] = createFit_14(P_2, I1);
% [fitresult, gof] = createFit_15(P_2, P_1);
% 
% % experiment12
% data check
% UAB2 = data2(:,1);
% UBC2 = data2(:,2);
% UCA2 = data2(:,3);
% IA2 = data2(:,4);
% IB2 = data2(:,5);
% IC2 = data2(:,6);
% P12 = data2(:,7);
% P22 = data2(:,8);
% data calculation
% I2 = (IA2+IB2+IC2)./3;
% U2 = (UAB2+UBC2+UCA2)./3;
% P0 = P12 + P22;
% cosfai2 = P0./(sqrt(3).*U2.*I2);
% P0_p = P0 - 3*I2.^2.*2.25;
% U2_2 = U2.^2;
% plot the figure
% [fitresult, gof] = createFit_21(U2, I2);
% [fitresult, gof] = createFit_22(U2, P0);
% [fitresult, gof] = createFit_23(U2, cosfai2);
% 
% [fitresult, gof] = createFit_25(U2_2, P0_p);
%% experiment3
% data check
UAB3 = data3(:,1);
UBC3 = data3(:,2);
UCA3 = data3(:,3);
IA3 = data3(:,4);
IB3 = data3(:,5);
IC3 = data3(:,6);
P13 = data3(:,7);
P23 = data3(:,8);
% data calculation
IK = (IA3+IB3+IC3)./3;
UK = (UAB3+UBC3+UCA3)./3;
PK = P13 + P23;
cosfai3 = PK./(sqrt(3).*UK.*IK);
% plot the figure
[fitresult, gof] = createFit_31(UK, IK);
[fitresult, gof] = createFit_32(UK, PK);





