function [fitresult, gof] = createFit_22(U2, P0)
%CREATEFIT(U2,P0)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : U2
%      Y Output: P0
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Dec-2020 21:06:09 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( U2, P0 );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [205.821827892223 0.000932156710495238 0.586366477851324 0.0131588099652453];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('三相线电压平均值 \it\fontname{Times new roman}U_{0} (V)')
ylabel('功率 \it\fontname{Times new roman}P_{0} (W)')
legend('实测值', '拟合值');
title('空载特性\it\fontname{Times new roman}P_{0}=f(U_{0})');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on


