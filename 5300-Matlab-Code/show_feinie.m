%% ���������������ͷ��Ͷ��γɵķ������� �Լ���������ڷ���������λ��
clc;
clear;

f1 = 5.24*10^9;       %���ز�1Ƶ��5.24Ghz
vc = 3.0*10^8;        %���� 
r1 = vc/f1;           %���ز�1����
a1 = zeros(1,20);     %���ز�1�ķ�����˫�����ĳ�����
b1 = zeros(1,20);     %���ز�1�ķ�����˫�����Ķ̰���
at1 = zeros(1,20);    %���ز�1�ķ��������ĳ�����

ct = 0.25;                        %��Բc
%% ��һ����Բ
figure;
for n=1:20                        %��20����������
    at1(n) = n*r1/4 + ct;         %������Բ��ʽ���ÿ����Բ�ĳ�����
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % ���ݳ�����Ͷ̰��������Բƫ����
    [elat,elon] = ellipse1(-ct*sqrt(2)/2,ct*sqrt(2)/2,[at1(n) ecc],45);       %�������꣨0��0��
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;
    hold on;
end 
%% �ڶ�����Բ
for n=1:20                        %��20����������
    at1(n) = n*r1/4 + ct;         %������Բ��ʽ���ÿ����Բ�ĳ�����
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % ���ݳ�����Ͷ̰��������Բƫ����
    [elat,elon] = ellipse1(ct*sqrt(2)/2,ct*sqrt(2)/2,[at1(n) ecc],-45);  
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;    
    hold on;
end  
%% ������������
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

%% ������
%�����������λ��
n1 = [-0.03 0.075]; n2 = [0 0.075]; n3 = [0.03 0.075];
n4 = [-0.03 0.045]; n5 = [0 0.045]; n6 = [0.03 0.045];
n7 = [-0.03 0.015]; n8 = [0 0.015];n9 = [0.03 0.015];
num(1,:)=n1;num(2,:)=n2;num(3,:)=n3;num(4,:)=n4;num(5,:)=n5;num(6,:)=n6;
num(7,:)=n7;num(8,:)=n8;num(9,:)=n9;

% %% �����ƶ�ģ��
% % ���5    �յ�1-9
% s = num(5,:);%���
% T = [0 0.50/sqrt(2)];
% P1 = [-0.50/sqrt(2) 0];%Rev-Z
% P2 = [0.50/sqrt(2) 0];%Rev-Z
% figure;
% for cout = 1:9
%     e = num(cout,:);%�յ�
%     for n=1:500
%         Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q�ƶ�����
%         P1Q = norm(P1-Q);                       %����P1Q����
%         P2Q = norm(P2-Q);                       %����P2Q����
%         TQ = norm(T-Q);                         %���㷢�Ͷ˵��������
%         t = (n-1)/(f1):0.0000000000002:n/(f1);     %��ʾ1�����ڲ���
%         d0 = 2*ct;                                 %���ߵ�P1����
%         dt0 = d0/vc;                               %���ߵ�P1ʱ�� 
%         dp1 = TQ + P1Q;                            %��P1����
%         dtp1 = dp1/vc;                             %��P1ʱ�� 
%         dp2 = TQ + P2Q;                            %��P2����
%         dtp2 = dp2/vc;                             %��P2ʱ��
%         x0 = sin(2*pi*f1*(t-dt0));                 %�ն������ź�
%         xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1�ն��ź�
%         xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2�ն��ź�
%         subplot(9,4,1+4*(cout-1))    
%         plot(t,xl);                                %���
%         hold on;
%         subplot(9,4,2+4*(cout-1))
%         plot(t,xr);                                %�Ҷ�
%         hold on;
%         subplot(9,4,3+4*(cout-1))
%         x3 = xl+xr;                                %���
%         plot(t,x3); 
%         hold on;
%         subplot(9,4,4+4*(cout-1))
%         x4 = xl-xr;                                %���
%         plot(t,x4); 
%         hold on;
%     end
% end
% 
% %% �����ƶ�ģ��
% for cot=1:9              %���1-9
%     figure(cot+1)        %�յ�1-9
%     for cout=1:9
%             s=num(cot,:); %cot���  s:start
%             e=num(cout,:);%cout�յ�  e:end
%         for n=1:500
%             O = [0 0];
%             T = [0,0.15*sqrt(2)];
%             Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q�ƶ�����
%             P1 = [-c 0];                            %����1
%             P2 = [c 0];                             %����2
%             P1Q = norm(P1-Q);                       %����P1Q����
%             P2Q = norm(P2-Q);                       %����P2Q����
%             TQ = norm(T-Q);                         %���㷢�Ͷ˵��������
%             t = (n-1)/(f1):0.0000000000002:n/(f1);     %��ʾ1�����ڲ���
%             d0 = 2*ct+0.5*r1;                                 %���ߵ�P1����
%             dt0 = d0/vc;                               %���ߵ�P1ʱ�� 
%             dp1 = TQ + P1Q;                            %��P1����
%             dtp1 = dp1/vc;                             %��P1ʱ�� 
%             dp2 = TQ + P2Q;                            %��P2����
%             dtp2 = dp2/vc;                             %��P2ʱ��
%             x0 = sin(2*pi*f1*(t-dt0));                 %�ն������ź�
%             xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1�ն��ź�
%             xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2�ն��ź�
%             subplot(9,4,1+4*(cout-1))    
%             plot(t,xl);                                %���
%             hold on;
%             subplot(9,4,2+4*(cout-1))
%             plot(t,xr);                                %�Ҷ�
%             hold on;
%             subplot(9,4,3+4*(cout-1))
%             x3 = xl+xr;                                %���
%             plot(t,x3); 
%             hold on;
%             subplot(9,4,4+4*(cout-1))
%             x4 = xl-xr;                                %���
%             plot(t,x4); 
%             hold on;
%         end
%     end
% end
