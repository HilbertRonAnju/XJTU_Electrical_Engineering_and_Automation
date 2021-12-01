x = 0: 0.01 : 4*pi;

figure(1)
subplot(4,1,1);
hold on;
plot(x,sin(x),'k-');
plot(x,sin(x+2*pi/3),'k-');
plot(x,sin(x-2*pi/3),'k-');
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\omegat');
ylabel('\itu_{2}','fontname','times new roman');
text(1.58,0.9,'\itu_{a}','fontname','times new roman');
text(3.66,0.9,'\itu_{b}','fontname','times new roman');
text(5.57,0.9,'\itu_{c}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(4,1,2);
hold on;
plot(x,cos(x),'k--');
plot(x,cos(x-pi/3),'k--');
plot(x,cos(x-2*pi/3),'k--');
plot(x,cos(x-pi),'k--');
plot(x,cos(x+pi/3),'k--');
plot(x,cos(x+2*pi/3),'k--');
for i=1:13
    plot([-0.1+(i-2)*pi/3,-0.1+(i-2)*pi/3],[sqrt(3)/2-0.15,cos(-0.1)],'k-');
    plot([pi/6+(i-2)*pi/3,-0.1+(i-1)*pi/3],[sqrt(3)/2,sqrt(3)/2-0.15],'k-');
    plot([-0.1+(i-2)*pi/3:0.01:pi/6+(i-2)*pi/3],cos([-0.1+(i-2)*pi/3:0.01:pi/6+(i-2)*pi/3]-(i-2)*pi/3),'k-')
end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\omegat');
ylabel('\itu_{d}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(4,1,3);
hold on;
for i=1:2
    plot([1.35+(i-1)*2*pi-pi/6,pi+(i-1)*6*pi/3-pi/6],[0.8,0.8],'k-');
    r1=[pi/3+(i-1)*6*pi/3-pi/6:0.01:1.35+(i-1)*6*pi/3-pi/6];
    r2=[pi+(i-1)*6*pi/3-pi/6:0.01:1.35-pi/6+2*pi/3+(i-1)*2*pi];
    plot(r1,(0.8/(r1(end)-r1(1)).^2).*(r1-r1(1)).^2,'k-');
    plot(r2,(-0.8/(r2(end)-r2(1)).^2).*(r2-r2(1)).^2+0.8,'k-');
end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\it\omegat');
ylabel('\iti_{d}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(4,1,4);
hold on;
plot([1.35-pi/6,pi-pi/6],[0.8,0.8],'k-');
r1=[pi/3-pi/6:0.01:1.35-pi/6];
r2=[pi-pi/6:0.01:1.35-pi/6+2*pi/3];
plot(r1,(0.8/(r1(end)-r1(1)).^2).*(r1-r1(1)).^2,'k-');
plot(r2,(-0.8/(r2(end)-r2(1)).^2).*(r2-r2(1)).^2+0.8,'k-');
plot([1.35+5*pi/6,pi+5*pi/6],[-0.8,-0.8],'k-');
r1=[pi/3+5*pi/6:0.01:1.35+5*pi/6];
r2=[pi+5*pi/6:0.01:1.35+5*pi/6+2*pi/3];
plot(r1,-(0.8/(r1(end)-r1(1)).^2).*(r1-r1(1)).^2,'k-');
plot(r2,(0.8/(r2(end)-r2(1)).^2).*(r2-r2(1)).^2-0.8,'k-');
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\it\omegat');
ylabel('\iti_{VT1}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});