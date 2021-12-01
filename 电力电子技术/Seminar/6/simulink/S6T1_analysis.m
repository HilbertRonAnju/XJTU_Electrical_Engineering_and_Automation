clc;
clear;
close all;

%% setup the parameter
j = 1;
step = 0.01;
amplitude_modulation = [0:step:1];
n = length(amplitude_modulation);
fun_result = zeros(n,1);
har1_result = zeros(n,1);
har2_result = zeros(n,1);
har3_result = zeros(n,1);

%% run the simulation
for i = 0:step:1
    tem = i; % middle tem
    set_param('Seminar6_topic1/Sine_Wave_W','Amplitude','tem');
    set_param('Seminar6_topic1/Sine_Wave_V','Amplitude','tem');
    set_param('Seminar6_topic1/Sine_Wave_U','Amplitude','tem');
    sim('Seminar6_topic1',[0,0.03]); % Run simulation
    fun_result(j) = fundamental(end);
    har1_result(j) = harmonics1(end);
    har2_result(j) = harmonics2(end);
    har3_result(j) = harmonics3(end);
    % result check
    disp(['amplitude modulation ratio m = ',num2str(i)]);
    disp(['the fundamental magnitude of output voltage is ',num2str(fundamental(end)),'V']);
    disp(['the harmonics(2*50+6000) magnitude of output voltage is ',num2str(harmonics1(end)),'V']);
    disp(['the harmonics(50+2*6000) magnitude of output voltage is ',num2str(harmonics2(end)),'V']);
    disp(['the harmonics(3*6000+2*50) magnitude of output voltage is ',num2str(harmonics3(end)),'V']);
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    j = j+1;
end

%% plot the figure
figure(1)
hold on 
plot(amplitude_modulation,fun_result);
plot(amplitude_modulation,har1_result);
plot(amplitude_modulation,har2_result);
plot(amplitude_modulation,har3_result);
hold off
xlabel('Amplitude Modulation Ratio')
ylabel('Magnuitude of Output Voltage Component (V)')
axis([-inf,inf,0,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('fundamental component','harmonics component(6100Hz)','harmonics component(12050Hz)','harmonics component(18100Hz)');
title('the relationships between Amplitude Modulation Ratio and Magnuitude of Output Voltage Component')
grid on
