%% 观察复平面运动是否符合预期 —— 双接收机
%% 对应整体框架中的预处理过程
clc;
clear;

csi_trace1 = read_log_file('D:\Study\科研\LIKEY\补充实验\补充实验4\data0102\REV1\local5\loc5_p111111_1.dat');%指定读取的数据文件
csi_trace2 = read_log_file('D:\Study\科研\LIKEY\补充实验\补充实验4\data0102\REV2\local5\loc5_p111111_1.dat');%指定读取的数据文件

csi_trace1 = fun_delete_zeroCSI(csi_trace1);
L1 = length(csi_trace1);
csi_trace2 = fun_delete_zeroCSI(csi_trace2);
L2 = length(csi_trace2);

Rev1_t1_r1 = zeros(56,L1);
Rev1_t1_r2 = zeros(56,L1);
Rev1_t1_r3 = zeros(56,L1);

Rev1_t2_r1 = zeros(56,L1);
Rev1_t2_r2 = zeros(56,L1);
Rev1_t2_r3 = zeros(56,L1);

for i=1:L1
     csi_entry = csi_trace1{i};
     csi = csi_entry.csi;
     Rev1_t1_r1(:,i) = csi(1,1,:);
     Rev1_t1_r2(:,i) = csi(2,1,:);
     Rev1_t1_r3(:,i) = csi(3,1,:);
     
     Rev1_t2_r1(:,i) = csi(1,2,:);
     Rev1_t2_r2(:,i) = csi(2,2,:);
     Rev1_t2_r3(:,i) = csi(3,2,:);
end

Rev2_t1_r1 = zeros(56,L2);
Rev2_t1_r2 = zeros(56,L2);
Rev2_t1_r3 = zeros(56,L2);

Rev2_t2_r1 = zeros(56,L2);
Rev2_t2_r2 = zeros(56,L2);
Rev2_t2_r3 = zeros(56,L2);

for i=1:L2
     csi_entry = csi_trace2{i};
     csi = csi_entry.csi;
     Rev2_t1_r1(:,i) = csi(1,1,:);
     Rev2_t1_r2(:,i) = csi(2,1,:);
     Rev2_t1_r3(:,i) = csi(3,1,:);
     
     Rev2_t2_r1(:,i) = csi(1,2,:);
     Rev2_t2_r2(:,i) = csi(2,2,:);
     Rev2_t2_r3(:,i) = csi(3,2,:);
end

%% 得到比率数据

Rev1_ratio_t1t2_r1 = Rev1_t1_r1./Rev1_t2_r1;
Rev1_ratio_t1t2_r2 = Rev1_t1_r2./Rev1_t2_r2;
Rev1_ratio_t1t2_r3 = Rev1_t1_r3./Rev1_t2_r3;

Rev2_ratio_t1t2_r1 = Rev2_t1_r1./Rev2_t2_r1;
Rev2_ratio_t1t2_r2 = Rev2_t1_r2./Rev2_t2_r2;
Rev2_ratio_t1t2_r3 = Rev2_t1_r3./Rev2_t2_r3;

%% 得到振幅和相位数据
abs_Rev1_ratio_t1t2_r1 = abs(Rev1_ratio_t1t2_r1);
phase_Rev1_ratio_t1t2_r1 = angle(Rev1_ratio_t1t2_r1);

abs_Rev1_ratio_t1t2_r2 = abs(Rev1_ratio_t1t2_r2);
phase_Rev1_ratio_t1t2_r2 = angle(Rev1_ratio_t1t2_r2);

abs_Rev1_ratio_t1t2_r3 = abs(Rev1_ratio_t1t2_r3);
phase_Rev1_ratio_t1t2_r3 = angle(Rev1_ratio_t1t2_r3);

abs_Rev2_ratio_t1t2_r1 = abs(Rev2_ratio_t1t2_r1);
phase_Rev2_ratio_t1t2_r1 = angle(Rev2_ratio_t1t2_r1);

