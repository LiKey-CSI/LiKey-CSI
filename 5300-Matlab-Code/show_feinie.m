%% 绘制两个接收器和发送端形成的菲涅尔区 以及键盘相对于菲涅尔区的位置
clc;
clear;

f1 = 5.24*10^9;       %子载波1频率5.24Ghz
vc = 3.0*10^8;        %光速 
r1 = vc/f1;           %子载波1波长
a1 = zeros(1,20);     %子载波1的菲涅尔双曲区的长半轴
b1 = zeros(1,20);     %子载波1的菲涅尔双曲区的短半轴
at1 = zeros(1,20);    %子载波1的菲涅尔区的长半轴

ct = 0.25;                        %椭圆c
%% 第一个椭圆
figure;
for n=1:20                        %画20个菲涅尔区
    at1(n) = n*r1/4 + ct;         %根据椭圆公式求出每个椭圆的长半轴
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % 根据长半轴和短半轴计算椭圆偏心率
    [elat,elon] = ellipse1(-ct*sqrt(2)/2,ct*sqrt(2)/2,[at1(n) ecc],45);       %中心坐标（0，0）
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;
    hold on;
end 
%% 第二个椭圆
for n=1:20                        %画20个菲涅尔区
    at1(n) = n*r1/4 + ct;         %根据椭圆公式求出每个椭圆的长半轴
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % 根据长半轴和短半轴计算椭圆偏心率
    [elat,elon] = ellipse1(ct*sqrt(2)/2,ct*sqrt(2)/2,[at1(n) ecc],-45);  
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;    
    hold on;
end  
%% 画出按键区域
scatter(0,0.50/sqrt(2),'filled');
text(0-0.02,0.50/sqrt(2)+0.02,'Sender','FontSize',14);
scatter(-0.50/sqrt(2),0,'filled');
text(-0.50/sqrt(2)-0.02,0+0.02,'Rev-2','FontSize',14);
scatter(0.50/sqrt(2),0,'filled');
text(0.50/sqrt(2)-0.02,0+0.02,'Rev-1','FontSize',14);
rec = polyshape([-0.045 -0.045 0.045 0.045],[0 0.09 0.09 0]);
plot(rec,'FaceColor','green','FaceAlpha',0.3);
plot([-0.045 0.045],[0.03,0.03],'k');
plot([-0.045 0.045],[0.06,0.06],'k');
plot([-0.015 -0.015],[0.09,0],'k');
plot([0.015 0.015],[0.09,0],'k');
grid on

rec2 = polyshape([-0.045 -0.045 0.045 0.045],[-0.09 0 0 -0.09]);
plot(rec2,'FaceColor','yellow','FaceAlpha',0.3);
plot([-0.045 0.045],[-0.03,-0.03],'k');
plot([-0.045 0.045],[-0.06,-0.06],'k');
plot([-0.015 -0.015],[0,-0.09],'k');
plot([0.015 0.015],[0,-0.09],'k');

rec3 = polyshape([-0.045 -0.045 0.045 0.045],[-0.18 -0.09 -0.09 -0.18]);
plot(rec3,'FaceColor','red','FaceAlpha',0.3);
plot([-0.045 0.045],[-0.12,-0.12],'k');
plot([-0.045 0.045],[-0.15,-0.15],'k');
plot([-0.015 -0.015],[-0.09,-0.18],'k');
plot([0.015 0.015],[-0.09,-0.18],'k');

rec4 = polyshape([0.045 0.045 0.135 0.135],[-0.18 -0.09 -0.09 -0.18]);
plot(rec4,'FaceColor','magenta','FaceAlpha',0.3);
plot([0.045 0.135],[-0.12,-0.12],'k');
plot([0.045 0.135],[-0.15,-0.15],'k');
plot([0.075 0.075],[-0.09,-0.18],'k');
plot([0.105 0.105],[-0.09,-0.18],'k');

rec5 = polyshape([-0.135 -0.135 0.045 0.045],[-0.18 -0.09 -0.09 -0.18]);
plot(rec5,'FaceColor','blue','FaceAlpha',0.3);
plot([-0.135 -0.045],[-0.12,-0.12],'k');
plot([-0.135 -0.045],[-0.15,-0.15],'k');
plot([-0.105 -0.105],[-0.09,-0.18],'k');
plot([-0.075 -0.075],[-0.09,-0.18],'k');

