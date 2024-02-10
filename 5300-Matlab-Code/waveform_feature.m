%% 7��27�ո��¡�����ȡ���ݣ�����Excel�ָ���������Ϊ30*����
clc;
clear;

csi_trace1 = read_bf_file('./data0704/0704W/loc5_p999999_2.dat'); % �����ļ�·��
csi_trace2 = read_bf_file('./data0704/0704Z/loc5_p999999_2.dat');

% csi_trace1 = read_bf_file('./0730/4/0730w/local5_p888888_2.dat'); % �����ļ�·��
% csi_trace2 = read_bf_file('./0730/4/data0730/local5_p888888_2.dat');

% ��ʼλ��
start_pos = 54;

%% ��ȡExcel�ķָ���
[ndata, text, alldata] = xlsread('�����ָ�.xlsx','Sheet2','B100:G100');
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

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;

%�����������
REV1_abs_ratio_r1r2 = abs(REV1_ratio_r1r2);

REV2_abs_ratio_r1r2 = abs(REV2_ratio_r1r2);

%������λ����
REV1_phase_ratio_r1r2 = angle(REV1_ratio_r1r2);

REV2_phase_ratio_r1r2 = angle(REV2_ratio_r1r2);

%ȥ���������λ�쳣ֵ
REV1_abs_ratio_r1r2 = Use_hampel(REV1_abs_ratio_r1r2);

REV2_abs_ratio_r1r2 = Use_hampel(REV2_abs_ratio_r1r2);

REV1_phase_ratio_r1r2 = Use_hampel(REV1_phase_ratio_r1r2);

REV2_phase_ratio_r1r2 = Use_hampel(REV2_phase_ratio_r1r2);

%���������λ����Savitzky-Golay�˲�
REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);

REV2_abs_ratio_r1r2 = func_sg(REV2_abs_ratio_r1r2);

REV1_phase_ratio_r1r2 = func_sg(REV1_phase_ratio_r1r2);

REV2_phase_ratio_r1r2 = func_sg(REV2_phase_ratio_r1r2);


%��һ������
REV1_abs_ratio_r1r2 = fun_allNormalized_1(REV1_abs_ratio_r1r2);

REV1_phase_ratio_r1r2 = fun_allNormalized_1(REV1_phase_ratio_r1r2);

REV2_abs_ratio_r1r2 = fun_allNormalized_1(REV2_abs_ratio_r1r2);

REV2_phase_ratio_r1r2 = fun_allNormalized_1(REV2_phase_ratio_r1r2);

% figure;
% plot(REV1_abs_ratio_r1r2(1,:));

feature_num = 1000;
for i = 1:6
    start_index = split_key(i,1);
    end_index = split_key(i,2);
    
    rev1_waveform_abs = REV1_abs_ratio_r1r2(:,start_index:end_index);
    rev2_waveform_abs = REV2_abs_ratio_r1r2(:,start_index:end_index);
    
    rev1_waveform_phase = REV1_phase_ratio_r1r2(:,start_index:end_index);
    rev2_waveform_phase = REV2_phase_ratio_r1r2(:,start_index:end_index);
    
    rev1_waveform_abs = interp1(rev1_waveform_abs.',1:feature_num).';
    rev2_waveform_abs = interp1(rev2_waveform_abs.',1:feature_num).';
    
    rev1_waveform_phase = interp1(rev1_waveform_phase.',1:feature_num).';
    rev2_waveform_phase = interp1(rev2_waveform_phase.',1:feature_num).';
%     figure;
%     plot(rev1_waveform_abs(1,:));
    
    eval(['Rev1_abs_number9_',num2str(i+start_pos),'=rev1_waveform_abs;']);
    eval(['Rev2_abs_number9_',num2str(i+start_pos),'=rev2_waveform_abs;']);
    eval(['Rev1_phase_number9_',num2str(i+start_pos),'=rev1_waveform_phase;']);
    eval(['Rev2_phase_number9_',num2str(i+start_pos),'=rev2_waveform_phase;']);
    
    
    figure;
    subplot(2,2,1);
    plot(rev1_waveform_abs(1,:));
    subplot(2,2,2);
    plot(rev2_waveform_abs(1,:));
    subplot(2,2,3);
    plot(rev1_waveform_phase(1,:));
    subplot(2,2,4);
    plot(rev2_waveform_phase(1,:));
end

for i = 1:6
    save(['./0704��������/��������/���/Rev1/����9/Rev1_abs_number9_',num2str(i+start_pos),'.mat'],['Rev1_abs_number9_',num2str(i+start_pos)]);
    save(['./0704��������/��������/���/Rev2/����9/Rev2_abs_number9_',num2str(i+start_pos),'.mat'],['Rev2_abs_number9_',num2str(i+start_pos)]);

    save(['./0704��������/��������/��λ/Rev1/����9/Rev1_phase_number9_',num2str(i+start_pos),'.mat'],['Rev1_phase_number9_',num2str(i+start_pos)]);
    save(['./0704��������/��������/��λ/Rev2/����9/Rev2_phase_number9_',num2str(i+start_pos),'.mat'],['Rev2_phase_number9_',num2str(i+start_pos)]);
end

