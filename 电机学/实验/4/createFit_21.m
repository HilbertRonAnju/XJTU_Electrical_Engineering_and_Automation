function [fitresult, gof] = createFit_21(U2, I2)
%CREATEFIT(U2,I2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : U2
%      Y Output: I2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Dec-2020 21:01:37 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( U2, I2 );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('三相线电压平均值 \it\fontname{Times new roman}U_{0} (V)')
ylabel('三相电流平均值 \it\fontname{Times new roman}I_{0} (A)')
legend('实测值', '拟合值');
title('空载特性\it\fontname{Times new roman}I_{0}=f(U_{0})');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on


