clc;
clear;
close all;
upps=[];uppt=[];
ipps=[];ippt=[];

gs=[];

for d=1:2:81
    sim('seminar4_topic1_2');
    uo1=uo(:,2);
    upp=max(uo1)-min(uo1);
    upps=[upps,upp];
    io1=io(:,2);
    ipp=max(io1)-min(io1);
    ipps=[ipps,ipp];
    g=vo/vin;
    gs=[gs,g];
end
d=1:2:81;
uppt=0.1.*(0.01.*d).*(1-(0.01.*d));
ippt=4.*(0.01.*d).*(1-(0.01.*d));

figure(1)
hold on;
plot(d./100,upps,'r * -')
plot(d./100,uppt,'b + -')
hold off
title('capacitor voltage ripple and duty cycle'); 
legend('simulation','theoretical')

figure(2)
plot(d./100,ipps,'r * -')
hold on;
plot(d./100,ippt,'b + -')
title('inductor current ripple and duty cycle'); 
legend('simulation','theoretical')

% figure(3)
% plot(d./100,gs,'r * -')
% hold on;
% plot(d./100,d./100,'b + -')
% title('voltage gain and duty cycle'); legend('simulation','theoretical')
