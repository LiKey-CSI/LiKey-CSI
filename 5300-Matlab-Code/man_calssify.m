%% 人工进行类别识别
true_label = label_mat;
pred_label = zeros(length(true_label),1);

feature_mat(find(isnan(feature_mat)==1)) = 0;

Rev1_feature = feature_mat(:,1:60);
Rev2_feature = feature_mat(:,61:120);

%% 定义一些标志位
allow_error = 5; %允许的误差
FN_LS = 1;%先逆后顺
FS_LN = -1;%先顺后逆

for i = 1:540
    r1_stats = 0;
    r2_stats = 0;
    r1_tmp_arr = Rev1_feature(i,:);
    r2_tmp_arr = Rev2_feature(i,:);
    
    boundry = 30;
    r1_front_one = length(find(r1_tmp_arr(1:boundry)==1));
    r1_front_negone = length(find(r1_tmp_arr(1:boundry)==-1));
    r1_back_one = length(find(r1_tmp_arr(boundry+1:end)==1));
    r1_back_negone = length(find(r1_tmp_arr(boundry+1:end)==-1));
    
    r2_front_one = length(find(r2_tmp_arr(1:boundry)==1));
    r2_front_negone = length(find(r2_tmp_arr(1:boundry)==-1));
    r2_back_one = length(find(r2_tmp_arr(boundry+1:end)==1));
    r2_back_negone = length(find(r2_tmp_arr(boundry+1:end)==-1));
    
    if ((r1_front_one-r1_front_negone)>=allow_error) && ((r1_back_negone-r1_back_one)>=allow_error)
        r1_stats = FN_LS;
    elseif ((r1_front_negone-r1_front_one)>=allow_error) && ((r1_back_one-r1_back_negone)>=allow_error)
        r1_stats = FS_LN;
    end
    
    if ((r2_front_one-r2_front_negone)>=allow_error) && ((r2_back_negone-r2_back_one)>=allow_error)
        r2_stats = FN_LS;
    elseif ((r2_front_negone-r2_front_one)>=allow_error) && ((r2_back_one-r2_back_negone)>=allow_error)
        r2_stats = FS_LN;
    end
    
    if r1_stats == 0 && r2_stats==FN_LS
        pred_label(i) = 1;
    elseif r1_stats == FN_LS && r2_stats==FN_LS
        pred_label(i) = 2;
    elseif r1_stats == FN_LS && r2_stats==0
        pred_label(i) = 3;
    elseif r1_stats == FS_LN && r2_stats==FN_LS
        pred_label(i) = 4;
    elseif r1_stats == 0 && r2_stats==0
        pred_label(i) = 5;
    elseif r1_stats == FN_LS && r2_stats == FS_LN
        pred_label(i) = 6;
    elseif r1_stats == FS_LN && r2_stats == 0
        pred_label(i) = 7;
    elseif r1_stats == FS_LN && r2_stats == FS_LN
        pred_label(i) = 8;
    elseif r1_stats == 0 && r2_stats == FS_LN
        pred_label(i) = 9;
    end
end

plotconfusion(true_label', pred_label');

acc = length(find(pred_label==true_label))/length(true_label);

figure;
plot(1:length(true_label),true_label.','r-*')
hold on
plot(1:length(pred_label),pred_label.','b:o')
grid on
legend('真实类别','预测类别')
xlabel('测试集样本编号')
ylabel('测试集样本类别')
string = {'测试集预测结果';
          ['准确度 = ' num2str(acc) '%']};
title(string)

%% 绘制混淆矩阵
label_true = categorical(true_label);
label_pred = categorical(pred_label);
plotconfusion(label_true', label_pred');