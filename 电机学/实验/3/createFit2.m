function [fitresult, gof] = createFit2(U0, P0)
%CREATEFIT(U0,P0)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : U0
%      Y Output: P0
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 16-Nov-2020 21:13:41 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( U0, P0 );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [2.62056732260638 0.0118296103989183];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 2' );
plot( fitresult, xData, yData );
legend('实测值', '拟合值');
title('空载特性\it\fontname{Times new roman}P_{0 }=f(I_{0 })')
xlabel('三相电压平均值\it\fontname{Times new roman}U_{0 }(V)');
ylabel('功率\it\fontname{Times new roman}P_{0 }(W)');
grid on;


