function createfigure(xvector1, yvector1)
%CREATEFIGURE(xvector1, yvector1)
%  XVECTOR1:  bar xvector
%  YVECTOR1:  bar yvector

%  由 MATLAB 于 12-Dec-2020 16:24:57 自动生成

% 创建 figure
figure1 = figure('Name','FFT Analysis Results');

% 创建 axes
axes1 = axes('Parent',figure1,...
    'Position',[0.117216117216117 0.11530064072437 0.815018315018315 0.805896805896806]);
hold(axes1,'on');

% 创建 bar
bar(xvector1,yvector1,'EdgeColor','none','BarWidth',0.5);

% 创建 ylabel
ylabel('Mag (% of Fundamental)');

% 创建 xlabel
xlabel('Frequency (Hz)');

% 创建 title
title('Fundamental (50Hz) = 47.58 , THD= 368.69%');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[-3750 75000]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[0 109.791910175718]);
box(axes1,'on');
grid(axes1,'on');
% 设置其余坐标区属性
set(axes1,'XMinorGrid','on','YMinorGrid','on','ZMinorGrid','on');
