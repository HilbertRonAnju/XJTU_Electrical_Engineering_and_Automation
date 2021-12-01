function [fitresult, gof] = createFit4(D1, G)
%CREATEFIT(D1,G)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : D1
%      Y Output: G
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 22-Nov-2020 22:54:35 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( D1, G );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('Duty Ratio')
ylabel('capacitor voltage ripple (V)')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit');
title('the relationships between duty ratio and voltage gain')
grid on


