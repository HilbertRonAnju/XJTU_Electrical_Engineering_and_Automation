function [fitresult, gof] = createFit7(angle, rms6)
%CREATEFIT(ANGLE,RMS6)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : angle
%      Y Output: rms6
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 04-Nov-2020 21:05:28 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( angle, rms6 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
plot( fitresult, xData, yData );

xlabel('external phase angle - \phi(\circ)')
ylabel('6^{th} harmonics components')
axis([0,360,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
set(gca,'XTick',0:30:360);
legend(' 6^{th} harmonics components simulink result',...
    '6^{th} harmonics components simulink result fit')
grid on

