function [fitresult, gof] = createFit_rms7(angle, rms7)
%CREATEFIT(ANGLE,RMS7)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : angle
%      Y Output: rms7
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 07-Nov-2020 19:22:43 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( angle, rms7 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.052762091837418;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot( fitresult, xData, yData );
xlabel('external phase angle - \phi(\circ)')
ylabel('7^{th} harmonics components')
axis([0,360,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
set(gca,'XTick',0:30:360);
legend(' 7^{th} harmonics components simulink result',...
    '7^{th} harmonics components simulink result fit')
grid on



