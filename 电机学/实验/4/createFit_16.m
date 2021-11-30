function [fitresult, gof] = createFit_16(P_1, s)
%CREATEFIT(P_1,S)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : P_1
%      Y Output: s
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Dec-2020 22:44:42 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( P_1, s );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('功率 \it\fontname{Times new roman}P_{2} (W)')
ylabel('转差率 \it\fontname{Times new roman}s')
legend('实测值', '拟合值');
title('负载特性\it\fontname{Times new roman}s=f(P_{2})');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on

