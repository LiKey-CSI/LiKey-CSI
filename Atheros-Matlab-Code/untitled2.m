clc;
clear;

csi_trace1 = read_log_file('F:\data0122\loc3.dat');%指定读取的数据文件

csi_trace1 = fun_delete_zeroCSI(csi_trace1);
L1 = length(csi_trace1);

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


%% 得到比率数据

t1r1_abs = abs(Rev1_t1_r1);
t1r2_abs = abs(Rev1_t1_r2);
t1r3_abs = abs(Rev1_t1_r3);
t2r1_abs = abs(Rev1_t2_r1);
t2r2_abs = abs(Rev1_t2_r2);
t2r3_abs = abs(Rev1_t2_r3);

t1r2_abs = func_use_hampel(t1r2_abs);
t1r2_abs = func_sg(t1r2_abs);

figure

Rev1_ratio_t1t2_r1 = Rev1_t1_r1./Rev1_t2_r1;
Rev1_ratio_t1t2_r2 = Rev1_t1_r2./Rev1_t2_r2;
Rev1_ratio_t1t2_r3 = Rev1_t1_r3./Rev1_t2_r3;


%% 得到振幅和相位数据
abs_Rev1_ratio_t1t2_r1 = abs(Rev1_ratio_t1t2_r1);
phase_Rev1_ratio_t1t2_r1 = angle(Rev1_ratio_t1t2_r1);

abs_Rev1_ratio_t1t2_r2 = abs(Rev1_ratio_t1t2_r2);
phase_Rev1_ratio_t1t2_r2 = angle(Rev1_ratio_t1t2_r2);

abs_Rev1_ratio_t1t2_r3 = abs(Rev1_ratio_t1t2_r3);
phase_Rev1_ratio_t1t2_r3 = angle(Rev1_ratio_t1t2_r3);



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


%% 滤波后波形的展示
figure;
subplot(3,1,1);
plot(abs_Rev1_ratio_t1t2_r1.');
subplot(3,1,2);
plot(abs_Rev1_ratio_t1t2_r2.');
subplot(3,1,3);
plot(abs_Rev1_ratio_t1t2_r3.');
sgtitle('Rev1 Amplitude Waveform');

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
