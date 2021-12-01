function [fitresult, gof] = createFit2(angle, thd)
%CREATEFIT(ANGLE,THD)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : angle
%      Y Output: thd
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 08-Nov-2020 20:05:20 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( angle, thd );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.153094893994065;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot( fitresult, xData, yData );
axis([0,360,0,4.5]);
xlabel('external phase angle - \phi(\circ)')
ylabel('output voltage THD')
title({'the relationships between phase-shifting angle';...
    'and output voltage THD'}); 
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
set(gca,'XTick',0:30:360);
grid on


