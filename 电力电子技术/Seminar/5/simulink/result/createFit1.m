function [fitresult, gof] = createFit1(phase_dalay, rms_uo)
[xData, yData] = prepareCurveData( phase_dalay, rms_uo );

%% Set up fittype and options.
ft = fittype( 'poly4' );

%% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

%% Plot fit with data.
figure( 'Name', 'topic 1' );
plot( fitresult, xData, yData );
xlabel('Phase Delay(\circ)')
ylabel('The RMS value of output voltage (V)')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit');
title('the relationships between the RMS value of output voltage and delay angle')
grid on


