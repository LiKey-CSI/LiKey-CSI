%% 比较利用比率得到的复数图像和利用原始天线振幅和校正后相位重新组合的复数图像
clc;
clear;
csi_trace1 = read_bf_file('./data0704/0704W/loc3_p111111_1.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0704/0704Z/loc3_p111111_1.dat');

REV1_t1_r1 = zeros(30,length(csi_trace1));
REV1_t1_r2 = zeros(30,length(csi_trace1));
REV1_t1_r3 = zeros(30,length(csi_trace1));
REV2_t1_r1 = zeros(30,length(csi_trace2));
REV2_t1_r2 = zeros(30,length(csi_trace2));
REV2_t1_r3 = zeros(30,length(csi_trace2));

for i = 1:length(csi_trace1)
    csi_entry = csi_trace1{i};
    csi = get_scaled_csi(csi_entry);
    REV1_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV1_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV1_t1_r3(:,i) = squeeze(csi(1,3,:));
end

for i = 1:length(csi_trace2)
    csi_entry = csi_trace2{i};
    csi = get_scaled_csi(csi_entry);
    REV2_t1_r1(:,i) = squeeze(csi(1,1,:));
    REV2_t1_r2(:,i) = squeeze(csi(1,2,:));
    REV2_t1_r3(:,i) = squeeze(csi(1,3,:));
end

% subcarrier = 16;
% show_range = 3572:4021;
% fig1_flag = 1;
% fig2_flag = 1;
% figure;
% for n=show_range
%     disp(n);
%     subplot(2,1,1);
%     hold on;
%     plot(REV1_t1_r1(subcarrier,n),'r.');
%     hold off;
%     if fig1_flag
%         fig1_flag = 0;
%         set(gca,'FontWeight','bold');
%         title('Rev-W复数运动','FontWeight','bold','FontSize',14);
%         xlabel('Real');
%         ylabel('Imag');
%     end
%     subplot(2,1,2);
%     hold on;
%     plot(REV2_t1_r1(subcarrier,n),'b.');
%     hold off;
%     if fig2_flag
%         fig2_flag = 0;
%         set(gca,'FontWeight','bold');
%         title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
%         xlabel('Real');
%         ylabel('Imag');
%     end
%     pause(0.001)
% end

%% 相位数据处理：原始相位+解卷绕+线性变化
REV1_raw_phase_t1_r1 = angle(REV1_t1_r1);
REV1_raw_phase_t1_r2 = angle(REV1_t1_r2);
REV1_raw_phase_t1_r3 = angle(REV1_t1_r3);

%解卷绕
REV1_unwrap_t1_r1 = unwrap(REV1_raw_phase_t1_r1);
REV1_unwrap_t1_r2 = unwrap(REV1_raw_phase_t1_r2);
REV1_unwrap_t1_r3 = unwrap(REV1_raw_phase_t1_r3);

%线性变化
REV1_linear_phase_t1_r1 = func_linear_phase(REV1_unwrap_t1_r1);
REV1_linear_phase_t1_r2 = func_linear_phase(REV1_unwrap_t1_r2);
REV1_linear_phase_t1_r3 = func_linear_phase(REV1_unwrap_t1_r3);


%% 相位数据处理：原始相位+解卷绕+线性变化
REV2_raw_phase_t1_r1 = angle(REV2_t1_r1);
REV2_raw_phase_t1_r2 = angle(REV2_t1_r2);
REV2_raw_phase_t1_r3 = angle(REV2_t1_r3);

%解卷绕
REV2_unwrap_t1_r1 = unwrap(REV2_raw_phase_t1_r1);
REV2_unwrap_t1_r2 = unwrap(REV2_raw_phase_t1_r2);
REV2_unwrap_t1_r3 = unwrap(REV2_raw_phase_t1_r3);

%线性变化
REV2_linear_phase_t1_r1 = func_linear_phase(REV2_unwrap_t1_r1);
REV2_linear_phase_t1_r2 = func_linear_phase(REV2_unwrap_t1_r2);
REV2_linear_phase_t1_r3 = func_linear_phase(REV2_unwrap_t1_r3);

