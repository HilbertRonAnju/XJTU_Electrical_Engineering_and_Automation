function [fitresult, gof] = createFit2(and, ov)
%CREATEFIT2(AND,OV)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : and
%      Y Output: ov
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 24-Oct-2020 23:14:47 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( and, ov );

% Set up fittype and options.
ft = fittype( 'power2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [502.166321153148 0.0141353116246679 -0.0928585716714565];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'simulation result', 'result fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel('RL(\Omega)','fontname','times new roman');
ylabel('Output Voltage U_{0}(V)','fontname','times new roman');
grid on
title('Output Voltage U_{0}=f(RL)','fontname','times new roman');


