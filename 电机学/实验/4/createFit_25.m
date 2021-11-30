function [fitresult, gof] = createFit_25(U2_2, P0_p)
%CREATEFIT(U2_2,P0_P)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : U2_2
%      Y Output: P0_p
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 27-Dec-2020 15:48:12 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( U2_2, P0_p );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
hold on
plot( fitresult, xData, yData );
plot([380^2,380^2],[0,fitresult(380^2)],'k--','linewidth',0.5);
plot([14090,380^2],[225,225],'k--','linewidth',0.5);
hold off;
xlabel('\it\fontname{Times new roman}U_{0}^{2} (V^{2})')
ylabel('三相电流平均值 \it\fontname{Times new roman}P_{0}\prime (W)');
axis([-inf,inf,0,inf]);
legend('实测值', '拟合值');
title('负载特性\it\fontname{Times new roman}P_{0}\prime=f(U_{0}^{2})');
set(findobj('Type','line'),'LineWidth',1.5);
set(gca,'FontName','Times New Roman','FontName','宋体');
grid on


