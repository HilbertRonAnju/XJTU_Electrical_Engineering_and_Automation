function [fitresult, gof] = createFit4(IK, UK)
%CREATEFIT(IK,UK)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : IK
%      Y Output: UK
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 16-Nov-2020 21:36:15 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( IK, UK );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 4' );
plot( fitresult, xData, yData );
legend('实测值', '拟合值');
title('短路特性\it\fontname{Times new roman}U_{K }=f(I_{K })')
xlabel('三相线电流平均值\it\fontname{Times new roman}I_{K }(A)');
ylabel('三相线电压平均值\it\fontname{Times new roman}U_{K }(V)');
grid on;

