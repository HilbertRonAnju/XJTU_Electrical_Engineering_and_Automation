function [fitresult, gof] = createFit1(angle, rms1)
%CREATEFIT(ANGLE,RMS1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : angle
%      Y Output: rms1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 04-Nov-2020 20:25:51 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( angle, rms1 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'u1' );
hold on
plot( fitresult, xData, yData );
hold off
axis([0,360,0,inf]);
xlabel('external phase angle - \phi(\circ)')
ylabel('RMS value of the fundamental component in output voltage(V)','fontname','times new roma')
title({'the relationships between phase-shifting angle';...
    'and RMS value of the fundamental component in output voltage'}); 
legend('simulink result of RMS value','simulink result fit');
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
set(gca,'XTick',0:30:360);
grid on


