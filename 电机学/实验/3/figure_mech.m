clc;
clear all;
close all;

data1 = xlsread('电机学实验数据3.xlsx','Sheet1');
data2 = xlsread('电机学实验数据3.xlsx','Sheet2');
data3 = xlsread('电机学实验数据3.xlsx','Sheet3');

UN = 220;
IN = 3.94;
U0 = (data1(:,1)+data1(:,2)+data1(:,3))./3;
I0 = (data1(:,4)+data1(:,5)+data1(:,6))./3;
U0p = U0./UN;
I0p = I0./IN;
P0 = data1(:,7)+data1(:,8);
lamda1 = P0./(sqrt(3).*U0.*I0);

IK = (data2(:,1)+data2(:,2)+data2(:,3))./3;
UK = (data2(:,4)+data2(:,5)+data2(:,6))./3;
PK = data2(:,7)+data2(:,8);
lamda2 = PK./(sqrt(3).*UK.*IK);

[fitresult, gof] = createFit1(I0p, U0p);
% [fitresult, gof] = createFit2(U0, P0);
% [fitresult, gof] = createFit3(U0, lamda1);

% [fitresult, gof] = createFit4(IK, UK);
% [fitresult, gof] = createFit5(IK, PK);
% [fitresult, gof] = createFit6(IK, lamda2);