%% 画波形
%各个点的中心位置
n1 = [-0.03 0.075]; n2 = [0 0.075]; n3 = [0.03 0.075];
n4 = [-0.03 0.045]; n5 = [0 0.045]; n6 = [0.03 0.045];
n7 = [-0.03 0.015]; n8 = [0 0.015];n9 = [0.03 0.015];
num(1,:)=n1;num(2,:)=n2;num(3,:)=n3;num(4,:)=n4;num(5,:)=n5;num(6,:)=n6;
num(7,:)=n7;num(8,:)=n8;num(9,:)=n9;

% %% 物体移动模拟
% % 起点5    终点1-9
% s = num(5,:);%起点
% T = [0 0.50/sqrt(2)];
% P1 = [-0.50/sqrt(2) 0];%Rev-Z
% P2 = [0.50/sqrt(2) 0];%Rev-Z
% figure;
% for cout = 1:9
%     e = num(cout,:);%终点
%     for n=1:500
%         Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q移动物体
%         P1Q = norm(P1-Q);                       %计算P1Q距离
%         P2Q = norm(P2-Q);                       %计算P2Q距离
%         TQ = norm(T-Q);                         %计算发送端到物体距离
%         t = (n-1)/(f1):0.0000000000002:n/(f1);     %显示1个周期波形
%         d0 = 2*ct;                                 %视线到P1距离
%         dt0 = d0/vc;                               %视线到P1时延 
%         dp1 = TQ + P1Q;                            %到P1距离
%         dtp1 = dp1/vc;                             %到P1时延 
%         dp2 = TQ + P2Q;                            %到P2距离
%         dtp2 = dp2/vc;                             %到P2时延
%         x0 = sin(2*pi*f1*(t-dt0));                 %收端视线信号
%         xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1收端信号
%         xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2收端信号
%         subplot(9,4,1+4*(cout-1))    
%         plot(t,xl);                                %左端
%         hold on;
%         subplot(9,4,2+4*(cout-1))
%         plot(t,xr);                                %右端
%         hold on;
%         subplot(9,4,3+4*(cout-1))
%         x3 = xl+xr;                                %相加
%         plot(t,x3); 
%         hold on;
%         subplot(9,4,4+4*(cout-1))
%         x4 = xl-xr;                                %相减
%         plot(t,x4); 
%         hold on;
%     end
% end
% 
% %% 物体移动模拟
% for cot=1:9              %起点1-9
%     figure(cot+1)        %终点1-9
%     for cout=1:9
%             s=num(cot,:); %cot起点  s:start
%             e=num(cout,:);%cout终点  e:end
%         for n=1:500
%             O = [0 0];
%             T = [0,0.15*sqrt(2)];
%             Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q移动物体
%             P1 = [-c 0];                            %焦点1
%             P2 = [c 0];                             %焦点2
%             P1Q = norm(P1-Q);                       %计算P1Q距离
%             P2Q = norm(P2-Q);                       %计算P2Q距离
%             TQ = norm(T-Q);                         %计算发送端到物体距离
%             t = (n-1)/(f1):0.0000000000002:n/(f1);     %显示1个周期波形
%             d0 = 2*ct+0.5*r1;                                 %视线到P1距离
%             dt0 = d0/vc;                               %视线到P1时延 
%             dp1 = TQ + P1Q;                            %到P1距离
%             dtp1 = dp1/vc;                             %到P1时延 
%             dp2 = TQ + P2Q;                            %到P2距离
%             dtp2 = dp2/vc;                             %到P2时延
%             x0 = sin(2*pi*f1*(t-dt0));                 %收端视线信号
%             xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1收端信号
%             xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2收端信号
%             subplot(9,4,1+4*(cout-1))    
%             plot(t,xl);                                %左端
%             hold on;
%             subplot(9,4,2+4*(cout-1))
%             plot(t,xr);                                %右端
%             hold on;
%             subplot(9,4,3+4*(cout-1))
%             x3 = xl+xr;                                %相加
%             plot(t,x3); 
%             hold on;
%             subplot(9,4,4+4*(cout-1))
%             x4 = xl-xr;                                %相减
%             plot(t,x4); 
%             hold on;
%         end
%     end
% end
