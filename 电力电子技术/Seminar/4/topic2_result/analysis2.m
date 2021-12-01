clc;
clear;
close all;

%% parameter setup
j = 1; % 计数变量
Vin = 600; % 输入电压
Vo = 48; % 输出电压
RL = 10; % 负载电阻
f = 1e5; % 频率
T = 1./f; % 周期
C = 200e-6; % 电容
L = 300e-6; % 电感
step = 0.01; % 步长
D1 = [0.01:step:0.49]; % 占空比

%% calculate critical resistance
disp('Critical resistance is')
Ds = 0.16;
R_c = 2.*L.*Vo./((Vin./4-Vo)*Ds.*T);
disp(R_c)

%% result matrix initialization
num = length(D1);
Vin_result = zeros(1,num);
Vout_result = zeros(1,num);
G1 = zeros(1,num);

%% run simulation with different Duty ratio
for d = 1:100*step:49
    tem1 = d; % middle tem
    tem2 = d;
    set_param('Seminar4_topic2_2/PG1','PulseWidth','tem1'); % Set up duty ratio
    set_param('Seminar4_topic2_2/PG2','PulseWidth','tem2'); % Set up duty ratio
    sim('Seminar4_topic2_2',[0,0.1]); % Run simulation
    Vin_result(j) = Uin(end);
    Vout_result(j) = Uo(end);
    G1(j) = Vout_result(j)./Vin_result(j);
    % result check
    disp(['When Duty Ratio is ',num2str(d),'%']);
    disp(['Input Voltage is ',num2str(Vin_result(j)),'V']);
    disp(['Output Voltage is ',num2str(Vout_result(j)),'V']);
    disp(['Voltage Gain is ',num2str(G1(j))]);
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    j = j+1;
end

save SEMINAR4_DATA_TOPIC G1 D1
