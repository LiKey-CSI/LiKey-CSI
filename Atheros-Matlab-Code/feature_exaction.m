%% 特征提取：按照分割结果对重构的复值进行特征提取

split_key = Rev2_phase_keypair; % 最后的按键分割结果
Rev1_complex_csi = Rev1_ratio_t1t2_r1;
Rev2_complex_csi = Rev2_ratio_t1t2_r1;

feature_num = 60;
for i = 1:6
    start_index = split_key(i,1);
    end_index = split_key(i,2);
    mean_num = floor((end_index-start_index)./(feature_num+1));

    allsub_feature_REV1 = zeros(56,feature_num);
    allsub_feature_REV2 = zeros(56,feature_num);
    for sub_carrier = 1:56
        mean_REV1 = fun_mean_num_complex(Rev1_complex_csi(sub_carrier,start_index:end_index),mean_num);
        mean_REV1 = fun_calc_rotefeature(mean_REV1);
        allsub_feature_REV1(sub_carrier,:) = interp1(mean_REV1,1:feature_num);
        mean_REV2 = fun_mean_num_complex(Rev2_complex_csi(sub_carrier,start_index:end_index),mean_num);
        mean_REV2 = fun_calc_rotefeature(mean_REV2);
        allsub_feature_REV2(sub_carrier,:) = interp1(mean_REV2,1:feature_num);
    end
    eval(['Rev1_',num2str(i),'=allsub_feature_REV1;']); % 随运行文件需要修改
    eval(['Rev2_',num2str(i),'=allsub_feature_REV2;']); % 随运行文件需要修改
    figure;
    colormap(gray);
    subplot(2,1,1);
    imagesc(allsub_feature_REV1);
    subplot(2,1,2);
    imagesc(allsub_feature_REV2);
end

%% 去除nan值，并进行旋转特征累加和归一化
for i = 1:6
    eval(['Rev1_',num2str(i),'(find(isnan(Rev1_',num2str(i),')==1)) = 0;']);
    eval(['Rev2_',num2str(i),'(find(isnan(Rev2_',num2str(i),')==1)) = 0;']);
end

%% %0
number_index = 9; % 需要随运行而改变
name_start = 6;% 需要随运行而改变
%% %

for i = 1:6
    tmp_feature = eval(['Rev1_',num2str(i),';']);
    for j = 1:56
        tmp_feature(j,:) = func_sum_point(tmp_feature(j,:));
    end
    tmp_feature = func_allNormalized(tmp_feature);
    eval(['Rev1_number',num2str(number_index),'_',num2str(name_start+i),'=tmp_feature;']);
end

for i = 1:6
    tmp_feature = eval(['Rev2_',num2str(i),';']);
    for j = 1:56
        tmp_feature(j,:) = func_sum_point(tmp_feature(j,:));
    end
    tmp_feature = func_allNormalized(tmp_feature);
    eval(['Rev2_number',num2str(number_index),'_',num2str(name_start+i),'=tmp_feature;']);
end

%% 展示最后的特征
figure;
subplot(6,2,1);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+1),'(8,:));']);
subplot(6,2,2);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+1),'(8,:));']);
subplot(6,2,3);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+2),'(8,:));']);
subplot(6,2,4);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+2),'(8,:));']);
subplot(6,2,5);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+3),'(8,:));']);
subplot(6,2,6);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+3),'(8,:));']);
subplot(6,2,7);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+4),'(8,:));']);
subplot(6,2,8);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+4),'(8,:));']);
subplot(6,2,9);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+5),'(8,:));']);
subplot(6,2,10);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+5),'(8,:));']);
subplot(6,2,11);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+6),'(8,:));']);
subplot(6,2,12);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+6),'(8,:));']);

for i = 1:6
    save(['D:\Study\科研\LIKEY\补充实验\补充实验1\Size_2cm\data_feature_60\Rev1\loc1\Rev1_number9_',num2str(i+name_start),'.mat'],['Rev1_number9_',num2str(i+name_start)]);
    save(['D:\Study\科研\LIKEY\补充实验\补充实验1\Size_2cm\data_feature_60\Rev2\loc1\Rev2_number9_',num2str(i+name_start),'.mat'],['Rev2_number9_',num2str(i+name_start)]);
end
% 
% for i = 1:6
%     save(['D:\Study\科研\LIKEY\补充实验\补充实验1\Size_1cm\data_feature_20\Rev1\loc9\Rev1_number9_',num2str(i+name_start),'.mat'],['Rev1_number9_',num2str(i+name_start)]);
%     save(['D:\Study\科研\LIKEY\补充实验\补充实验1\Size_1cm\data_feature_20\Rev2\loc9\Rev2_number9_',num2str(i+name_start),'.mat'],['Rev2_number9_',num2str(i+name_start)]);
% end