f1 = 5.24*10^9;       %���ز�1Ƶ��5.24Ghz
vc = 3.0*10^8;        %���� 
r1 = vc/f1;           %���ز�1����
a1 = zeros(1,20);     %���ز�1�ķ�����˫�����ĳ�����
b1 = zeros(1,20);     %���ز�1�ķ�����˫�����Ķ̰���
at1 = zeros(1,20);    %���ز�1�ķ��������ĳ�����

c =0.15*sqrt(2);                  %˫��c
ct = 0.15;                        %��Բc
%% ��һ����Բ
for n=1:15                        %��15����������
    at1(n) = n*r1/4 + ct;         %������Բ��ʽ���ÿ����Բ�ĳ�����
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % ���ݳ�����Ͷ̰��������Բƫ����
    [elat,elon] = ellipse1(-0.15*sqrt(2)/2,0.15*sqrt(2)/2,[at1(n) ecc],45);       %�������꣨0��0��
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;
    hold on;
end 
%% �ڶ�����Բ
for n=1:15                        %��20����������
    at1(n) = n*r1/4 + ct;         %������Բ��ʽ���ÿ����Բ�ĳ�����
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % ���ݳ�����Ͷ̰��������Բƫ����
    [elat,elon] = ellipse1(0.15*sqrt(2)/2,0.15*sqrt(2)/2,[at1(n) ecc],-45);  
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;    
    hold on;
end  
%% ������������
scatter(0,0.15*sqrt(2));
rec = polyshape([-0.03*sqrt(2) 0 0.03*sqrt(2) 0],[0 0.03*sqrt(2) 0 -0.03*sqrt(2)]);
plot(rec);

grid on
%% ����˫��
for n=1:10            %��10��������˫����
    figure(1);
    a1(n) = n*r1/4;    %����˫����ʽ���ÿ����Բ�ĳ�����
    b1(n) = sqrt(power(c,2)-power(a1(n),2));  %����˫����ʽ���ÿ����Բ�ĳ�����
    f = @(x,y) x.^2/power(a1(n),2) - y.^2/power(b1(n),2)-1;   %ͨ����������ͼ
    fimplicit(f,[-0.4 0.4 -0.4 0.4],'g');
    hold on;
    zx1(n) = sqrt((1+1/power(b1(n),2))*power(a1(n),2));
end  
grid on;
scatter(-c,0);        
scatter(c,0);
scatter(0,0);
xlim([-0.4 0.4]);
ylim([-0.2 0.4]);
%% ������
%�����������λ��
n1 = [-0.0283,0]; n2 = [-0.0141,0.0128]; n3 = [0,0.03];
n4 = [-0.0141,-0.016]; n5 = [0,0]; n6 = [0.0141 0.0128];
n7 = [0 -0.03]; n8 = [0.0141 -0.016];n9 = [0.0285 0];
num(1,:)=n1;num(2,:)=n2;num(3,:)=n3;num(4,:)=n4;num(5,:)=n5;num(6,:)=n6;
num(7,:)=n7;num(8,:)=n8;num(9,:)=n9;
%% �����ƶ�ģ��
for cot=1:9              %���1-9
    figure(cot+1)        %�յ�1-9
    for cout=1:9
            s=num(cot,:); %cot���  s:start
            e=num(cout,:);%cout�յ�  e:end
        for n=1:500
            O = [0 0];
            T = [0,0.15*sqrt(2)];
            Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q�ƶ�����
            P1 = [-c 0];                            %����1
            P2 = [c 0];                             %����2
            P1Q = norm(P1-Q);                       %����P1Q����
            P2Q = norm(P2-Q);                       %����P2Q����
            TQ = norm(T-Q);                         %���㷢�Ͷ˵��������
            t = (n-1)/(f1):0.0000000000002:n/(f1);     %��ʾ1�����ڲ���
            d0 = 2*ct+0.5*r1;                                 %���ߵ�P1����
            dt0 = d0/vc;                               %���ߵ�P1ʱ�� 
            dp1 = TQ + P1Q;                            %��P1����
            dtp1 = dp1/vc;                             %��P1ʱ�� 
            dp2 = TQ + P2Q;                            %��P2����
            dtp2 = dp2/vc;                             %��P2ʱ��
            x0 = sin(2*pi*f1*(t-dt0));                 %�ն������ź�
            xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1�ն��ź�
            xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2�ն��ź�
            subplot(9,4,1+4*(cout-1))    
            plot(t,xl);                                %���
            hold on;
            subplot(9,4,2+4*(cout-1))
            plot(t,xr);                                %�Ҷ�
            hold on;
            subplot(9,4,3+4*(cout-1))
            x3 = xl+xr;                                %���
            plot(t,x3); 
            hold on;
            subplot(9,4,4+4*(cout-1))
            x4 = xl-xr;                                %���
            plot(t,x4); 
            hold on;
        end
    end
end