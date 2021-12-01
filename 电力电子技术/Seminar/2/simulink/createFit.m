function [fitresult, gof] = createFit(anx, pf)
%CREATEFIT(ANX,PF)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : anx
%      Y Output: pf
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 24-Oct-2020 21:31:07 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( anx, pf );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Robust = 'Bisquare';
opts.StartPoint = [0.988593915495497 -0.0571187213994972];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
hold on
h = plot( fitresult, xData, yData );
hold off
legend( h, 'simulink result', 'result fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'RL(\Omega)','fontname','times new roma' );
ylabel( 'Power Factor','fontname','times new roma' );
grid on
axis([0,inf,0,1])
title('Power Factor PF=f(RL)','fontname','times new roman');


