function [fitresult, gof] = createFit3(D, delta_iL, delta_iL_cal)
%CREATEFIT(D,DELTA_IL)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : D
%      Y Output: delta_iL
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 22-Nov-2020 17:26:59 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( D, delta_iL );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 3' );
hold on
plot( fitresult, xData, yData );
plot(D,delta_iL_cal,'k-','linewidth',1.5);
hold off
xlabel('Duty Ratio')
ylabel('capacitor voltage ripple (V)')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit','the theoretical result');
title('the relationships between duty ratio and inductor current ripple')
grid on


