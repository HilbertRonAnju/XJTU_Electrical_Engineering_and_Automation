result = zeros(1,36);
result1 = zeros(1,36);
result2 = zeros(1,36);
result3 = zeros(1,36);
result4 = zeros(1,36);
result5 = zeros(1,36);
result_THD = zeros(1,36);
result_udrms = zeros(1,36);

for i = 1:1:36
    fai = i*10;
    sim('seminar3_1')
    result(i) = simout.Data(length(simout.Data)-1);
    result1(i) = simout1.Data(length(simout1.Data)-1);
    result2(i) = simout2.Data(length(simout2.Data)-1);
    result3(i) = simout3.Data(length(simout3.Data)-1);
    result4(i) = simout4.Data(length(simout4.Data)-1);
    result5(i) = simout5.Data(length(simout5.Data)-1);
    result_THD(i) = simout_THD.Data(length(simout_THD.Data)-1);
    result_udrms(i) = simout_udrms.Data(length(simout_udrms.Data)-1);
end

save DATA1 result result1 result2 result3 result4 result5 result_THD result_udrms 
x = 10:10:360;
figure(1)
plot(x,result_THD);
ylabel('THD')

figure(2)
plot(x,result);
ylabel('RMS')

figure(3)
hold on
plot(x,result2);
plot(x,result3);
plot(x,result4);
plot(x,result5);
hold off