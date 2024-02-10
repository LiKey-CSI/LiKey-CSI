%% 测试关于复数的归一化问题
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

Rev1_tmp_real = fun_norm_one(real(mean_REV1_r1r2));
Rev1_tmp_imag = fun_norm_one(imag(mean_REV1_r1r2));
Rev2_tmp_real = fun_norm_one(real(mean_REV2_r1r2));
Rev2_tmp_imag = fun_norm_one(imag(mean_REV2_r1r2));
figure;
subplot(2,1,1);
plot(Rev1_tmp_real,Rev1_tmp_imag,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(Rev1_tmp_real));
text(Rev1_tmp_real,Rev1_tmp_imag,text_c,'FontSize',12);
subplot(2,1,2);
plot(Rev2_tmp_real,Rev2_tmp_imag,'o','Color',[0.13,0.54,0.13],'MarkerFaceColor',[0.69,0.13,0.13],'MarkerSize',6);
text_c = string(1:length(Rev2_tmp_real));
text(Rev2_tmp_real,Rev2_tmp_imag,text_c,'FontSize',12);

Rev1_tmp_complex = Rev1_tmp_real + 1i*Rev1_tmp_imag;
Rev2_tmp_complex = Rev2_tmp_real + 1i*Rev2_tmp_imag;

feature_REV1_r1r2 = fun_calc_rotefeature5(Rev1_tmp_complex);

feature_REV2_r1r2 = fun_calc_rotefeature5(Rev2_tmp_complex);

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


%% 不同子载波的特征表现
clc;
clear;

csi_trace1 = read_bf_file('./data0704/0704W/loc_p111111_1.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0704/0704Z/loc_p111111_1.dat');

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

% figure;
% subplot(2,1,1);
% plot(abs(REV1_t1_r1(1,:)));
% subplot(2,1,2);
% plot(abs(REV2_t1_r1(1,:)));

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


feature_num = 60;
start_index = 2017;
end_index = 3146;
mean_num = floor((end_index-start_index)./(feature_num+1));

allsub_feature_REV1_r1r2 = zeros(30,feature_num);
allsub_feature_REV2_r1r2 = zeros(30,feature_num);
for sub_carrier = 1:30
    mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
    allsub_feature_REV1_r1r2(sub_carrier,:) = fun_calc_rotefeature5(mean_REV1_r1r2);
    mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
    allsub_feature_REV2_r1r2(sub_carrier,:) = fun_calc_rotefeature5(mean_REV2_r1r2);
end

figure;
colormap(gray);
imagesc(allsub_feature_REV1_r1r2);
figure;
colormap(gray);
imagesc(allsub_feature_REV2_r1r2);