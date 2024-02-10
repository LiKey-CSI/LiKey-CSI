%% 7��26�ո��¡�����ȡ���ݣ�����Excel�ָ���������Ϊ������ת�����ľ���feature_num*30
clc;
clear;

csi_trace1 = read_bf_file('./data0704/0704W/loc_p666666_1.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./data0704/0704Z/loc_p666666_1.dat');

% ��ʼλ��
start_pos = 0;

%% ��ȡExcel�ķָ���
[ndata, text, alldata] = xlsread('�����ָ�.xlsx','Sheet2','B58:G58');
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

%% �õ���������
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
    eval(['Rev1_number9_',num2str(i+start_pos),'=allsub_feature_REV1_r1r2;']); % �������ļ���Ҫ�޸�
    eval(['Rev2_number9_',num2str(i+start_pos),'=allsub_feature_REV2_r1r2;']); % �������ļ���Ҫ�޸�
    figure;
    colormap(gray);
    subplot(2,1,1);
    imagesc(allsub_feature_REV1_r1r2);
    subplot(2,1,2);
    imagesc(allsub_feature_REV2_r1r2);
end

for i = 1:6
    save(['./0704��������/Rev1/����9/Rev1_number9_',num2str(i+start_pos),'.mat'],['Rev1_number9_',num2str(i+start_pos)]);
    save(['./0704��������/Rev2/����9/Rev2_number9_',num2str(i+start_pos),'.mat'],['Rev2_number9_',num2str(i+start_pos)]);
end