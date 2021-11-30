function [fitresult, gof] = createFit3(power2, eta)
%CREATEFIT(POWER2,ETA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : power2
%      Y Output: eta
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Nov-2020 15:42:29 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( power2, eta );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.617675586706557 0.000365735145958216 -0.740710961754415 -0.0401219882464076];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend('实验所测效率结果', '拟合结果' );
% Label axes
xlabel( '\itP_{2}(mA)');
ylabel( '\eta(%)');
title('他励直流电动机\eta=f(P_{2})')
grid on