%取得振幅
REV1_abs_t1_r1 = abs(REV1_t1_r1);
REV1_abs_t1_r2 = abs(REV1_t1_r2);
REV1_abs_t1_r3 = abs(REV1_t1_r3);

REV2_abs_t1_r1 = abs(REV2_t1_r1);
REV2_abs_t1_r2 = abs(REV2_t1_r2);
REV2_abs_t1_r3 = abs(REV2_t1_r3);

%去除振幅和相位异常值
REV1_abs_t1_r1 = Use_hampel(REV1_abs_t1_r1);
REV1_abs_t1_r2 = Use_hampel(REV1_abs_t1_r2);
REV1_abs_t1_r3 = Use_hampel(REV1_abs_t1_r3);

REV2_abs_t1_r1 = Use_hampel(REV2_abs_t1_r1);
REV2_abs_t1_r2 = Use_hampel(REV2_abs_t1_r2);
REV2_abs_t1_r3 = Use_hampel(REV2_abs_t1_r3);

REV1_linear_phase_t1_r1 = Use_hampel(REV1_linear_phase_t1_r1);
REV1_linear_phase_t1_r2 = Use_hampel(REV1_linear_phase_t1_r2);
REV1_linear_phase_t1_r3 = Use_hampel(REV1_linear_phase_t1_r3);

REV2_linear_phase_t1_r1 = Use_hampel(REV2_linear_phase_t1_r1);
REV2_linear_phase_t1_r2 = Use_hampel(REV2_linear_phase_t1_r2);
REV2_linear_phase_t1_r3 = Use_hampel(REV2_linear_phase_t1_r3);

%对振幅和相位进行Savitzky-Golay滤波
REV1_abs_t1_r1 = func_sg(REV1_abs_t1_r1);
REV1_abs_t1_r2 = func_sg(REV1_abs_t1_r2);
REV1_abs_t1_r3 = func_sg(REV1_abs_t1_r3);

REV2_abs_t1_r1 = func_sg(REV2_abs_t1_r1);
REV2_abs_t1_r2 = func_sg(REV2_abs_t1_r2);
REV2_abs_t1_r3 = func_sg(REV2_abs_t1_r3);

REV1_linear_phase_t1_r1 = func_sg(REV1_linear_phase_t1_r1);
REV1_linear_phase_t1_r2 = func_sg(REV1_linear_phase_t1_r2);
REV1_linear_phase_t1_r3 = func_sg(REV1_linear_phase_t1_r3);

REV2_linear_phase_t1_r1 = func_sg(REV2_linear_phase_t1_r1);
REV2_linear_phase_t1_r2 = func_sg(REV2_linear_phase_t1_r2);
REV2_linear_phase_t1_r3 = func_sg(REV2_linear_phase_t1_r3);

subcarrier = 16;
%复值的重构
REV1_complex_t1_r1 = REV1_abs_t1_r1(subcarrier,:).*exp(1i*REV1_linear_phase_t1_r1(subcarrier,:));
REV1_complex_t1_r2 = REV1_abs_t1_r2(subcarrier,:).*exp(1i*REV1_linear_phase_t1_r2(subcarrier,:));
REV1_complex_t1_r3 = REV1_abs_t1_r3(subcarrier,:).*exp(1i*REV1_linear_phase_t1_r3(subcarrier,:));

REV2_complex_t1_r1 = REV2_abs_t1_r1(subcarrier,:).*exp(1i*REV2_linear_phase_t1_r1(subcarrier,:));
REV2_complex_t1_r2 = REV2_abs_t1_r2(subcarrier,:).*exp(1i*REV2_linear_phase_t1_r2(subcarrier,:));
REV2_complex_t1_r3 = REV2_abs_t1_r3(subcarrier,:).*exp(1i*REV2_linear_phase_t1_r3(subcarrier,:));


%% 得到比率数据
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;
REV2_ratio_r1r3 = REV2_t1_r1./REV2_t1_r3;
REV2_ratio_r2r3 = REV2_t1_r2./REV2_t1_r3;

