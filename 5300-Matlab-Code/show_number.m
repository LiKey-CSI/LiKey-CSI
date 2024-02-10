%% 5月11日——展示按键波形
clc;
clear;

csi_trace = read_bf_file('./523_fu/5_23_w/p2_123456789.dat'); % 数据文件路径
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

%% 实部和虚部
% imag_csi_t1_r1 = imag(csi_t1_r1);
% real_csi_t1_r1 = real(csi_t1_r1);
% imag_csi_t1_r2 = imag(csi_t1_r2);
% real_csi_t1_r2 = real(csi_t1_r2);
% imag_csi_t1_r3 = imag(csi_t1_r3);
% real_csi_t1_r3 = real(csi_t1_r3);
% 
% figure;
% plot(real_csi_t1_r1(16,94:156),imag_csi_t1_r1(16,94:156));
% hold on;
% plot(real_csi_t1_r2(16,94:156),imag_csi_t1_r2(16,94:156));
% plot(real_csi_t1_r3(16,94:156),imag_csi_t1_r3(16,94:156));

%% 得到比率数据
ratio_r1r2 = csi_t1_r1./csi_t1_r2;
ratio_r1r3 = csi_t1_r1./csi_t1_r3;
ratio_r2r3 = csi_t1_r2./csi_t1_r3;

% real_csi_t1_rb = real(ratio_r1r3);   %第一根天线的csi实部
% imag_csi_t1_rb = imag(ratio_r1r3);   %第一根天线的csi虚部
% tex = 495:564;
% tex = string(tex);
% figure;
% plot(real_csi_t1_rb(16,495:564),imag_csi_t1_rb(16,495:564));
% text(real_csi_t1_rb(16,495:564),imag_csi_t1_rb(16,495:564),tex);

%比率振幅数据
abs_ratio_r1r2 = abs(ratio_r1r2);
abs_ratio_r1r3 = abs(ratio_r1r3);
abs_ratio_r2r3 = abs(ratio_r2r3);
%比率相位数据
phase_ratio_r1r2 = angle(ratio_r1r2);
phase_ratio_r1r3 = angle(ratio_r1r3);
phase_ratio_r2r3 = angle(ratio_r2r3);

%去除振幅和相位异常值
abs_ratio_r1r2 = Use_hampel(abs_ratio_r1r2);
abs_ratio_r1r3 = Use_hampel(abs_ratio_r1r3);
abs_ratio_r2r3 = Use_hampel(abs_ratio_r2r3);

phase_ratio_r1r2 = Use_hampel(phase_ratio_r1r2);
phase_ratio_r1r3 = Use_hampel(phase_ratio_r1r3);
phase_ratio_r2r3 = Use_hampel(phase_ratio_r2r3);

%对振幅和相位进行Savitzky-Golay滤波
abs_ratio_r1r2 = func_sg(abs_ratio_r1r2);
abs_ratio_r1r3 = func_sg(abs_ratio_r1r3);
abs_ratio_r2r3 = func_sg(abs_ratio_r2r3);

phase_ratio_r1r2 = func_sg(phase_ratio_r1r2);
phase_ratio_r1r3 = func_sg(phase_ratio_r1r3);
phase_ratio_r2r3 = func_sg(phase_ratio_r2r3);

%归一化处理
abs_ratio_r1r2 = fun_allNormalized_1(abs_ratio_r1r2);
abs_ratio_r1r3 = fun_allNormalized_1(abs_ratio_r1r3);
abs_ratio_r2r3 = fun_allNormalized_1(abs_ratio_r2r3);
phase_ratio_r1r2 = fun_allNormalized_1(phase_ratio_r1r2);
phase_ratio_r1r3 = fun_allNormalized_1(phase_ratio_r1r3);
phase_ratio_r2r3 = fun_allNormalized_1(phase_ratio_r2r3);


