clc;
clear;
close all;

%% parameter setup
j = 0; % 计数变量
Vin = 300; % 输入电压
RL = 100; % 负载电阻
f = 1e5; % 频率
T = 1./f; % 周期
C = 200e-6; % 电容
L = 800e-6; % 电感
step = 0.01; % 步长
D = [0.3:step:0.8]; % 占空比

%% result matrix initialization
num = length(D);
iL_result = zeros(1,num);
uC_result = zeros(1,num);
uin_result = zeros(1,num);
delta_uC = zeros(1,num);
delta_iL = zeros(1,num);

%% run simulation with different Duty ratio
for d = 30:100*step:80
    tem = d; % middle tem
    set_param('seminar4_topic1/PG1','PulseWidth','tem'); % Set up duty ratio
    sim('seminar4_topic1',[0,0.1]); % Run simulation
    iL_result(j+1) = iL(end);
    uC_result(j+1) = uC(end);
    uin_result(j+1) = uin(end);
    delta_uC(j+1) = max(uC(end-50:end))-min(uC(end-50:end));
    delta_iL(j+1) = max(iL(end-500:end))-min(iL(end-500:end));
    % result check
    disp(['When Duty Ratio is ',num2str(d),'%']);
    disp(['Capacitor Voltage is ',num2str(uC(end)),'V']);
    disp(['Inductance Voltage is ',num2str(iL(end)),'A']);
    disp(['Capacitor Voltage Ripple is ',num2str(delta_uC(j+1)),'V']);
    disp(['Inductor Current Ripple is ',num2str(delta_iL(j+1)),'A']);
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    j = j+1;
end

%% calculate inductor current ripple, capacitor voltage ripple, voltage gain
delta_uC_cal = (uC_result.*D.* T) ./ (C.*RL);
delta_iL_cal = Vin.*D.*T./L;
G = uC_result./uin_result;

%% save DATA
save SEMINAR4_DATA D delta_uC delta_iL G delta_uC_cal delta_iL_cal
