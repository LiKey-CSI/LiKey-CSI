%% 用来观察本次测试的数据好坏——7月30日更新


% 运行之前先运行new_key_segmentation，确定按键的索引
% % split_key = [1236 2660;4333 5631;7525 8664;10420 11620;13600 14730;16590 17840]; % 6*2的矩阵
% split_key = [1315 2760;4233 5431;6973 8193;9830 11020;12560 13550;15270 16330]; % 6*2的矩阵
% % split_key = [1583 2760;4671 5701;7540 8633;10180 11390;12620 13750;15210 16230]; % 6*2的矩阵
% split_key = [1450 2500;3274 4680;6149 7162;8449 9654;10850 11750;13160 14510]; % 6*2的矩阵
% split_key = [1738 2460;4498 5601;7276 8093;9732 10840;12270 13790;15250 16340]; % 6*2的矩阵

% 每个按键的开始和结束位置
clc;
clear;
%% 读取Excel的分割结果
[ndata, text, alldata] = xlsread('按键分割.xlsx','Sheet3','B57:G57');
point_data = [];
for i = 1:length(text)
    split_maohao = split(text{i},':');
    tmp_data = [str2num(split_maohao{1});str2num(split_maohao{2})];
    point_data = [point_data;tmp_data];
end
split_key = zeros(6,2);
for i = 1:6
    split_key(i,1) = point_data(i*2-1);
    split_key(i,2) = point_data(i*2);
end

csi_trace1 = read_bf_file('./0730/4/0730w/local5_p888888_2.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./0730/4/data0730/local5_p888888_2.dat');

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
% REV1_ratio_r1r2 = REV1_t1_r1([1:30],:)./REV1_t1_r1([8:30,1,2,3,4,5,6,7],:);
REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;
REV1_ratio_r1r3 = REV1_t1_r1./REV1_t1_r3;
REV1_ratio_r2r3 = REV1_t1_r2./REV1_t1_r3;

% REV2_ratio_r1r2 = REV2_t1_r1([1:30],:)./REV2_t1_r1([8:30,1,2,3,4,5,6,7],:);
REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;
REV2_ratio_r1r3 = REV2_t1_r1./REV2_t1_r3;
REV2_ratio_r2r3 = REV2_t1_r2./REV2_t1_r3;

filter_REV1_ratio_r1r2 = func_sg(REV1_ratio_r1r2);
filter_REV1_ratio_r1r3 = func_sg(REV1_ratio_r1r3);
filter_REV1_ratio_r2r3 = func_sg(REV1_ratio_r2r3);
filter_REV2_ratio_r1r2 = func_sg(REV2_ratio_r1r2);
filter_REV2_ratio_r1r3 = func_sg(REV2_ratio_r1r3);
filter_REV2_ratio_r2r3 = func_sg(REV2_ratio_r2r3);


figure;
subplot(2,1,1);
plot(phase(filter_REV1_ratio_r1r2(1,1517:2638)));
subplot(2,1,2);
plot(phase(filter_REV2_ratio_r1r2(1,1517:2638)));

feature_num = 60;
for i = 1:6
    start_index = split_key(i,1);
    end_index = split_key(i,2);
    mean_num = floor((end_index-start_index)./(feature_num+1));

    allsub_feature_REV1_r1r2 = zeros(30,feature_num);
    allsub_feature_REV2_r1r2 = zeros(30,feature_num);
    for sub_carrier = 1:30
        mean_REV1_r1r2 = fun_mean_num_complex(filter_REV1_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
        mean_REV1_r1r2 = fun_calc_rotefeature5(mean_REV1_r1r2);
        allsub_feature_REV1_r1r2(sub_carrier,:) = interp1(mean_REV1_r1r2,1:feature_num);
        mean_REV2_r1r2 = fun_mean_num_complex(filter_REV2_ratio_r1r2(sub_carrier,start_index:end_index),mean_num);
        mean_REV2_r1r2 = fun_calc_rotefeature5(mean_REV2_r1r2);
        allsub_feature_REV2_r1r2(sub_carrier,:) = interp1(mean_REV2_r1r2,1:feature_num);
    end
    eval(['Rev1_number_',num2str(i),'=allsub_feature_REV1_r1r2;']); % 随运行文件需要修改
    eval(['Rev2_number_',num2str(i),'=allsub_feature_REV2_r1r2;']); % 随运行文件需要修改
    figure;
    colormap(gray);
    subplot(2,1,1);
    imagesc(allsub_feature_REV1_r1r2);
    subplot(2,1,2);
    imagesc(allsub_feature_REV2_r1r2);
end

% 30个子载波合为一个
for j = 1:6
    eval(['number_',num2str(j),'=[mode(Rev1_number_',num2str(j),',1),mode(Rev2_number_',num2str(j),',1)];']);
end


for j = 1:6
    eval(['number_',num2str(j),'(find(isnan(number_',num2str(j),')==1))=0;']);
end

for j = 1:6
    eval(['number_',num2str(j),'=func_sum_point(number_',num2str(j),');']);
end


for j = 1:6
    eval(['number_',num2str(j),'=func_one_Normalized(number_',num2str(j),');']);
end

start_pos = 0;
figure;
for i = 1:6
   subplot(3,2,i);
   eval(['plot(number_',num2str(start_pos+i),');']);
end