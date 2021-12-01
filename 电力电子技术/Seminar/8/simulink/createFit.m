function [fitresult, gof] = createFit(t, n)
%CREATEFIT(T,N)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : t
%      Y Output: n
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 05-Jan-2021 19:16:12 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t, n );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData );
xlabel('\it\fontname{Times new roman}T (Nm)')
ylabel('\it\fontname{Times new roman}n (r/min)')

title('\it\fontname{Times new roman}Working characteristic analysis n=f(T)');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on


