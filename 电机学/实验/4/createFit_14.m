function [fitresult, gof] = createFit_14(P_2, I1)
%CREATEFIT(P_2,I1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : P_2
%      Y Output: I1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Dec-2020 20:24:26 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( P_2, I1 );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('功率 \it\fontname{Times new roman}P_{2} (W)')
ylabel('三相电流平均值 \it\fontname{Times new roman}I_{1} (A)')
legend('实测值', '拟合值');
title('负载特性\it\fontname{Times new roman}I_{1}=f(P_{2})');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on

