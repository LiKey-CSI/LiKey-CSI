%% 观察复平面运动是否符合预期 —— 单接收机

clc;
clear;

csi_trace = read_log_file('D:\Study\科研\LIKEY\补充实验\补充实验4\data0102\REV2\local1\loc1_p999999_1.dat');%指定读取的数据文件
csi_trace = fun_delete_zeroCSI(csi_trace);
L = length(csi_trace);

Rev_t1_r1 = zeros(56,L);
Rev_t1_r2 = zeros(56,L);
Rev_t1_r3 = zeros(56,L);

Rev_t2_r1 = zeros(56,L);
Rev_t2_r2 = zeros(56,L);
Rev_t2_r3 = zeros(56,L);

for i=1:L
     csi_entry = csi_trace{i};
     csi = csi_entry.csi;
     Rev_t1_r1(:,i) = csi(1,1,:);
     Rev_t1_r2(:,i) = csi(2,1,:);
     Rev_t1_r3(:,i) = csi(3,1,:);
     
     Rev_t2_r1(:,i) = csi(1,2,:);
     Rev_t2_r2(:,i) = csi(2,2,:);
     Rev_t2_r3(:,i) = csi(3,2,:);
end

%% 得到比率数据
ratio_t1_r1r2 = Rev_t1_r1./Rev_t1_r2;
ratio_t1_r1r3 = Rev_t1_r1./Rev_t1_r3;
ratio_t1_r2r3 = Rev_t1_r2./Rev_t1_r3;

ratio_t2_r1r2 = Rev_t2_r1./Rev_t2_r2;
ratio_t2_r1r3 = Rev_t2_r1./Rev_t2_r3;
ratio_t2_r2r3 = Rev_t2_r2./Rev_t2_r3;

ratio_t1t2_r1 = Rev_t1_r1./Rev_t2_r1;
ratio_t1t2_r2 = Rev_t1_r2./Rev_t2_r2;
ratio_t1t2_r3 = Rev_t1_r3./Rev_t2_r3;

%% 得到振幅和相位数据
abs_ratio_t1_r1r2 = abs(ratio_t1_r1r2);
phase_ratio_t1_r1r2 = angle(ratio_t1_r1r2);

abs_ratio_t1_r1r3 = abs(ratio_t1_r1r3);
phase_ratio_t1_r1r3 = angle(ratio_t1_r1r3);

abs_ratio_t1_r2r3 = abs(ratio_t1_r2r3);
phase_ratio_t1_r2r3 = angle(ratio_t1_r2r3);

abs_ratio_t2_r1r2 = abs(ratio_t2_r1r2);
phase_ratio_t2_r1r2 = angle(ratio_t2_r1r2);

abs_ratio_t2_r1r3 = abs(ratio_t2_r1r3);
phase_ratio_t2_r1r3 = angle(ratio_t2_r1r3);

abs_ratio_t2_r2r3 = abs(ratio_t2_r2r3);
phase_ratio_t2_r2r3 = angle(ratio_t2_r2r3);

abs_ratio_t1t2_r1 = abs(ratio_t1t2_r1);
phase_ratio_t1t2_r1 = angle(ratio_t1t2_r1);

abs_ratio_t1t2_r2 = abs(ratio_t1t2_r2);
phase_ratio_t1t2_r2 = angle(ratio_t1t2_r2);

abs_ratio_t1t2_r3 = abs(ratio_t1t2_r3);
phase_ratio_t1t2_r3 = angle(ratio_t1t2_r3);

%% 进行去异常值和滤波操作
abs_ratio_t1_r1r2 = func_use_hampel(abs_ratio_t1_r1r2);
abs_ratio_t1_r1r2 = func_sg(abs_ratio_t1_r1r2);

phase_ratio_t1_r1r2 = func_use_hampel(phase_ratio_t1_r1r2);
phase_ratio_t1_r1r2 = func_sg(phase_ratio_t1_r1r2);

abs_ratio_t1_r1r3 = func_use_hampel(abs_ratio_t1_r1r3);
abs_ratio_t1_r1r3 = func_sg(abs_ratio_t1_r1r3);

phase_ratio_t1_r1r3 = func_use_hampel(phase_ratio_t1_r1r3);
phase_ratio_t1_r1r3 = func_sg(phase_ratio_t1_r1r3);

abs_ratio_t1_r2r3 = func_use_hampel(abs_ratio_t1_r2r3);
abs_ratio_t1_r2r3 = func_sg(abs_ratio_t1_r2r3);

phase_ratio_t1_r2r3 = func_use_hampel(phase_ratio_t1_r2r3);
phase_ratio_t1_r2r3 = func_sg(phase_ratio_t1_r2r3);

abs_ratio_t2_r1r2 = func_use_hampel(abs_ratio_t2_r1r2);
abs_ratio_t2_r1r2 = func_sg(abs_ratio_t2_r1r2);

phase_ratio_t2_r1r2 = func_use_hampel(phase_ratio_t2_r1r2);
phase_ratio_t2_r1r2 = func_sg(phase_ratio_t2_r1r2);

abs_ratio_t2_r1r3 = func_use_hampel(abs_ratio_t2_r1r3);
abs_ratio_t2_r1r3 = func_sg(abs_ratio_t2_r1r3);

phase_ratio_t2_r1r3 = func_use_hampel(phase_ratio_t2_r1r3);
phase_ratio_t2_r1r3 = func_sg(phase_ratio_t2_r1r3);

abs_ratio_t2_r2r3 = func_use_hampel(abs_ratio_t2_r2r3);
abs_ratio_t2_r2r3 = func_sg(abs_ratio_t2_r2r3);

