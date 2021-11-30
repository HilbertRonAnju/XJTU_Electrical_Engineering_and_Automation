function [fitresult, gof] = createFit(if1, u0)
%CREATEFIT(IF1,U0)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : if1
%      Y Output: u0
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 19-Oct-2020 23:12:35 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( if1, u0 );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
       p1 =       3.016  ;
       p2 =       26.44  ;
x=0:0.1:57.5;
figure( 'Name', 'untitled fit 1' );
hold on;
plot( fitresult,'k-',xData, yData);
plot([0,76.87],[200,200],'r-')
plot(x,p1.*x+p2,'r-')
hold off;
text(1,205,'A');
text(58.5,205,'C');
text(75.87,205,'B');
legend(  '实验所得数据', '拟合曲线' );
% Label axes
xlabel( '\itI_{f}(mA)' );
ylabel( '\itU_{0}(V)' );
title('他励空载特性曲线');
grid on


