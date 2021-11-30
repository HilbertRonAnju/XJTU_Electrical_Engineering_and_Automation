function [fitresult, gof] = createFit6(IK, lamda2)
%CREATEFIT(IK,LAMDA2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : IK
%      Y Output: lamda2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 16-Nov-2020 21:51:38 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( IK, lamda2 );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999607275026491;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 6' );
plot( fitresult, xData, yData );
legend('实测值', '拟合值');
title('短路特性\it\fontname{Times new roman}cos\phi_{K }=f(U_{K })')
xlabel('三相线电流平均值\it\fontname{Times new roman}I_{K }(A)');
ylabel('功率因数\it\fontname{Times new roman}cos\phi_{K }');
axis([-inf,inf,0,1])
grid on;


