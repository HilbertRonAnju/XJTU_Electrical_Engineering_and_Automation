function [fitresult, gof] = createFit2(power2, t2)
%CREATEFIT(POWER2,T2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : power2
%      Y Output: t2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Nov-2020 14:37:11 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( power2, t2 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend('实验所测输出转矩结果', '拟合结果' );
% Label axes
xlabel( '\itP_{2}(W)');
ylabel( '\itT_{2}(N*m)');
title('他励直流电动机\itT_{2}=f(P_{2})')
grid on


