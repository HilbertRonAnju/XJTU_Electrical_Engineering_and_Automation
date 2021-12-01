clc;
clear;
close all;

load DATA1
angle = 10:10:360;
rms1 = result;
rms3 = result1;
rms5 = result2;
rms6 = result3
rms7 = result4;
rms9 = result5;
thd = result_THD;
[fitresult, gof] = createFit1(angle, rms1);

[fitresult, gof] = createFit2(angle, thd);

figure(4)
subplot(2,2,1);
[fitresult, gof] = createFit_rms3(angle, rms3);
subplot(2,2,2);
[fitresult, gof] = createFit_rms5(angle, rms5);
subplot(2,2,3);
[fitresult, gof] = createFit_rms7(angle, rms7);
subplot(2,2,4);
[fitresult, gof] = createFit_rms9(angle, rms9);
h=suptitle({'the relationships between phase-shifting angle';...
    'and 3^{rd} 5^{th} 6^{th} 7^{th} and 9^{th} harmonics components'}); 
set(h,'FontName','Times New Roman');

figure(5)
[fitresult, gof] = createFit8(angle, rms6)