phase_ratio_t2_r2r3 = func_use_hampel(phase_ratio_t2_r2r3);
phase_ratio_t2_r2r3 = func_sg(phase_ratio_t2_r2r3);

abs_ratio_t1t2_r1 = func_use_hampel(abs_ratio_t1t2_r1);
abs_ratio_t1t2_r1 = func_sg(abs_ratio_t1t2_r1);

phase_ratio_t1t2_r1 = func_use_hampel(phase_ratio_t1t2_r1);
phase_ratio_t1t2_r1 = func_sg(phase_ratio_t1t2_r1);

abs_ratio_t1t2_r2 = func_use_hampel(abs_ratio_t1t2_r2);
abs_ratio_t1t2_r2 = func_sg(abs_ratio_t1t2_r2);

phase_ratio_t1t2_r2 = func_use_hampel(phase_ratio_t1t2_r2);
phase_ratio_t1t2_r2 = func_sg(phase_ratio_t1t2_r2);

abs_ratio_t1t2_r3 = func_use_hampel(abs_ratio_t1t2_r3);
abs_ratio_t1t2_r3 = func_sg(abs_ratio_t1t2_r3);

phase_ratio_t1t2_r3 = func_use_hampel(phase_ratio_t1t2_r3);
phase_ratio_t1t2_r3 = func_sg(phase_ratio_t1t2_r3);

%% 复数的重构
ratio_t1_r1r2 = abs_ratio_t1_r1r2 .* exp(1i*phase_ratio_t1_r1r2);
ratio_t1_r1r3 = abs_ratio_t1_r1r3 .* exp(1i*phase_ratio_t1_r1r3);
ratio_t1_r2r3 = abs_ratio_t1_r2r3 .* exp(1i*phase_ratio_t1_r2r3);

ratio_t2_r1r2 = abs_ratio_t2_r1r2 .* exp(1i*phase_ratio_t2_r1r2);
ratio_t2_r1r3 = abs_ratio_t2_r1r3 .* exp(1i*phase_ratio_t2_r1r3);
ratio_t2_r2r3 = abs_ratio_t2_r2r3 .* exp(1i*phase_ratio_t2_r2r3);

ratio_t1t2_r1 = abs_ratio_t1t2_r1 .* exp(1i*phase_ratio_t1t2_r1);
ratio_t1t2_r2 = abs_ratio_t1t2_r2 .* exp(1i*phase_ratio_t1t2_r2);
ratio_t1t2_r3 = abs_ratio_t1t2_r3 .* exp(1i*phase_ratio_t1t2_r3);

%% 滤波后波形的展示
figure;
subplot(3,1,1);
plot(abs_ratio_t1_r1r2.');
subplot(3,1,2);
plot(abs_ratio_t1_r1r3.');
subplot(3,1,3);
plot(abs_ratio_t1_r2r3.');

figure;
subplot(3,1,1);
plot(abs_ratio_t2_r1r2.');
subplot(3,1,2);
plot(abs_ratio_t2_r1r3.');
subplot(3,1,3);
plot(abs_ratio_t2_r2r3.');

figure;
subplot(3,1,1);
plot(abs_ratio_t1t2_r1.');
subplot(3,1,2);
plot(abs_ratio_t1t2_r2.');
subplot(3,1,3);
plot(abs_ratio_t1t2_r3.');

%% 选择某一子载波进行展示
choose_sub = 16;

figure;
subplot(3,2,1);
plot(abs_ratio_t1_r1r2(choose_sub,:));
subplot(3,2,2);
plot(phase_ratio_t1_r1r2(choose_sub,:));
subplot(3,2,3);
plot(abs_ratio_t1_r1r3(choose_sub,:));
subplot(3,2,4);
plot(phase_ratio_t1_r1r3(choose_sub,:));
subplot(3,2,5);
plot(abs_ratio_t1_r2r3(choose_sub,:));
subplot(3,2,6);
plot(phase_ratio_t1_r2r3(choose_sub,:));

figure;
subplot(3,2,1);
plot(abs_ratio_t2_r1r2(choose_sub,:));
subplot(3,2,2);
plot(phase_ratio_t2_r1r2(choose_sub,:));
subplot(3,2,3);
plot(abs_ratio_t2_r1r3(choose_sub,:));
subplot(3,2,4);
plot(phase_ratio_t2_r1r3(choose_sub,:));
subplot(3,2,5);
plot(abs_ratio_t2_r2r3(choose_sub,:));
subplot(3,2,6);
plot(phase_ratio_t2_r2r3(choose_sub,:));

figure;
subplot(3,2,1);
plot(abs_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,2);
plot(phase_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,3);
plot(abs_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,4);
plot(phase_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,5);
plot(abs_ratio_t1t2_r3(choose_sub,:));
subplot(3,2,6);
plot(phase_ratio_t1t2_r3(choose_sub,:));

%% 复平面运动的观察
show_range = 990:2001;
show_csi = ratio_t1t2_r2(choose_sub,:); % 目前来看效果最好的是t1t2_r2

fig1_flag = 1;
figure;
for n=show_range
    hold on;
    if n==show_range(1)
        plot(show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(show_csi(n)),imag(show_csi(n)),'Start point');
    elseif n==show_range(end)
        plot(show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
        text(real(show_csi(n)),imag(show_csi(n)),'End point');
    else
        plot(show_csi(n),'r.');
    end
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('CSI Ratio after Filter-Complex Plane','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
   
    pause(0.01)
end