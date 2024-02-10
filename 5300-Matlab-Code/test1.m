f1 = 5.24*10^9;       %子载波1频率5.24Ghz
vc = 3.0*10^8;        %光速 
r1 = vc/f1;           %子载波1波长
a1 = zeros(1,20);     %子载波1的菲涅尔双曲区的长半轴
b1 = zeros(1,20);     %子载波1的菲涅尔双曲区的短半轴
at1 = zeros(1,20);    %子载波1的菲涅尔区的长半轴

c =0.15*sqrt(2);                  %双曲c
ct = 0.15;                        %椭圆c
%% 第一个椭圆
for n=1:15                        %画15个菲涅尔区
    at1(n) = n*r1/4 + ct;         %根据椭圆公式求出每个椭圆的长半轴
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % 根据长半轴和短半轴计算椭圆偏心率
    [elat,elon] = ellipse1(-0.15*sqrt(2)/2,0.15*sqrt(2)/2,[at1(n) ecc],45);       %中心坐标（0，0）
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;
    hold on;
end 
%% 第二个椭圆
for n=1:15                        %画20个菲涅尔区
    at1(n) = n*r1/4 + ct;         %根据椭圆公式求出每个椭圆的长半轴
    ecc = axes2ecc(at1(n),sqrt(at1(n)*at1(n)-ct*ct));     % 根据长半轴和短半轴计算椭圆偏心率
    [elat,elon] = ellipse1(0.15*sqrt(2)/2,0.15*sqrt(2)/2,[at1(n) ecc],-45);  
    if mod(n,2)
        plot(elat,elon,'r');
    else
        plot(elat,elon,'b');
    end
    hold on;    
    hold on;
end  
%% 画出按键区域
scatter(0,0.15*sqrt(2));
rec = polyshape([-0.03*sqrt(2) 0 0.03*sqrt(2) 0],[0 0.03*sqrt(2) 0 -0.03*sqrt(2)]);
plot(rec);

grid on
%% 画出双曲
for n=1:10            %画10个菲涅尔双曲区
    figure(1);
    a1(n) = n*r1/4;    %根据双曲公式求出每个椭圆的长半轴
    b1(n) = sqrt(power(c,2)-power(a1(n),2));  %根据双曲公式求出每个椭圆的长半轴
    f = @(x,y) x.^2/power(a1(n),2) - y.^2/power(b1(n),2)-1;   %通过隐函数画图
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
%% 画波形
%各个点的中心位置
n1 = [-0.0283,0]; n2 = [-0.0141,0.0128]; n3 = [0,0.03];
n4 = [-0.0141,-0.016]; n5 = [0,0]; n6 = [0.0141 0.0128];
n7 = [0 -0.03]; n8 = [0.0141 -0.016];n9 = [0.0285 0];
num(1,:)=n1;num(2,:)=n2;num(3,:)=n3;num(4,:)=n4;num(5,:)=n5;num(6,:)=n6;
num(7,:)=n7;num(8,:)=n8;num(9,:)=n9;
%% 物体移动模拟
for cot=1:9              %起点1-9
    figure(cot+1)        %终点1-9
    for cout=1:9
            s=num(cot,:); %cot起点  s:start
            e=num(cout,:);%cout终点  e:end
        for n=1:500
            O = [0 0];
            T = [0,0.15*sqrt(2)];
            Q = [s(1)+(e(1)-s(1))*n/500 s(2)+(e(2)-s(2))*n/500]; %Q移动物体
            P1 = [-c 0];                            %焦点1
            P2 = [c 0];                             %焦点2
            P1Q = norm(P1-Q);                       %计算P1Q距离
            P2Q = norm(P2-Q);                       %计算P2Q距离
            TQ = norm(T-Q);                         %计算发送端到物体距离
            t = (n-1)/(f1):0.0000000000002:n/(f1);     %显示1个周期波形
            d0 = 2*ct+0.5*r1;                                 %视线到P1距离
            dt0 = d0/vc;                               %视线到P1时延 
            dp1 = TQ + P1Q;                            %到P1距离
            dtp1 = dp1/vc;                             %到P1时延 
            dp2 = TQ + P2Q;                            %到P2距离
            dtp2 = dp2/vc;                             %到P2时延
            x0 = sin(2*pi*f1*(t-dt0));                 %收端视线信号
            xl = sin(2*pi*f1*(t-dtp1))+x0;             %P1收端信号
            xr = sin(2*pi*f1*(t-dtp2))+x0;             %P2收端信号
            subplot(9,4,1+4*(cout-1))    
            plot(t,xl);                                %左端
            hold on;
            subplot(9,4,2+4*(cout-1))
            plot(t,xr);                                %右端
            hold on;
            subplot(9,4,3+4*(cout-1))
            x3 = xl+xr;                                %相加
            plot(t,x3); 
            hold on;
            subplot(9,4,4+4*(cout-1))
            x4 = xl-xr;                                %相减
            plot(t,x4); 
            hold on;
        end
    end
end