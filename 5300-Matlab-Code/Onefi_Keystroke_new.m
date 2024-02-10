%% 尝试使用OneFi中的处理过程对按键数据进行处理
clear;
clc;

csi_trace = read_bf_file('./5_11/REV_W/p3_171717.dat'); % 数据文件路径
csi_t1_r1 = zeros(30,length(csi_trace));
csi_t1_r2 = zeros(30,length(csi_trace));
csi_t1_r3 = zeros(30,length(csi_trace));

for i = 1:length(csi_trace)
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_t1_r1(:,i) = squeeze(csi(1,1,:));
    csi_t1_r2(:,i) = squeeze(csi(1,2,:));
    csi_t1_r3(:,i) = squeeze(csi(1,3,:));
end
csi_data = [csi_t1_r1;csi_t1_r2;csi_t1_r3].';
figure;
hold on;
plot(abs(csi_data(:,1)));
plot(abs(csi_data(:,2)));
% plot(abs(csi_data));
hold off;

%% 首先从每个子载波的CSI中去除直流偏移
corrected_csi = remove_dc_offset(csi_data);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
% plot(abs(corrected_csi));
hold off;

%% 利用共轭乘法消除相位偏移
corrected_csi = remove_phase_offset(corrected_csi);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
%plot(abs(corrected_csi));
hold off;

%% 使用高通滤波去除静态分量 低通滤波去除高频噪声
corrected_csi = remove_dc_and_noise(corrected_csi,100,2,20);
figure;
hold on;
plot(abs(corrected_csi(:,1)));
plot(abs(corrected_csi(:,2)));
% plot(abs(corrected_csi));
hold off;

%% 进行主成分分析
pca_csi = perform_pca(corrected_csi);
figure;
hold on;
plot(abs(pca_csi.principal_components(:,1)));
plot(abs(pca_csi.principal_components(:,1)));
hold off;