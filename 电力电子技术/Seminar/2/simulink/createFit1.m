function [fitresult, gof] = createFit1(and, thd1)
%CREATEFIT1(AND,THD1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : and
%      Y Output: thd1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 24-Oct-2020 23:08:08 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( and, thd1 );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.497385531757233 0.427705269032113];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'simulink result', 'result fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'RL(\Omega)', 'fontname','times new roman' );
ylabel( 'THD(%)','fontname','times new roman' );
grid on
title('THD=f(RL)','fontname','times new roman');


