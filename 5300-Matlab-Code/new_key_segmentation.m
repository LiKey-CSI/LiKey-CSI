%% 对按键数据进行分割
clc;
clear;
csi_trace1 = read_bf_file('./0730/4/0730w/local5_p777777_1.dat'); % 数据文件路径
csi_trace2 = read_bf_file('./0730/4/data0730/local5_p777777_1.dat');

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


%比率振幅数据
REV1_abs_ratio_r1r2 = abs(REV1_ratio_r1r2);
REV1_abs_ratio_r1r3 = abs(REV1_ratio_r1r3);
REV1_abs_ratio_r2r3 = abs(REV1_ratio_r2r3);

REV2_abs_ratio_r1r2 = abs(REV2_ratio_r1r2);
REV2_abs_ratio_r1r3 = abs(REV2_ratio_r1r3);
REV2_abs_ratio_r2r3 = abs(REV2_ratio_r2r3);

%比率相位数据
REV1_phase_ratio_r1r2 = angle(REV1_ratio_r1r2);
REV1_phase_ratio_r1r3 = angle(REV1_ratio_r1r3);
REV1_phase_ratio_r2r3 = angle(REV1_ratio_r2r3);

REV2_phase_ratio_r1r2 = angle(REV2_ratio_r1r2);
REV2_phase_ratio_r1r3 = angle(REV2_ratio_r1r3);
REV2_phase_ratio_r2r3 = angle(REV2_ratio_r2r3);



%% 画三维图像观察比率数据
x = 1:30;
x1 = repmat(x,length(REV1_ratio_r1r2),1);
x2 = repmat(x,length(REV2_ratio_r1r2),1);
y1 = 1:length(REV1_ratio_r1r2);
y1 = repmat(y1,30,1).';
y2 = 1:length(REV2_ratio_r1r2);
y2 = repmat(y2,30,1).';


