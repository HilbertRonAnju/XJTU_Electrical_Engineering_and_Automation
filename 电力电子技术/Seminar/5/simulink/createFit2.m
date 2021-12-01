function [fitresult, gof] = createFit2(duty_circle2, rms_uo2)
[xData, yData] = prepareCurveData( duty_circle2, rms_uo2 );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [153.366721777444 0.00436053598548988 -120.909013517091 -0.0283854068125582];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Topic 2' );
plot( fitresult, xData, yData );
xlabel('Duty Circle(%)')
ylabel('The RMS value of output voltage (V)')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit');
title('the relationships between the RMS value of output voltage and duty circle')
grid on