figure;
sgtitle('子载波16 ratio曲线');
subplot(3,1,1);
hold on;
plot(abs_ratio_r1r2(16,:),'r');
plot(phase_ratio_r1r2(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('发射天线-1和2比','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,1,2);
hold on;
plot(abs_ratio_r1r3(16,:),'r');
plot(phase_ratio_r1r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('发射天线-1和3比','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');
subplot(3,1,3);
hold on;
plot(abs_ratio_r2r3(16,:),'r');
plot(phase_ratio_r2r3(16,:),'b');
hold off;
set(gca,'FontWeight','bold');
title('发射天线-2和3比','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');



% figure;
% sgtitle('子载波16 ratio幅度曲线');
% subplot(3,1,1);
% plot(abs_ratio_r1r2(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1和2比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% subplot(3,1,2);
% plot(abs_ratio_r1r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1和3比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% subplot(3,1,3);
% plot(abs_ratio_r2r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-2和3比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% 
% figure;
% sgtitle('子载波16 ratio相位曲线');
% subplot(3,1,1);
% plot(phase_ratio_r1r2(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1和2比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');
% subplot(3,1,2);
% plot(phase_ratio_r1r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1和3比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');
% subplot(3,1,3);
% plot(phase_ratio_r2r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-2和3比','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');

%得到振幅数据
abs_t1_r1 = abs(csi_t1_r1);
abs_t1_r2 = abs(csi_t1_r2);
abs_t1_r3 = abs(csi_t1_r3);

% figure;
% plot(abs_t1_r1(16,:));


%% 相位数据处理：原始相位+解卷绕+线性变化
raw_phase_t1_r1 = angle(csi_t1_r1);
raw_phase_t1_r2 = angle(csi_t1_r2);
raw_phase_t1_r3 = angle(csi_t1_r3);

%解卷绕
unwrap_t1_r1 = unwrap(raw_phase_t1_r1);
unwrap_t1_r2 = unwrap(raw_phase_t1_r2);
unwrap_t1_r3 = unwrap(raw_phase_t1_r3);

%线性变化
linear_phase_t1_r1 = func_linear_phase(unwrap_t1_r1);
linear_phase_t1_r2 = func_linear_phase(unwrap_t1_r2);
linear_phase_t1_r3 = func_linear_phase(unwrap_t1_r3);

% %观察相位变化的过程
% %所有子载波
% figure;
% subplot(3,1,1);
% plot(raw_phase_t1_r2.');
% subplot(3,1,2);
% plot(unwrap_t1_r2.');
% subplot(3,1,3);
% plot(linear_phase_t1_r2.');
% 
% figure;
% subplot(3,1,1);
% plot(raw_phase_t1_r2);
% subplot(3,1,2);
% plot(unwrap_t1_r2);
% subplot(3,1,3);
% plot(linear_phase_t1_r2);

%去除振幅和相位异常值
hampel_abs_t1_r1 = Use_hampel(abs_t1_r1);
hampel_abs_t1_r2 = Use_hampel(abs_t1_r2);
hampel_abs_t1_r3 = Use_hampel(abs_t1_r3);

hampel_phase_t1_r1 = Use_hampel(linear_phase_t1_r1);
hampel_phase_t1_r2 = Use_hampel(linear_phase_t1_r2);
hampel_phase_t1_r3 = Use_hampel(linear_phase_t1_r3);

%对振幅和相位进行Savitzky-Golay滤波
sg_abs_t1_r1 = func_sg(hampel_abs_t1_r1);
sg_abs_t1_r2 = func_sg(hampel_abs_t1_r2);
sg_abs_t1_r3 = func_sg(hampel_abs_t1_r3);

sg_phase_t1_r1 = func_sg(hampel_phase_t1_r1);
sg_phase_t1_r2 = func_sg(hampel_phase_t1_r2);
sg_phase_t1_r3 = func_sg(hampel_phase_t1_r3);


% %第16个子载波
% figure;
% sgtitle('子载波16 幅度曲线');
% subplot(3,1,1);
% plot(sg_abs_t1_r1(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-1','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% subplot(3,1,2);
% plot(sg_abs_t1_r2(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-2','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% subplot(3,1,3);
% plot(sg_abs_t1_r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Amplitude Value');
% 
% figure;
% sgtitle('子载波16 相位曲线');
% subplot(3,1,1);
% plot(sg_phase_t1_r1(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-1','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');
% subplot(3,1,2);
% plot(sg_phase_t1_r2(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-2','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');
% subplot(3,1,3);
% plot(sg_phase_t1_r3(16,:));
% set(gca,'FontWeight','bold');
% title('发射天线-1   接收天线-3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Phase Value');
% 
% 
% %复值的重构
% complex_t1_r1 = sg_abs_t1_r1(16,:).*exp(1i*sg_phase_t1_r1(16,:));
% complex_t1_r2 = sg_abs_t1_r2(16,:).*exp(1i*sg_phase_t1_r2(16,:));
% complex_t1_r3 = sg_abs_t1_r3(16,:).*exp(1i*sg_phase_t1_r3(16,:));
% figure;
% plot(complex_t1_r1(94:156));
% hold on;
% plot(complex_t1_r2(94:156));
% plot(complex_t1_r3(94:156));