% figure;
% subplot(3,1,1);
% plot3(y1,x1,REV1_abs_ratio_r1r2.');
% title('RevW—Ratio-R1R2','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');
% subplot(3,1,2);
% plot3(y1,x1,REV1_abs_ratio_r1r3.');
% title('RevW—Ratio-R1R3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');
% subplot(3,1,3);
% plot3(y1,x1,REV1_abs_ratio_r2r3.');
% title('RevW—Ratio-R2R3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');
% 
% figure;
% subplot(3,1,1);
% plot3(y2,x2,REV2_abs_ratio_r1r2.');
% title('RevZ—Ratio-R1R2','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');
% subplot(3,1,2);
% plot3(y2,x2,REV2_abs_ratio_r1r3.');
% title('RevZ—Ratio-R1R3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');
% subplot(3,1,3);
% plot3(y2,x2,REV2_abs_ratio_r2r3.');
% title('RevZ—Ratio-R2R3','FontWeight','bold','FontSize',14);
% xlabel('CSI Packet index');
% ylabel('Subcarrier number');
% zlabel('Ratio Amplitude');
% set(gca,'FontWeight','bold');

%去除振幅和相位异常值
REV1_abs_ratio_r1r2 = Use_hampel(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = Use_hampel(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = Use_hampel(REV1_abs_ratio_r2r3);

REV2_abs_ratio_r1r2 = Use_hampel(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = Use_hampel(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = Use_hampel(REV2_abs_ratio_r2r3);

REV1_phase_ratio_r1r2 = Use_hampel(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = Use_hampel(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = Use_hampel(REV1_phase_ratio_r2r3);

REV2_phase_ratio_r1r2 = Use_hampel(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = Use_hampel(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = Use_hampel(REV2_phase_ratio_r2r3);

%对振幅和相位进行Savitzky-Golay滤波
REV1_abs_ratio_r1r2 = func_sg(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = func_sg(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = func_sg(REV1_abs_ratio_r2r3);

REV2_abs_ratio_r1r2 = func_sg(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = func_sg(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = func_sg(REV2_abs_ratio_r2r3);

REV1_phase_ratio_r1r2 = func_sg(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = func_sg(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = func_sg(REV1_phase_ratio_r2r3);

REV2_phase_ratio_r1r2 = func_sg(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = func_sg(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = func_sg(REV2_phase_ratio_r2r3);

%归一化处理
REV1_abs_ratio_r1r2 = fun_allNormalized_1(REV1_abs_ratio_r1r2);
REV1_abs_ratio_r1r3 = fun_allNormalized_1(REV1_abs_ratio_r1r3);
REV1_abs_ratio_r2r3 = fun_allNormalized_1(REV1_abs_ratio_r2r3);
REV1_phase_ratio_r1r2 = fun_allNormalized_1(REV1_phase_ratio_r1r2);
REV1_phase_ratio_r1r3 = fun_allNormalized_1(REV1_phase_ratio_r1r3);
REV1_phase_ratio_r2r3 = fun_allNormalized_1(REV1_phase_ratio_r2r3);

REV2_abs_ratio_r1r2 = fun_allNormalized_1(REV2_abs_ratio_r1r2);
REV2_abs_ratio_r1r3 = fun_allNormalized_1(REV2_abs_ratio_r1r3);
REV2_abs_ratio_r2r3 = fun_allNormalized_1(REV2_abs_ratio_r2r3);
REV2_phase_ratio_r1r2 = fun_allNormalized_1(REV2_phase_ratio_r1r2);
REV2_phase_ratio_r1r3 = fun_allNormalized_1(REV2_phase_ratio_r1r3);
REV2_phase_ratio_r2r3 = fun_allNormalized_1(REV2_phase_ratio_r2r3);

%% 将多个天线的数据进行合并并PCA主成分分析
REV1_abs_csi = [REV1_abs_ratio_r1r2;REV1_abs_ratio_r1r3;REV1_abs_ratio_r2r3];
REV2_abs_csi = [REV2_abs_ratio_r1r2;REV2_abs_ratio_r1r3;REV2_abs_ratio_r2r3];

REV1_phase_csi = [REV1_phase_ratio_r1r2;REV1_phase_ratio_r1r3;REV1_phase_ratio_r2r3];
REV2_phase_csi = [REV2_phase_ratio_r1r2;REV2_phase_ratio_r1r3;REV2_phase_ratio_r2r3];

[COEFF1 ,SCORE1,latent1] = pca(REV1_abs_csi.');
explained1 = 100*latent1/sum(latent1);%计算贡献率
REV1_first_abs_csi = SCORE1(:,1);

[COEFF2,SCORE2,latent2] = pca(REV1_phase_csi.');
explained2 = 100*latent2/sum(latent2);%计算贡献率
REV1_first_phase_csi = SCORE2(:,1);

[COEFF3 ,SCORE3,latent3] = pca(REV2_abs_csi.');
explained3 = 100*latent3/sum(latent3);%计算贡献率
REV2_first_abs_csi = SCORE3(:,1);

[COEFF4,SCORE4,latent4] = pca(REV2_phase_csi.');
explained4 = 100*latent4/sum(latent4);%计算贡献率
REV2_first_phase_csi = SCORE4(:,1);

figure;
subplot(2,1,1);
hold on;
plot(REV1_first_abs_csi,'r');
plot(REV2_first_abs_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('预处理后——振幅第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

subplot(2,1,2);
hold on;
plot(REV1_first_phase_csi,'r');
plot(REV2_first_phase_csi,'b');
legend("Line1","Line2");
hold off;
set(gca,'FontWeight','bold');
title('预处理后——相位第一主成分','FontWeight','bold','FontSize',14);
xlabel('CSI Packet index');
ylabel('Value');

% %% 针对4个一维数据进行按键分割处理
% 
% choose_data = REV1_first_phase_csi;
% choose_data = (choose_data-min(choose_data))./(max(choose_data)-min(choose_data));
% 
% choose_data = smoothdata(choose_data,'gaussian',300);
% % smooth_data2 = smoothdata(choose_data,'gaussian',300);
% % figure;
% % subplot(3,1,1);
% % plot(choose_data);
% % subplot(3,1,2);
% % plot(smooth_data);
% % subplot(3,1,3);
% % plot(smooth_data2);
% 
% 
% % MD = 300;
% % MPH = 0.1;
% [pks,locs] = findpeaks(choose_data);
% % [pks,locs] = findpeaks(choose_data,'MinPeakDistance',MD,'MinPeakHeight',MPH);
% % [pks,locs] = findpeaks(choose_data,'MinPeakDistance',MD,'MinPeakHeight',MPH);
% % figure;
% % plot(choose_data);
% % hold on;
% % plot(locs,pks,'ro');
% % hold off;
% 
% neg_choose_data = 1 - choose_data;
% [pks2,locs2] = findpeaks(neg_choose_data);
% % [pks2,locs2] = findpeaks(neg_choose_data,'MinPeakDistance',MD,'MinPeakHeight',MPH);
% % figure;
% % plot(neg_choose_data);
% % hold on;
% % plot(locs2,pks2,'ro');
% % hold off;
% 
% figure;
% plot(choose_data);
% hold on;
% plot(locs,choose_data(locs,:),'ro');
% plot(locs2,choose_data(locs2,:),'go');
% hold off;
% 
% %合并峰值索引和谷值索引
% store_index = sort([locs;locs2]);
% index_value = choose_data(store_index,:);
% 
% %从目前记录的索引值中寻找关键值
% i = 1;
% diff_threshold = 0.1;
% key_count = 0;
% keytime_pair = [];
% while i<length(store_index)
%     if (abs(index_value(i+1)-index_value(i))) < diff_threshold
%         i = i+1;
%         continue;
%     end
%     
%     tmp_set = store_index(i);
%     %开始寻找本次按键的大致结束位置
%     while i<length(store_index)
%         if (abs(index_value(i+1)-index_value(i))) >= diff_threshold
%             i = i+1;
%             continue;
%         end
%         
%         tmp_set = [tmp_set store_index(i)];
%         key_count = key_count + 1;
%         i = i + 1;
%         keytime_pair = [keytime_pair;tmp_set];
%         tmp_set = [];
%         break;
%     end
% end
% 
% % %从目前记录的索引值中寻找关键值
% % i = 1;
% % diff_threshold = 0.1;
% % key_count = 0;
% % keytime_pair = [];
% % direction_flag = 0;
% % diff_value = 0;
% % while i<length(store_index)
% %     if (abs(index_value(i+1)-index_value(i))) < diff_threshold
% %         i = i+1;
% %         continue;
% %     end
% %     if(index_value(i+1)-index_value(i))>0
% %         direction_flag = 1;%表示向上增长的方向
% %         diff_value = index_value(i+1)-index_value(i);
% %     else
% %         direction_flag = -1;
% %         diff_value = -1*(index_value(i+1)-index_value(i));
% %     end
% %     tmp_set = store_index(i);
% %     %开始寻找本次按键的大致结束位置
% %     while i<length(store_index)
% %         if direction_flag == 1 && (index_value(i+1)-index_value(i))>0
% %             i = i+1;
% %             continue;
% %         end
% %         if direction_flag == -1 && (index_value(i+1)-index_value(i))<0
% %             i = i+1;
% %             continue;
% %         end
% %         if (abs(index_value(i+1)-index_value(i))) < diff_value-0.35
% %             i = i+1;
% %             continue;
% %         end
% %         
% %         tmp_set = [tmp_set store_index(i+1)];
% %         key_count = key_count + 1;
% %         keytime_pair = [keytime_pair;tmp_set];
% %         tmp_set = [];
% %         i = i + 1;
% %         break;
% %     end
% % end
% 
% 
% %对索引值进行调整
% %若前后两个索引值相差较大，则极有可能是不小心将一个按键分成了两个
% i = 1;
% while i<length(keytime_pair)
%     judg_index1 = keytime_pair(i,1);
%     judg_index2 = keytime_pair(i+1,1);
%     if(abs(choose_data(judg_index2)-choose_data(judg_index1)) > 0.25)
%        keytime_pair(i,2) = keytime_pair(i+1,2);
%        keytime_pair(i+1,:) = [];
%     else
%         i = i + 1;
%     end
% end
% 
% i = 1;
% while i<length(keytime_pair)
%     if(keytime_pair(i,2)-keytime_pair(i,1))<300
%         keytime_pair(i,:) = [];
%     end
%     i = i + 1;
% end
% 
% 
% % %真实的前后两个索引的值应该相差大于0.1
% % i = 1;
% % while i<length(store_index)
% %    if abs((index_value(i+1)-index_value(i)))<0.1
% %        store_index(i) = [];
% %        index_value(i) = [];
% %    else
% %        i = i + 1;
% %    end
% % end
% 
% figure;
% plot(choose_data,'k');
% hold on;
% plot(keytime_pair(:,1),choose_data(keytime_pair(:,1)),'ro');
% plot(keytime_pair(:,2),choose_data(keytime_pair(:,2)),'bo');
% hold off;
% 
% 
% 
% %% 方差阈值确立点
% choose_data = REV1_first_abs_csi;
% choose_data = (choose_data-min(choose_data))./(max(choose_data)-min(choose_data));
% 
% window_size = 300;%设置滑动窗口的大小
% var_pca = movvar(choose_data,window_size);
% var_store_index = [];
% figure;
% plot(var_pca);
% threshold_var = 0.005;
% %方差阈值，可视情况调整
% %将小于阈值的都置为0
% for i = 1:length(var_pca)-1
%     if var_pca(i)<threshold_var
%         var_pca(i) = 0;
%     end
% end
% % figure;
% % plot(var_pca);
% 
% %寻找并记录边界值
% var_store_index = [];
% for i = 1:length(var_pca)-1
%     if var_pca(i)==0 && var_pca(i+1)>0
%         var_store_index = [var_store_index i+1];
%     end
%     if var_pca(i+1)==0 && var_pca(i)>0
%         var_store_index = [var_store_index i+1];
%     end
% end
% 
% i = 1;
% while i<length(var_store_index)
%     if(var_store_index(i+1)-var_store_index(i))<200
%         var_store_index(i:i+1) = [];
%     else
%         i = i+1;
%     end
% end
% 
% i = 1;
% while i<length(var_store_index)
%     if abs(choose_data(var_store_index(i+1))-choose_data(var_store_index(i)))>0.3
%         var_store_index(i+1) = [];
%     else
%         i = i+1;
%     end
% end
% 
% figure;
% plot(choose_data,'k');
% hold on;
% plot(var_store_index,choose_data(var_store_index),'ro');
% hold off;
% 
% %确立每个按键大致开始时间和结束时间
% i = 1;
% len = length(var_store_index);
% start_end = [];
% while(i<=len)
%     find_value = var_store_index(i)+800;
%     [~,ind] = min(abs(var_store_index-find_value));
%     start_end = [start_end;var_store_index(i) var_store_index(ind)];
%     i = ind + 1;
% end
% %去除后续冗杂部分
% pass_num = 10;
% start_end = start_end(1:pass_num,:);
% % figure;
% % plot(choose_data,'k');
% % hold on;
% % plot(start_end(:,1),choose_data(start_end(:,1)),'ro');
% % plot(start_end(:,2),choose_data(start_end(:,2)),'bo');
% % hold off;
% 
% %在大致的开始和结束时间往左往右寻找极值点，确立最终每个区间位置
% span_distance = 300;
% for i=1:length(start_end)
%     for j = start_end(i,1):-1:start_end(i,1)-span_distance
%         if(choose_data(j)<choose_data(j+1) && choose_data(j)<choose_data(j-1)) || (choose_data(j)>choose_data(j+1) && choose_data(j)>choose_data(j-1))
%             start_end(i,1) = j;
%             break;
%         end
%     end
%     for j = start_end(i,2):1:start_end(i,2)+span_distance
%         if(choose_data(j)<choose_data(j+1) && choose_data(j)<choose_data(j-1)) || (choose_data(j)>choose_data(j+1) && choose_data(j)>choose_data(j-1))
%             start_end(i,2) = j;
%             break;
%         end
%     end
% end
% figure;
% plot(choose_data,'k');
% hold on;
% plot(start_end(:,1),choose_data(start_end(:,1)),'ro');
% plot(start_end(:,2),choose_data(start_end(:,2)),'bo');
% hold off;