abs_Rev2_ratio_t1t2_r2 = abs(Rev2_ratio_t1t2_r2);
phase_Rev2_ratio_t1t2_r2 = angle(Rev2_ratio_t1t2_r2);

abs_Rev2_ratio_t1t2_r3 = abs(Rev2_ratio_t1t2_r3);
phase_Rev2_ratio_t1t2_r3 = angle(Rev2_ratio_t1t2_r3);

%% 进行去异常值和滤波操作
abs_Rev1_ratio_t1t2_r1 = func_use_hampel(abs_Rev1_ratio_t1t2_r1);
abs_Rev1_ratio_t1t2_r1 = func_sg(abs_Rev1_ratio_t1t2_r1);

phase_Rev1_ratio_t1t2_r1 = func_use_hampel(phase_Rev1_ratio_t1t2_r1);
phase_Rev1_ratio_t1t2_r1 = func_sg(phase_Rev1_ratio_t1t2_r1);

abs_Rev1_ratio_t1t2_r2 = func_use_hampel(abs_Rev1_ratio_t1t2_r2);
abs_Rev1_ratio_t1t2_r2 = func_sg(abs_Rev1_ratio_t1t2_r2);

phase_Rev1_ratio_t1t2_r2 = func_use_hampel(phase_Rev1_ratio_t1t2_r2);
phase_Rev1_ratio_t1t2_r2 = func_sg(phase_Rev1_ratio_t1t2_r2);

abs_Rev1_ratio_t1t2_r3 = func_use_hampel(abs_Rev1_ratio_t1t2_r3);
abs_Rev1_ratio_t1t2_r3 = func_sg(abs_Rev1_ratio_t1t2_r3);

phase_Rev1_ratio_t1t2_r3 = func_use_hampel(phase_Rev1_ratio_t1t2_r3);
phase_Rev1_ratio_t1t2_r3 = func_sg(phase_Rev1_ratio_t1t2_r3);

abs_Rev2_ratio_t1t2_r1 = func_use_hampel(abs_Rev2_ratio_t1t2_r1);
abs_Rev2_ratio_t1t2_r1 = func_sg(abs_Rev2_ratio_t1t2_r1);

phase_Rev2_ratio_t1t2_r1 = func_use_hampel(phase_Rev2_ratio_t1t2_r1);
phase_Rev2_ratio_t1t2_r1 = func_sg(phase_Rev2_ratio_t1t2_r1);

abs_Rev2_ratio_t1t2_r2 = func_use_hampel(abs_Rev2_ratio_t1t2_r2);
abs_Rev2_ratio_t1t2_r2 = func_sg(abs_Rev2_ratio_t1t2_r2);

phase_Rev2_ratio_t1t2_r2 = func_use_hampel(phase_Rev2_ratio_t1t2_r2);
phase_Rev2_ratio_t1t2_r2 = func_sg(phase_Rev2_ratio_t1t2_r2);

abs_Rev2_ratio_t1t2_r3 = func_use_hampel(abs_Rev2_ratio_t1t2_r3);
abs_Rev2_ratio_t1t2_r3 = func_sg(abs_Rev2_ratio_t1t2_r3);

phase_Rev2_ratio_t1t2_r3 = func_use_hampel(phase_Rev2_ratio_t1t2_r3);
phase_Rev2_ratio_t1t2_r3 = func_sg(phase_Rev2_ratio_t1t2_r3);

%% 复数的重构
Rev1_ratio_t1t2_r1 = abs_Rev1_ratio_t1t2_r1 .* exp(1i*phase_Rev1_ratio_t1t2_r1);
Rev1_ratio_t1t2_r2 = abs_Rev1_ratio_t1t2_r2 .* exp(1i*phase_Rev1_ratio_t1t2_r2);
Rev1_ratio_t1t2_r3 = abs_Rev1_ratio_t1t2_r3 .* exp(1i*phase_Rev1_ratio_t1t2_r3);

