x = 0: 0.01 : 4*pi;

figure(1)
subplot(4,1,1);
hold on;
plot(x,sin(x),'k-');
plot(x,sin(x+2*pi/3),'k-');
plot(x,sin(x-2*pi/3),'k-');
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\it\omegat');
ylabel('\itu_{2}','fontname','times new roman');
text(1.58,1.2,'\itu_{a}','fontname','times new roman');
text(3.66,1.2,'\itu_{b}','fontname','times new roman');
text(5.57,1.2,'\itu_{c}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(4,1,2);
hold on;
plot(x,sin(x),'k--');
plot(x,sin(x+2*pi/3),'k--');
plot(x,sin(x-2*pi/3),'k--');
for i=1:7
    plot([1.35+(i-2)*2*pi/3:0.01:pi+(i-2)*2*pi/3],sin([1.35+(i-2)*2*pi/3:0.01:pi+(i-2)*2*pi/3]-(i-2)*2*pi/3),'k-');
    plot([1.35+(i-2)*2*pi/3,1.35+(i-2)*2*pi/3],[0.3,sin(1.35+(i-2)*2*pi/3-(i-2)*2*pi/3)],'k-');
    plot([pi+(i-2)*2*pi/3,pi+(i-2)*2*pi/3],[0,0.4],'k-');
    plot([1.35+(i-1)*2*pi/3,pi+(i-2)*2*pi/3],[0.3,0.4],'k-');
end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\it\omegat');
ylabel('\itu_{d}','fontname','times new roman');
text(1.58,1.2,'\itu_{a}','fontname','times new roman');
text(3.66,1.2,'\itu_{b}','fontname','times new roman');
text(5.57,1.2,'\itu_{c}','fontname','times new roman');

axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(4,1,3);
hold on;
for i=1:2
    plot([1.35+(i-1)*6*pi/3,pi+(i-1)*6*pi/3],[0.8,0.8],'k-');
    r1=[pi/3+(i-1)*6*pi/3:0.01:1.35+(i-1)*6*pi/3];
    r2=[pi+(i-1)*6*pi/3:0.01:1.35+2*pi/3+(i-1)*2*pi];
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
for i=1:2
    plot([1.35+2*pi/3+(i-1)*6*pi/3,pi+2*pi/3+(i-1)*6*pi/3],[0.8,0.8],'k-');
    r3=[pi/3+2*pi/3+(i-1)*6*pi/3:0.01:1.35+2*pi/3+(i-1)*6*pi/3];
    r4=[pi+2*pi/3+(i-1)*6*pi/3:0.01:1.35+4*pi/3+(i-1)*2*pi];
    plot(r3,(0.8/(r3(end)-r3(1)).^2).*(r3-r3(1)).^2,'k-');
    plot(r4,(-0.8/(r4(end)-r4(1)).^3).*(r4-r4(1)).^3+0.8,'k-');
end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\it\omegat');
ylabel('\iti_{VT1}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});