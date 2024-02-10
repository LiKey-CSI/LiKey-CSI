%% 6月27日更新——生成各个按键的特征文件
clc;
clear;

csi_trace1 = read_bf_file('./data0704/0704W/loc2_p999999_2.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0704/0704Z/loc2_p999999_2.dat');

split_range = [2358,3424;5740,6824;9620,10580];

feature_num = 30;

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

for i =1:length(split_range)
    start_index = split_range(i,1);
    end_index = split_range(i,2);
    mean_num = floor((end_index-start_index)./(feature_num+1));
    feature_tmp = zeros(60,feature_num);
    for sub_carrier = 1:30
        mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);

        mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);


        %% 扩展mean的长度以适应之后的特征数
        mean_REV1_r1r2 = interp1(mean_REV1_r1r2,1:feature_num);
        feature_tmp(sub_carrier*2-1,:) = mean_REV1_r1r2;

        mean_REV2_r1r2 = interp1(mean_REV2_r1r2,1:feature_num);
        feature_tmp(sub_carrier*2,:) = mean_REV2_r1r2;
    end
    eval(['number9_',num2str(i),'=feature_tmp;']);
end

pathname = './按键特征/按键9/';
for i = 1:3
    filename = ['number9_',int2str(i+27)];
    mat_name = ['number9_' , int2str(i+27)];
    %eval(['save([pathname,filename],extract_number' , num2str(i),');']);
    save([pathname,filename],mat_name);
end

figure;
mean_REV1_r1r2 = number9_1(1,:);
mean_REV2_r1r2 = number9_1(2,:);
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