Rev2_ratio_t1t2_r1 = abs_Rev2_ratio_t1t2_r1 .* exp(1i*phase_Rev2_ratio_t1t2_r1);
Rev2_ratio_t1t2_r2 = abs_Rev2_ratio_t1t2_r2 .* exp(1i*phase_Rev2_ratio_t1t2_r2);
Rev2_ratio_t1t2_r3 = abs_Rev2_ratio_t1t2_r3 .* exp(1i*phase_Rev2_ratio_t1t2_r3);

%% 滤波后波形的展示
figure;
subplot(3,1,1);
plot(abs_Rev1_ratio_t1t2_r1.');
subplot(3,1,2);
plot(abs_Rev1_ratio_t1t2_r2.');
subplot(3,1,3);
plot(abs_Rev1_ratio_t1t2_r3.');
sgtitle('Rev1 Amplitude Waveform');

figure;
subplot(3,1,1);
plot(abs_Rev2_ratio_t1t2_r1.');
subplot(3,1,2);
plot(abs_Rev2_ratio_t1t2_r2.');
subplot(3,1,3);
plot(abs_Rev2_ratio_t1t2_r3.');
sgtitle('Rev2 Amplitude Waveform');

%% 选择某一子载波进行展示
choose_sub = 1;
figure;
subplot(3,2,1);
plot(abs_Rev1_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,2);
plot(phase_Rev1_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,3);
plot(abs_Rev1_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,4);
plot(phase_Rev1_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,5);
plot(abs_Rev1_ratio_t1t2_r3(choose_sub,:));
subplot(3,2,6);
plot(phase_Rev1_ratio_t1t2_r3(choose_sub,:));
sgtitle('Rev1某一子载波振幅和相位波形');

figure;
subplot(3,2,1);
plot(abs_Rev2_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,2);
plot(phase_Rev2_ratio_t1t2_r1(choose_sub,:));
subplot(3,2,3);
plot(abs_Rev2_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,4);
plot(phase_Rev2_ratio_t1t2_r2(choose_sub,:));
subplot(3,2,5);
plot(abs_Rev2_ratio_t1t2_r3(choose_sub,:));
subplot(3,2,6);
plot(phase_Rev2_ratio_t1t2_r3(choose_sub,:));
sgtitle('Rev2某一子载波振幅和相位波形');


choose_sub = 28;
show_range = 6027:7138;
Rev1_show_csi = Rev1_ratio_t1t2_r1(choose_sub,:); % 目前来看效果最好的是t1t2_r2
Rev2_show_csi = Rev2_ratio_t1t2_r1(choose_sub,:);
fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range
subplot(2,1,1);
hold on;
if n==show_range(1)
plot(Rev1_show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
text(real(Rev1_show_csi(n)),imag(Rev1_show_csi(n)),'Start point');
elseif n==show_range(end)
plot(Rev1_show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
text(real(Rev1_show_csi(n)),imag(Rev1_show_csi(n)),'End point');
else
plot(Rev1_show_csi(n),'r.');
end
hold off;
if fig1_flag
fig1_flag = 0;
set(gca,'FontWeight','bold');
title('Rev1-Complex Plane','FontWeight','bold','FontSize',14);
xlabel('Real');
ylabel('Imag');
end
subplot(2,1,2);
hold on;
if n==show_range(1)
plot(Rev2_show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
text(real(Rev2_show_csi(n)),imag(Rev2_show_csi(n)),'Start point');
elseif n==show_range(end)
plot(Rev2_show_csi(n),'r.','MarkerSize',30,'MarkerFaceColor','g','MarkerEdgeColor','g');
text(real(Rev2_show_csi(n)),imag(Rev2_show_csi(n)),'End point');
else
plot(Rev2_show_csi(n),'b.');
end
hold off;
if fig2_flag
fig2_flag = 0;
set(gca,'FontWeight','bold');
title('Rev2-Complex Plane','FontWeight','bold','FontSize',14);
xlabel('Real');
ylabel('Imag');
end
pause(0.01)
end