function [fitresult, gof] = createFit5(IK, PK)
%CREATEFIT(IK,PK)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : IK
%      Y Output: PK
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 16-Nov-2020 21:25:49 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( IK, PK );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [91.97 23.58 3.68734733772546];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 5' );
plot( fitresult, xData, yData );
legend('实测值', '拟合值');
title('短路特性\it\fontname{Times new roman}P_{K }=f(I_{K })')
xlabel('三相线电流平均值\it\fontname{Times new roman}I_{K }');
ylabel('功率\it\fontname{Times new roman}P_{K }');
grid on;

