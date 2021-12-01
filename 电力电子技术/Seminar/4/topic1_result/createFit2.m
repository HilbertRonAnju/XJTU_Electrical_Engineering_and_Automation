function [fitresult, gof] = createFit2(D, G)
%CREATEFIT(D,G)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : D
%      Y Output: G
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 22-Nov-2020 16:30:18 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( D, G );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.934656870446415 1.11719513373564 0.0127119013657641 6.62445581419085];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 2' );
hold on
plot( fitresult, xData, yData );
plot(D,1./(1-D),'k-','linewidth',1.5);
hold off
xlabel('Duty Ratio')
ylabel('Voltage Gain')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit','the theoretical result');
title('the relationships between duty ratio and voltage gain')
grid on



