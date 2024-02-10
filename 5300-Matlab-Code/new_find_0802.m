% 每个按键的开始和结束位置
clc;
clear;


csi_trace1 = read_bf_file('./data0815/REV1/loc9_p999999_2.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./data0815/REV2/loc9_p999999_2.dat'); % 数据文件路径

% csi_trace1 = read_bf_file('./0730/4/0730w/local5_p888888_2.dat'); % 数据文件路径
% csi_trace2 = read_bf_file('./0730/4/data0730/local5_p888888_2.dat');

% 起始位置
start_pos = 102;

%% 读取Excel的分割结果
[ndata, text, alldata] = xlsread('按键分割.xlsx','Sheet5','B98:G98');
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

%% 得到比率数据

REV1_ratio_r1r2 = REV1_t1_r1./REV1_t1_r2;

abs_REV1_ratio_r1r2 = func_sg(abs(REV1_ratio_r1r2));
phase_REV1_ratio_r1r2 = func_sg(angle(REV1_ratio_r1r2));

REV1_recomplie = abs_REV1_ratio_r1r2 .* exp(1i*phase_REV1_ratio_r1r2);

REV2_ratio_r1r2 = REV2_t1_r1./REV2_t1_r2;

abs_REV2_ratio_r1r2 = func_sg(abs(REV2_ratio_r1r2));
phase_REV2_ratio_r1r2 = func_sg(angle(REV2_ratio_r1r2));

REV2_recomplie = abs_REV2_ratio_r1r2 .* exp(1i*phase_REV2_ratio_r1r2);

% show_range = 1988:3400;
% fig1_flag = 1;
% fig2_flag = 1;
% figure;
% for n=show_range
%     subplot(2,1,1);
%     hold on;
%     plot(REV1_recomplie(16,n),'r.');
%     hold off;
%     if fig1_flag
%         fig1_flag = 0;
%         set(gca,'FontWeight','bold');
%         title('Rev1-复数运动','FontWeight','bold','FontSize',14);
%         xlabel('Real');
%         ylabel('Imag');
%     end
%     subplot(2,1,2);
%     hold on;
%     plot(REV2_recomplie(16,n),'b.');
%     hold off;
%     if fig2_flag
%         fig2_flag = 0;
%         set(gca,'FontWeight','bold');
%         title('Rev2-复数运动','FontWeight','bold','FontSize',14);
%         xlabel('Real');
%         ylabel('Imag');
%     end
%     pause(0.01)
% end

feature_num = 60;
for i = 1:6
    start_index = split_key(i,1);
    end_index = split_key(i,2);
    mean_num = floor((end_index-start_index+1)./(feature_num));

    allsub_feature_REV1_r1r2 = zeros(30,feature_num);
    allsub_feature_REV2_r1r2 = zeros(30,feature_num);
    for sub_carrier = 1:30
        mean_REV1_r1r2 = fun_mean_num_complex(REV1_recomplie(sub_carrier,start_index:end_index),mean_num);
        mean_REV1_r1r2 = fun_calc_rotefeature5(mean_REV1_r1r2);
        allsub_feature_REV1_r1r2(sub_carrier,:) = interp1(mean_REV1_r1r2,1:feature_num);
        mean_REV2_r1r2 = fun_mean_num_complex(REV2_recomplie(sub_carrier,start_index:end_index),mean_num);
        mean_REV2_r1r2 = fun_calc_rotefeature5(mean_REV2_r1r2);
        allsub_feature_REV2_r1r2(sub_carrier,:) = interp1(mean_REV2_r1r2,1:feature_num);
    end
    eval(['Rev1_number9_',num2str(i+start_pos),'=allsub_feature_REV1_r1r2;']); % 随运行文件需要修改
    eval(['Rev2_number9_',num2str(i+start_pos),'=allsub_feature_REV2_r1r2;']); % 随运行文件需要修改
    figure;
    colormap(gray);
    subplot(2,1,1);
    imagesc(allsub_feature_REV1_r1r2);
    subplot(2,1,2);
    imagesc(allsub_feature_REV2_r1r2);
end
% 
% 30个子载波合为一个
for j = 1:6
    eval(['number_',num2str(j),'=[mode(Rev1_number9_',num2str(j+start_pos),',1),mode(Rev2_number9_',num2str(j+start_pos),',1)];']);
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

loc_index = 0;
figure;
for i = 1:6
   subplot(3,2,i);
   eval(['plot(number_',num2str(loc_index+i),');']);
end

%归一化处理
REV1_abs_ratio_r1r2 = fun_allNormalized_1(abs_REV1_ratio_r1r2);

REV1_phase_ratio_r1r2 = fun_allNormalized_1(phase_REV1_ratio_r1r2);

REV2_abs_ratio_r1r2 = fun_allNormalized_1(abs_REV2_ratio_r1r2);

REV2_phase_ratio_r1r2 = fun_allNormalized_1(phase_REV2_ratio_r1r2);

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

% % % % % snow
% before = 66;
% after = 62;
% 
% eval(['Rev1_number7_',num2str(before), '= Rev1_number7_',num2str(after),';']);
% eval(['Rev2_number7_',num2str(before), '= Rev2_number7_',num2str(after),';']);
% eval(['Rev1_abs_number7_',num2str(before), '= Rev1_abs_number7_',num2str(after),';']);
% eval(['Rev2_abs_number7_',num2str(before), '= Rev2_abs_number7_',num2str(after),';']);
% eval(['Rev1_phase_number7_',num2str(before), '= Rev1_phase_number7_',num2str(after),';']);
% eval(['Rev2_phase_number7_',num2str(before), '= Rev2_phase_number7_',num2str(after),';']);
% % Rev2_number1_22 = Rev2_number1_19;
% Rev1_abs_number1_22 = Rev1_abs_number1_19;
% Rev2_abs_number1_22 = Rev2_abs_number1_19;
% Rev1_phase_number1_22 = Rev1_phase_number1_19;
% Rev2_phase_number1_22 = Rev2_phase_number1_19;

% snow

for i = 1:6
    save(['./0802按键特征/single_number/Rev1/按键9/Rev1_number9_',num2str(i+start_pos),'.mat'],['Rev1_number9_',num2str(i+start_pos)]);
    save(['./0802按键特征/single_number/Rev2/按键9/Rev2_number9_',num2str(i+start_pos),'.mat'],['Rev2_number9_',num2str(i+start_pos)]);
    
    save(['./0802按键特征/波形特征/振幅/Rev1/按键9/Rev1_abs_number9_',num2str(i+start_pos),'.mat'],['Rev1_abs_number9_',num2str(i+start_pos)]);
    save(['./0802按键特征/波形特征/振幅/Rev2/按键9/Rev2_abs_number9_',num2str(i+start_pos),'.mat'],['Rev2_abs_number9_',num2str(i+start_pos)]);

    save(['./0802按键特征/波形特征/相位/Rev1/按键9/Rev1_phase_number9_',num2str(i+start_pos),'.mat'],['Rev1_phase_number9_',num2str(i+start_pos)]);
    save(['./0802按键特征/波形特征/相位/Rev2/按键9/Rev2_phase_number9_',num2str(i+start_pos),'.mat'],['Rev2_phase_number9_',num2str(i+start_pos)]);
end