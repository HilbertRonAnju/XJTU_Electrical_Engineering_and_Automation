x = 0: 0.01 : 4*pi;
figure(1)
hold on;
plot(x,cos(x),'k--');
plot(x,cos(x-pi/3),'k--');
plot(x,cos(x-2*pi/3),'k--');
plot(x,cos(x-pi),'k--');
plot(x,cos(x+pi/3),'k--');
plot(x,cos(x+2*pi/3),'k--');
for i=1:3
    plot([-pi/6+(i-1)*2*pi:0.01:pi/2+(i-1)*2*pi],cos([-pi/6+(i-1)*2*pi:0.01:pi/2+(i-1)*2*pi]),'r-','linewidth',1.5);
    plot([5*pi/6+(i-1)*2*pi,5*pi/6+(i-1)*2*pi],[0,sqrt(3)/2],'r-','linewidth',1.5);
    for j=1:3
        plot([5*pi/6+(j-1)*pi/3+(i-1)*2*pi:0.01:7*pi/6+(j-1)*pi/3+(i-1)*2*pi],cos([5*pi/6+(j-1)*pi/3+(i-1)*2*pi:0.01:7*pi/6+(j-1)*pi/3+(i-1)*2*pi]-pi+(j-1)*5*pi/3),'r-','linewidth',1.5)
    end
end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\omegat');
ylabel('\itu_{d}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});
grid on;