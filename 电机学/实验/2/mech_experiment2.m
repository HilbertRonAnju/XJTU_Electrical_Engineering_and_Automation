clc;clear;close all;
load DATA
u0 = 220;
uf = 240;
ia = data1(1,:);
ifn = 0.066;
power1 = u0.*ia+uf.*ifn;
n = data1(2,:);
t2 = data1(3,:);
power2 = 0.105.*n.*t2;
eta = power2./power1;
[fitresult, gof] = createFit1(power2, n)
[fitresult, gof] = createFit2(power2, t2)
[fitresult, gof] = createFit3(power2, eta)
[fitresult, gof] = createFit4(t2, n)

u0 = data2(1,:);
n1 = data2(2,:);

ifn = data3(2,:);
n2 = data3(1,:);
[fitresult, gof] = createFit5(u0, n1)
[fitresult, gof] = createFit6(ifn, n2)