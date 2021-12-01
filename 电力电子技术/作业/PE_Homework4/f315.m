x = 0: 0.01 : 4*pi;

figure(1)
subplot(2,1,1);
hold on;
plot(x,sin(x),'k--');
plot(x,sin(x+2*pi/3),'k--');
plot(x,sin(x-2*pi/3),'k--');
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\omegat');
% ylabel('\itu_{2}','fontname','times new roman');
% text(1.58,0.9,'\itu_{a}','fontname','times new roman');
% text(3.66,0.9,'\itu_{b}','fontname','times new roman');
% text(5.57,0.9,'\itu_{c}','fontname','times new roman');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});

subplot(2,1,2);
hold on;
plot(x,cos(x),'k--');
plot(x,cos(x-pi/3),'k--');
plot(x,cos(x-2*pi/3),'k--');
plot(x,cos(x-pi),'k--');
plot(x,cos(x+pi/3),'k--');
plot(x,cos(x+2*pi/3),'k--');
% for i=1:13
%     plot([pi/6+(i-1)*pi/3,pi/6+(i-1)*pi/3],[0,sqrt(3)/2],'k-');
%     plot([pi/6+(i-2)*pi/3:0.01:pi/6+(i-1)*pi/3],cos([pi/6+(i-1)*pi/3:0.01:pi/6+(i)*pi/3]-(i-1)*pi/3),'k-')
% end
plot([0,4*pi],[0,0],'k-','linewidth',1.5);
hold off;
xlabel('\omegat');
% ylabel('\itu_{d}','fontname','times new roman');
% text(1.58,0.85,'\itu_{1}','fontname','times new roman');
% text(3.66,0.85,'\itu_{2}','fontname','times new roman');
% text(5.57,0.85,'\itu_{3}','fontname','times new roman');
% text(1.58,0.85,'\itu_{1}','fontname','times new roman');
% text(3.66,0.85,'\itu_{2}','fontname','times new roman');
% text(5.57,0.85,'\itu_{3}','fontname','times new roman');
% text(1.05,0.15,'\alpha');
axis([0 4*pi -1.1 1.1]);
set(gca,'ytick',[]);
set(gca,'xtick',[0:pi:4*pi]);
set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});
% 
% subplot(4,1,3);
% hold on;
% % plot([0,4*pi],[0.8,0.8],'k-')
% plot([0,4*pi],[0,0],'k-','linewidth',1.5);
% hold off;
% xlabel('\omegat');
% ylabel('\iti_{d}','fontname','times new roman');
% 
% axis([0 4*pi -1.1 1.1]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[0:pi:4*pi]);
% set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});
% 
% subplot(4,1,4);
% hold on;
% % plot([pi/2,pi/2+2*pi/3],[0.8,0.8],'k-');
% % plot([pi/2,pi/2],[0,0.8],'k-');
% % plot([pi/2+2*pi/3,pi/2+2*pi/3],[0,0.8],'k-');
% % plot([pi/2+2*pi,2.5*pi+2*pi/3],[0.8,0.8],'k-');
% % plot([pi/2+2*pi,pi/2+2*pi],[0,0.8],'k-');
% % plot([2.5*pi+2*pi/3,2.5*pi+2*pi/3],[0,0.8],'k-');
% plot([0,4*pi],[0,0],'k-','linewidth',1.5);
% hold off;
% xlabel('\omegat');
% ylabel('\iti_{VT1}','fontname','times new roman');
% axis([0 4*pi -1.1 1.1]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[0:pi:4*pi]);
% set(gca,'xticklabel',{'0','\pi','2\pi','3\pi','4\pi'});