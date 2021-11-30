function [fitresult, gof] = createFit5(u0, n1)
%CREATEFIT(U0,N1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : u0
%      Y Output: n1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Nov-2020 14:50:10 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( u0, n1 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend('实验所测改变电枢电压调速结果', '拟合结果' );
% Label axes
xlabel( '\itU_{a}(V)');
ylabel( '\itn(r/min)');
title('他励直流电动机调速特性\itn=f(U_{a})')
grid on


