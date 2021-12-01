clc;
clear;
close all;

%% Topic 1
% initial parameters
%j = 1;
%rms_uo1 = zeros(1,61);
%f1=zeros(1,61);
%f3=zeros(1,61);
%f5=zeros(1,61);
%f7=zeros(1,61);
%phase_delay1 = [0:3:180];
%disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
%disp('topic 1 simulation begin£º')
% run the simulation of topic 1
%for i = 0:3:180
    % change the phase dalay of trigger signal
%    tem1 = i./360.*0.02;
%    tem2 = i./360.*0.02 + 0.01;
%    set_param('seminar5_topic11/PG1','Phasedelay','tem1');
%    set_param('seminar5_topic11/PG2','Phasedelay','tem2');
%    sim('seminar5_topic11',[0,0.2]);
%    rms_uo1(j) = RMS_output_voltage(end);
%    f1(j)=fourier1_output_voltage(end);
%    f3(j)=fourier3_output_voltage(end);
%    f5(j)=fourier5_output_voltage(end);
%    f7(j)=fourier7_output_voltage(end);
    % display the RMS value to check
%    disp(['When the delay angle is ',num2str(phase_delay1(j)),' degree']);
%    disp(['The RMS value of output voltage is ',num2str(rms_uo1(j)),'V']);
%    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
%    j = j + 1;
%end
%disp('topic 1 simulation finished.')
%disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');

%% Topic 2
% initial parameters
j = 1;
rms_uo2 = zeros(1,61);
duty_circle2 = [1:1:99];
ff1=zeros(1,61);
ff19=zeros(1,61);
ff21=zeros(1,61);
ff39=zeros(1,61);
ff41=zeros(1,61);
ff59=zeros(1,61);
ff61=zeros(1,61);
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
disp('topic 2 simulation begin£º')
% run the simulation of topic 1
for i = 1:1:99
    % change the phase dalay of trigger signal
    tem1 = i;
    tem2 = 100 - i;
    tem3 = 1e-3.*(i./100);
    set_param('seminar5_topic22/PG1','PulseWidth','tem1');
    set_param('seminar5_topic22/PG2','PulseWidth','tem2');
    set_param('seminar5_topic22/PG2','Phasedelay','tem3');
    sim('seminar5_topic22',[0,0.2]);
    rms_uo2(j) = RMS_output_voltage2(end);
    ff1(j)=fourier1_output_voltage2(end);
    ff19(j)=fourier19_output_voltage2(end);
    ff21(j)=fourier21_output_voltage2(end);
    ff39(j)=fourier39_output_voltage2(end);
    ff41(j)=fourier41_output_voltage2(end);
    ff59(j)=fourier59_output_voltage2(end);
    ff61(j)=fourier61_output_voltage2(end);
    % display the RMS value to check
    disp(['When the delay angle is ',num2str(duty_circle2(j)),'%']);
    disp(['The RMS value of output voltage is ',num2str(rms_uo2(j)),'V']);
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    j = j + 1;
end
disp('topic 2 simulation finished.')
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');

%% plot the figure
%[fitresult, gof] = createFit1(phase_delay1, rms_uo1);
[fitresult, gof] = createFit2(duty_circle2, rms_uo2);
cftool