filter_REV1_ratio_r1r2 = func_sg(REV1_ratio_r1r2);
filter_REV1_ratio_r1r3 = func_sg(REV1_ratio_r1r3);
filter_REV1_ratio_r2r3 = func_sg(REV1_ratio_r2r3);
filter_REV2_ratio_r1r2 = func_sg(REV2_ratio_r1r2);
filter_REV2_ratio_r1r3 = func_sg(REV2_ratio_r1r3);
filter_REV2_ratio_r2r3 = func_sg(REV2_ratio_r2r3);

% 观察复数运动
show_range = 1708:3179;
fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range
    disp(n);
    subplot(2,1,1);
    hold on;
    plot(REV1_complex_t1_r1(n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(REV2_complex_t1_r1(n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end

% figure;
% subplot(2,1,1);
% plot(REV1_t1_r1(subcarrier,show_range),'r.');
% subplot(2,1,2);
% plot(REV2_t1_r1(subcarrier,show_range),'b.');

figure;
subplot(2,1,1);
plot(REV1_complex_t1_r1(show_range),'r.');
subplot(2,1,2);
plot(REV2_complex_t1_r1(show_range),'b.');

figure;
subplot(2,1,1);
plot(REV1_complex_t1_r2(show_range),'r.');
subplot(2,1,2);
plot(REV2_complex_t1_r2(show_range),'b.');

figure;
subplot(2,1,1);
plot(REV1_complex_t1_r3(show_range),'r.');
subplot(2,1,2);
plot(REV2_complex_t1_r3(show_range),'b.');

% 观察复数运动
show_range = 1708:3179;
fig1_flag = 1;
fig2_flag = 1;
figure;
for n=show_range
    disp(n);
    subplot(2,1,1);
    hold on;
    plot(filter_REV1_ratio_r1r2(subcarrier,n),'r.');
    hold off;
    if fig1_flag
        fig1_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-W复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    subplot(2,1,2);
    hold on;
    plot(filter_REV2_ratio_r1r2(subcarrier,n),'b.');
    hold off;
    if fig2_flag
        fig2_flag = 0;
        set(gca,'FontWeight','bold');
        title('Rev-Z复数运动','FontWeight','bold','FontSize',14);
        xlabel('Real');
        ylabel('Imag');
    end
    pause(0.001)
end


figure;
subplot(2,1,1);
plot(filter_REV1_ratio_r1r2(subcarrier,show_range),'r.');
subplot(2,1,2);
plot(filter_REV2_ratio_r1r2(subcarrier,show_range),'b.');

figure;
subplot(2,1,1);
plot(filter_REV1_ratio_r1r3(subcarrier,show_range),'r.');
subplot(2,1,2);
plot(filter_REV2_ratio_r1r3(subcarrier,show_range),'b.');

figure;
subplot(2,1,1);
plot(filter_REV1_ratio_r2r3(subcarrier,show_range),'r.');
subplot(2,1,2);
plot(filter_REV2_ratio_r2r3(subcarrier,show_range),'b.');

sub_carrier = subcarrier;
feature_num = 30;
start_index = show_range(1);
end_index = show_range(end);
mean_num = floor((end_index-start_index)./(feature_num+1));

mean_REV1_r1r2 = fun_mean_num_complex(REV1_complex_t1_r1(start_index:end_index),mean_num);
mean_REV1_r1r3 = fun_mean_num_complex(REV1_complex_t1_r2(start_index:end_index),mean_num);
mean_REV1_r2r3 = fun_mean_num_complex(REV1_complex_t1_r3(start_index:end_index),mean_num);

mean_REV2_r1r2 = fun_mean_num_complex(REV2_complex_t1_r1(start_index:end_index),mean_num);
mean_REV2_r1r3 = fun_mean_num_complex(REV2_complex_t1_r2(start_index:end_index),mean_num);
mean_REV2_r2r3 = fun_mean_num_complex(REV2_complex_t1_r3(start_index:end_index),mean_num);

figure;
subplot(2,1,1);
plot(mean_REV1_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(mean_REV1_r1r2));
text(real(mean_REV1_r1r2),imag(mean_REV1_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV1--Complex','FontWeight','bold','FontSize',14);
subplot(2,1,2);
plot(mean_REV2_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',6);
text_c = string(1:length(mean_REV2_r1r2));
text(real(mean_REV2_r1r2),imag(mean_REV2_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV2--Complex','FontWeight','bold','FontSize',14);
sgtitle('复数求取--方法1','FontSize',20);

%% 扩展mean的长度以适应之后的特征数
mean_REV1_r1r2 = interp1(mean_REV1_r1r2,1:feature_num+2);
mean_REV1_r1r3 = interp1(mean_REV1_r1r3,1:feature_num+2);
mean_REV1_r2r3 = interp1(mean_REV1_r2r3,1:feature_num+2);

mean_REV2_r1r2 = interp1(mean_REV2_r1r2,1:feature_num+2);
mean_REV2_r1r3 = interp1(mean_REV2_r1r3,1:feature_num+2);
mean_REV2_r2r3 = interp1(mean_REV2_r2r3,1:feature_num+2);

feature_REV1_r1r2 = fun_calc_rotefeature(mean_REV1_r1r2);
feature_REV1_r1r3 = fun_calc_rotefeature(mean_REV1_r1r3);
feature_REV1_r2r3 = fun_calc_rotefeature(mean_REV1_r2r3);

feature_REV2_r1r2 = fun_calc_rotefeature(mean_REV2_r1r2);
feature_REV2_r1r3 = fun_calc_rotefeature(mean_REV2_r1r3);
feature_REV2_r2r3 = fun_calc_rotefeature(mean_REV2_r2r3);

figure;
subplot(2,3,1);
plot(feature_REV1_r1r2,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,2);
plot(feature_REV1_r1r3,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,3);
plot(feature_REV1_r2r3,'ro');
hold on;
plot(zeros(length(feature_REV1_r2r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,4);
plot(feature_REV2_r1r2,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,5);
plot(feature_REV2_r1r3,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,6);
plot(feature_REV2_r2r3,'bo');
hold on;
plot(zeros(length(feature_REV2_r2r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);



mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
mean_REV1_r1r3 = fun_mean_num_complex(filter_REV1_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
mean_REV1_r2r3 = fun_mean_num_complex(filter_REV1_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);

mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
mean_REV2_r1r3 = fun_mean_num_complex(filter_REV2_ratio_r1r3(sub_carrier,start_index:end_index),mean_num);
mean_REV2_r2r3 = fun_mean_num_complex(filter_REV2_ratio_r2r3(sub_carrier,start_index:end_index),mean_num);

figure;
subplot(2,1,1);
plot(mean_REV1_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(mean_REV1_r1r2));
text(real(mean_REV1_r1r2),imag(mean_REV1_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV1--Complex','FontWeight','bold','FontSize',14);
subplot(2,1,2);
plot(mean_REV2_r1r2,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.39,0.58,0.93],'MarkerSize',6);
text_c = string(1:length(mean_REV2_r1r2));
text(real(mean_REV2_r1r2),imag(mean_REV2_r1r2),text_c,'FontSize',12);
set(gca,'FontWeight','bold');
title('REV2--Complex','FontWeight','bold','FontSize',14);
sgtitle('复数求取--方法2','FontSize',20);

%% 扩展mean的长度以适应之后的特征数
mean_REV1_r1r2 = interp1(mean_REV1_r1r2,1:feature_num+2);
mean_REV1_r1r3 = interp1(mean_REV1_r1r3,1:feature_num+2);
mean_REV1_r2r3 = interp1(mean_REV1_r2r3,1:feature_num+2);

mean_REV2_r1r2 = interp1(mean_REV2_r1r2,1:feature_num+2);
mean_REV2_r1r3 = interp1(mean_REV2_r1r3,1:feature_num+2);
mean_REV2_r2r3 = interp1(mean_REV2_r2r3,1:feature_num+2);

% feature_REV1_r1r2 = fun_calc_rotefeature(mean_REV1_r1r2);
% feature_REV1_r1r3 = fun_calc_rotefeature(mean_REV1_r1r3);
% feature_REV1_r2r3 = fun_calc_rotefeature(mean_REV1_r2r3);
% 
% feature_REV2_r1r2 = fun_calc_rotefeature(mean_REV2_r1r2);
% feature_REV2_r1r3 = fun_calc_rotefeature(mean_REV2_r1r3);
% feature_REV2_r2r3 = fun_calc_rotefeature(mean_REV2_r2r3);
% 
% feature_REV1_r1r2 = fun_calc_rotefeature2(mean_REV1_r1r2);
% feature_REV1_r1r3 = fun_calc_rotefeature2(mean_REV1_r1r3);
% feature_REV1_r2r3 = fun_calc_rotefeature2(mean_REV1_r2r3);
% 
% feature_REV2_r1r2 = fun_calc_rotefeature2(mean_REV2_r1r2);
% feature_REV2_r1r3 = fun_calc_rotefeature2(mean_REV2_r1r3);
% feature_REV2_r2r3 = fun_calc_rotefeature2(mean_REV2_r2r3);
% 
% feature_REV1_r1r2 = fun_calc_rotefeature3(mean_REV1_r1r2);
% feature_REV1_r1r3 = fun_calc_rotefeature3(mean_REV1_r1r3);
% feature_REV1_r2r3 = fun_calc_rotefeature3(mean_REV1_r2r3);
% 
% feature_REV2_r1r2 = fun_calc_rotefeature3(mean_REV2_r1r2);
% feature_REV2_r1r3 = fun_calc_rotefeature3(mean_REV2_r1r3);
% feature_REV2_r2r3 = fun_calc_rotefeature3(mean_REV2_r2r3);
% 
% feature_REV1_r1r2 = fun_calc_rotefeature4(mean_REV1_r1r2);
% feature_REV1_r1r3 = fun_calc_rotefeature4(mean_REV1_r1r3);
% feature_REV1_r2r3 = fun_calc_rotefeature4(mean_REV1_r2r3);
% 
% feature_REV2_r1r2 = fun_calc_rotefeature4(mean_REV2_r1r2);
% feature_REV2_r1r3 = fun_calc_rotefeature4(mean_REV2_r1r3);
% feature_REV2_r2r3 = fun_calc_rotefeature4(mean_REV2_r2r3);

feature_REV1_r1r2 = fun_calc_rotefeature5(mean_REV1_r1r2);
feature_REV1_r1r3 = fun_calc_rotefeature5(mean_REV1_r1r3);
feature_REV1_r2r3 = fun_calc_rotefeature5(mean_REV1_r2r3);

feature_REV2_r1r2 = fun_calc_rotefeature5(mean_REV2_r1r2);
feature_REV2_r1r3 = fun_calc_rotefeature5(mean_REV2_r1r3);
feature_REV2_r2r3 = fun_calc_rotefeature5(mean_REV2_r2r3);

figure;
subplot(2,1,1);
plot(feature_REV1_r1r2,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);

subplot(2,1,2);
plot(feature_REV2_r1r2,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);


figure;
subplot(2,3,1);
plot(feature_REV1_r1r2,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,2);
plot(feature_REV1_r1r3,'ro');
hold on;
plot(zeros(length(feature_REV1_r1r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,3);
plot(feature_REV1_r2r3,'ro');
hold on;
plot(zeros(length(feature_REV1_r2r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev1-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,4);
plot(feature_REV2_r1r2,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r2)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R2复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,5);
plot(feature_REV2_r1r3,'bo');
hold on;
plot(zeros(length(feature_REV2_r1r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R1R3复数运动方向判断','FontWeight','bold','FontSize',14);
subplot(2,3,6);
plot(feature_REV2_r2r3,'bo');
hold on;
plot(zeros(length(feature_REV2_r2r3)),'LineWidth',2);
hold off;
set(gca,'FontWeight','bold');
title('Rev2-R2R3复数运动方向判断','FontWeight','bold','FontSize',14);


