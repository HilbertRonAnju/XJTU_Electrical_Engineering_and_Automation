function [fitresult, gof] = createFit1(power2, n)
%CREATEFIT(POWER2,N)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : power2
%      Y Output: n
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Nov-2020 14:30:32 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( power2, n );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
legend('实验所测转速结果', '拟合结果' );
% Label axes
xlabel( '\itP_{2}(W)');
ylabel( '\itn(r/min)');
title('他励直流电动机\itn=f(P_{2})')
grid on


