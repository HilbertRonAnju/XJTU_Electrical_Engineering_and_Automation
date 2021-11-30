function [fitresult, gof] = createFit6(ifn, n2)
%CREATEFIT(IFN,N2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : ifn
%      Y Output: n2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Nov-2020 14:57:59 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( ifn, n2 );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend('实验所测改变励磁电流调速结果', '拟合结果' );
% Label axes
xlabel( '\itI_{f}(mA)');
ylabel( '\itn(r/min)');
title('他励直流电动机调速特性\itn=f(I_{f})')
grid on


